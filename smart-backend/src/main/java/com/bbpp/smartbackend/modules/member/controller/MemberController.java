package com.bbpp.smartbackend.modules.member.controller;


import com.bbpp.smartbackend.common.audit.AuditLogAnnotation;
import com.bbpp.smartbackend.common.idempotent.Idempotent;
import com.bbpp.smartbackend.common.log.OperationLogAnnotation;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.member.dto.MemberPageDTO;
import com.bbpp.smartbackend.modules.member.entity.Member;
import com.bbpp.smartbackend.modules.member.service.MemberService;
import com.bbpp.smartbackend.modules.member.vo.MemberDetailVO;
import com.bbpp.smartbackend.modules.member.vo.MemberVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

@Tag(name = "会员模块")
@RestController
@RequestMapping("/admin/member")
public class MemberController {
    private final MemberService memberService;

    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @Operation(summary = "会员分页")
    @GetMapping("/page")
    public Result<PageResult<MemberVO>> page(MemberPageDTO dto) {

        return Result.success(memberService.page(dto));
    }

    @Operation(summary = "会员详情")
    @GetMapping("/{id}")
    public Result<MemberDetailVO> detail(@PathVariable Long id) {

        return Result.success(memberService.detail(id));
    }

    @Idempotent(timeout = 5)
    @Operation(summary = "启用/禁用会员")
    @OperationLogAnnotation(value = "启用/禁用会员")
    @AuditLogAnnotation(module = "会员管理", operation = "启用/禁用会员", entityClass = Member.class)
    @PutMapping("/{id}/status")
    public Result<?> updateStatus(@PathVariable Long id, Integer
            status) {
        memberService.updateStatus(id, status);
        return Result.success();
    }
}
