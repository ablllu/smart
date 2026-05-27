package com.bbpp.smartbackend.modules.member.service;


import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.member.dto.MemberPageDTO;
import com.bbpp.smartbackend.modules.member.vo.MemberDetailVO;
import com.bbpp.smartbackend.modules.member.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public interface MemberService {

    PageResult<MemberVO> page(MemberPageDTO dto);

    MemberDetailVO detail(Long id);

    void updateStatus(Long id, Integer status);
}
