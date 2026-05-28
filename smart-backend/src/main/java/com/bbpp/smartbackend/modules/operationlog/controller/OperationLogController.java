package com.bbpp.smartbackend.modules.operationlog.controller;

import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.operationlog.dto.OperationLogPageDTO;
import com.bbpp.smartbackend.modules.operationlog.entity.OperationLog;
import com.bbpp.smartbackend.modules.operationlog.service.OperationLogService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "日志管理")
@RestController
@RequestMapping("/operationLogs")
public class OperationLogController {

    private final OperationLogService operationLogService;

    public OperationLogController(OperationLogService operationLogService) {
        this.operationLogService = operationLogService;
    }

    @GetMapping("/page")
    public Result<PageResult<OperationLog>> page(OperationLogPageDTO dto) {

        return Result.success(operationLogService.page(dto));
    }
}
