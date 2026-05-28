package com.bbpp.smartbackend.modules.auth.controller;


import com.bbpp.smartbackend.common.audit.AuditLogAnnotation;
import com.bbpp.smartbackend.common.log.OperationLogAnnotation;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.auth.dto.LoginDTO;
import com.bbpp.smartbackend.modules.auth.service.AuthService;
import com.bbpp.smartbackend.modules.auth.vo.CurrentUserVO;
import com.bbpp.smartbackend.modules.auth.vo.LoginVO;
import com.bbpp.smartbackend.modules.operationlog.entity.OperationLog;
import com.bbpp.smartbackend.modules.operationlog.mapper.OperationLogMapper;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Tag(name = "认证管理")
@RestController
@RequestMapping("/auth")
public class AuthController {

    private final AuthService authService;
    private final HttpServletRequest request;
    private final OperationLogMapper operationLogMapper;

    public AuthController(
            AuthService authService,
            HttpServletRequest request,
            OperationLogMapper operationLogMapper
    ) {
        this.authService = authService;
        this.request = request;
        this.operationLogMapper = operationLogMapper;
    }
    @Operation(summary = "登录")
    @OperationLogAnnotation(value = "用户登录")
    @PostMapping("/login")
    public Result<LoginVO> login(@Valid @RequestBody LoginDTO dto) {

        try {
            return Result.success(authService.login(dto));
        } catch (Exception e) {
            // ← 新加：失败手动记录
            OperationLog failLog = new OperationLog();
            failLog.setUsername(dto.getUsername());
            failLog.setOperation("登录失败: " + e.getMessage());
            failLog.setMethod("POST");
            failLog.setPath("/auth/login");
            String realIp = request.getHeader("X-Forwarded-For");
            if (realIp == null || realIp.isEmpty()) {
                realIp = request.getHeader("X-Real-IP");
            }
            if (realIp == null || realIp.isEmpty()) {
                realIp = request.getRemoteAddr();
            }
            if (realIp != null && realIp.contains(",")) {
                realIp = realIp.split(",")[0].trim();
            }
            failLog.setIp(realIp);
            operationLogMapper.insert(failLog);
            throw e;
        }
    }

    @Operation(summary = "获取当前用户信息")
    @GetMapping("/me")
    public Result<CurrentUserVO> me() {

        return Result.success(authService.me());
    }

    @Operation(summary = "登出")
    @OperationLogAnnotation(value = "用户登出")
    @PostMapping("/logout")
    public Result<?> logout(
            @RequestHeader("Authorization") String token
    ) {

        authService.logout(token);
        return Result.success();
    }
}
