package com.bbpp.smartbackend.modules.member.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.common.utils.MemberJwtUtil;
import com.bbpp.smartbackend.modules.member.dto.MemberLoginDTO;
import com.bbpp.smartbackend.modules.member.dto.MemberPageDTO;
import com.bbpp.smartbackend.modules.member.dto.MemberRegisterDTO;
import com.bbpp.smartbackend.modules.member.entity.Address;
import com.bbpp.smartbackend.modules.member.entity.Member;
import com.bbpp.smartbackend.modules.member.mapper.AdressMapper;
import com.bbpp.smartbackend.modules.member.mapper.MemberMapper;
import com.bbpp.smartbackend.modules.member.service.MemberService;
import com.bbpp.smartbackend.modules.member.vo.MemberDetailVO;
import com.bbpp.smartbackend.modules.member.vo.MemberLoginVO;
import com.bbpp.smartbackend.modules.member.vo.MemberVO;
import org.springframework.beans.BeanUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;
    private final AdressMapper addressMapper;
    private final MemberJwtUtil memberJwtUtil;

    public MemberServiceImpl(MemberMapper memberMapper, AdressMapper addressMapper,
                              MemberJwtUtil memberJwtUtil) {
        this.memberMapper = memberMapper;
        this.addressMapper = addressMapper;
        this.memberJwtUtil = memberJwtUtil;
    }

    @Override
    public PageResult<MemberVO> page(MemberPageDTO dto) {
        // 创建分页对象
        Page<Member> page = new Page<>(dto.getPageNum(), dto.getPageSize());

        // 创建查询条件
        LambdaQueryWrapper<Member> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(
                StringUtils.hasText(dto.getUsername()),
                Member::getUsername,
                dto.getUsername()
        ).like(
                StringUtils.hasText(dto.getPhone()),
                Member::getPhone,
                dto.getPhone()
        ).eq(
                dto.getStatus() != null,
                Member::getStatus,
                dto.getStatus()
        ).orderByDesc(Member::getCreateTime);

        // 查询
        Page<Member> result = memberMapper.selectPage(page, wrapper);


        List<MemberVO> records = result.getRecords().stream().map(this::toVO).collect(Collectors.toList());

        return new PageResult<>(result.getTotal(), records);
    }

    private MemberVO toVO(Member member) {
        MemberVO vo = new MemberVO();
        BeanUtils.copyProperties(member, vo);
        return vo;
    }

    @Override
    public MemberDetailVO detail(Long id) {
        Member member = memberMapper.selectById(id);
        if(member == null) {
            throw new BusinessException("会员不存在");
        }
        MemberDetailVO vo = new MemberDetailVO();
        BeanUtils.copyProperties(member, vo);

        // 查询该会员的收货地址
        LambdaQueryWrapper<Address> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Address::getMemberId, id).orderByDesc(Address::getIsDefault);
        List<Address> addresses = addressMapper.selectList(wrapper);

        List<MemberDetailVO.AddressVO> addressVOS = addresses.stream().map(address -> {
            MemberDetailVO.AddressVO addressVO = new MemberDetailVO.AddressVO();
            BeanUtils.copyProperties(address, addressVO);
            return addressVO;
        }).collect(Collectors.toList());

        vo.setAddresses(addressVOS);
        return vo;
    }


    @Override
    public void updateStatus(Long id, Integer status) {
        Member member = memberMapper.selectById(id);
        if(member == null) {
            throw new BusinessException("会员不存在");
        }
        member.setStatus(status);
        memberMapper.updateById(member);
    }

    @Override
    public void register(MemberRegisterDTO dto) {
        // 检查用户名是否已存在
        Member exist = memberMapper.selectOne(
                new LambdaQueryWrapper<Member>().eq(Member::getUsername, dto.getUsername())
        );
        if( exist != null) {
            throw new BusinessException(400, "用户名已存在");
        }

        Member member = new Member();
        member.setUsername(dto.getUsername());
        member.setPassword(new BCryptPasswordEncoder().encode(dto.getPassword()));
        member.setNickname(dto.getNickname() != null ? dto.getNickname() : dto.getUsername());
        member.setStatus(1);
        memberMapper.insert(member);
    }

    @Override
    public Member getByUsername(String username) {
        return memberMapper.selectOne(
                new LambdaQueryWrapper<Member>().eq(Member::getUsername, username)
        );
    }

    @Override
    public MemberLoginVO login(MemberLoginDTO dto) {
        Member member = getByUsername(dto.getUsername());
        if (member == null) {
            throw new BusinessException(400, "用户名或密码错误");
        }
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        if (!encoder.matches(dto.getPassword(), member.getPassword())) {
            throw new BusinessException(400, "用户名或密码错误");
        }
        if (member.getStatus() == 0) {
            throw new BusinessException(403, "账号已被禁用");
        }

        String token = memberJwtUtil.generateToken(member.getId(), member.getUsername());
        MemberLoginVO vo = new MemberLoginVO();
        vo.setMemberId(member.getId());
        vo.setUsername(member.getUsername());
        vo.setNickname(member.getNickname());
        vo.setToken(token);
        return vo;
    }
}
