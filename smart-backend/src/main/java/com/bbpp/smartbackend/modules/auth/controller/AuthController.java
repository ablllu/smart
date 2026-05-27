package com.bbpp.smartbackend.modules.auth.controller;


import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.auth.dto.LoginDTO;
import com.bbpp.smartbackend.modules.auth.service.AuthService;
import com.bbpp.smartbackend.modules.auth.vo.CurrentUserVO;
import com.bbpp.smartbackend.modules.auth.vo.LoginVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Tag(name = "认证管理")
@RestController
@RequestMapping("/auth")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @Operation(summary = "登录")
    @PostMapping("/login")
    public Result<LoginVO> login(@Valid @RequestBody LoginDTO dto) {
        return Result.success(authService.login(dto));
    }

    @Operation(summary = "获取当前用户信息")
    @GetMapping("/me")
    public Result<CurrentUserVO> me() {

        return Result.success(authService.me());
    }

    @Operation(summary = "登出")
    @PostMapping("/logout")
    public Result<?> logout(
            @RequestHeader("Authorization") String token
    ) {

        authService.logout(token);
        return Result.success();
    }
}
