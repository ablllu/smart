package com.bbpp.smartbackend.modules.member.controller;

import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.member.dto.MemberLoginDTO;
import com.bbpp.smartbackend.modules.member.dto.MemberRegisterDTO;
import com.bbpp.smartbackend.modules.member.service.MemberService;
import com.bbpp.smartbackend.modules.member.vo.MemberLoginVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@Tag(name = "C端-会员")
@RestController
@RequestMapping("/api/member")
public class ShopMemberController {

    private final MemberService memberService;

    public ShopMemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @Operation(summary = "会员注册")
    @PostMapping("/register")
    public Result<?> register(@Valid @RequestBody MemberRegisterDTO dto) {
        memberService.register(dto);
        return Result.success();
    }

    @Operation(summary = "会员登录")
    @PostMapping("/login")
    public Result<MemberLoginVO> login(@Valid @RequestBody MemberLoginDTO dto) {
        return Result.success(memberService.login(dto));
    }
}
