package com.bbpp.smartbackend.modules.member.service;


import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.member.dto.MemberLoginDTO;
import com.bbpp.smartbackend.modules.member.dto.MemberPageDTO;
import com.bbpp.smartbackend.modules.member.dto.MemberRegisterDTO;
import com.bbpp.smartbackend.modules.member.entity.Member;
import com.bbpp.smartbackend.modules.member.vo.MemberDetailVO;
import com.bbpp.smartbackend.modules.member.vo.MemberLoginVO;
import com.bbpp.smartbackend.modules.member.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public interface MemberService {

    PageResult<MemberVO> page(MemberPageDTO dto);

    MemberDetailVO detail(Long id);

    void updateStatus(Long id, Integer status);

    /** C端：会员注册 */
    void register(MemberRegisterDTO dto);

    /** C端：会员登录 */
    MemberLoginVO login(MemberLoginDTO dto);

    /** C端：根据用户名查询 */
    Member getByUsername(String username);

}
