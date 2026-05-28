package com.bbpp.smartbackend.modules.auditlog.controller;


import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.auditlog.dto.AuditLogPageDTO;
import com.bbpp.smartbackend.modules.auditlog.entity.AuditLog;
import com.bbpp.smartbackend.modules.auditlog.service.AuditLogService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "审计日志管理")
@RestController
@RequestMapping("/auditLogs")
public class AuditLogController {

    private final AuditLogService auditLogService;

    public AuditLogController(AuditLogService auditLogService) {
        this.auditLogService = auditLogService;
    }

    @Operation(summary = "分页查询审计日志")
    @GetMapping("/page")
    public Result<PageResult<AuditLog>> page(AuditLogPageDTO dto) {
        return Result.success(auditLogService.page(dto));
    }
}
