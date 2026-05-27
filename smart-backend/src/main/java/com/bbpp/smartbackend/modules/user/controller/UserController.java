package com.bbpp.smartbackend.modules.user.controller;


import com.bbpp.smartbackend.common.audit.AuditLogAnnotation;
import com.bbpp.smartbackend.common.auth.RequireRole;
import com.bbpp.smartbackend.common.idempotent.Idempotent;
import com.bbpp.smartbackend.common.log.OperationLogAnnotation;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.common.utils.ExcelUtils;
import com.bbpp.smartbackend.modules.user.dto.UserCreateDTO;
import com.bbpp.smartbackend.modules.user.dto.UserPageDTO;
import com.bbpp.smartbackend.modules.user.dto.UserUpdateDTO;
import com.bbpp.smartbackend.modules.user.entity.User;
import com.bbpp.smartbackend.modules.user.service.UserService;
import com.bbpp.smartbackend.modules.user.vo.UserDetailVO;
import com.bbpp.smartbackend.modules.user.vo.UserVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Tag(name = "用户管理")
@RestController
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @Operation(summary = "获取用户列表") // 接口描述
    @GetMapping
    public Result<List<UserVO>> list() {
        return Result.success(userService.listUsers());
    }

    @Operation(summary = "测试异常")
    @GetMapping("/test-error")
    public Result<?> testError() {
        int a = 1 / 0;
        return Result.success();
    }

    @Idempotent(timeout = 5) // 幂等
    @Operation(summary = "创建用户")
    @PostMapping("/create")
    public Result<?> createUser(@Valid @RequestBody UserCreateDTO dto) {
        userService.createUser(dto);

        return Result.success();
    }

    @Operation(summary = "通过用户名获取用户")
    @GetMapping("/user")
    public Result<User> getUser(@RequestParam String username) {

        User user = userService.getUserByUsername(username);
        return Result.success(user);
    }

    @Operation(summary = "获取用户详情")
    @GetMapping("/{id}")
    public Result<UserDetailVO> datial(@PathVariable Long id) {

        return Result.success(userService.getUserById(id));
    }

    @AuditLogAnnotation(module = "用户管理", operation = "更新用户")
    @Operation(summary = "更新用户")
    @PutMapping("/{id}")
    public Result<?> update(@PathVariable Long id, @Valid @RequestBody UserUpdateDTO dto) {

        userService.updateUser(id, dto);

        return Result.success();
    }

    @Operation(summary = "删除用户")
    @OperationLogAnnotation(value = "删除用户") // 记录操作日志
    @RequireRole("ADMIN")
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {

        userService.deleteUser(id);

        return Result.success();
    }


    /*
    为什么这里不用 @RequestBody？
    因为GET 请求参数来自 URL 而不是body，
    Spring 会自动封装：?pageNum=1&pageSize=10到 DTO。
     */
    @Operation(summary = "分页查询用户")
    @GetMapping("/page")
    public Result<PageResult<UserDetailVO>> page(UserPageDTO dto) {

        return Result.success(userService.pageUsers(dto));
    }

    @Operation(summary = "导出用户")
    @GetMapping("/export/excel")
    public void export(
            HttpServletResponse response //HTTP 响应对象，用于输出 Excel 文件流
    ) throws Exception {

        List<UserDetailVO> list = userService.listAll();

        List<String> headers = Arrays.asList(
                "ID",
                "用户名",
                "昵称",
                "邮箱",
                "手机号"
        );

        List<List<Object>> rows = new ArrayList<>();

        for(UserDetailVO user: list) {

            rows.add(
                    Arrays.asList(
                        user.getId(),
                        user.getUsername(),
                        user.getNickname(),
                        user.getEmail(),
                        user.getPhone()
                    )
            );
        }

        ExcelUtils.export(
                response,
                "用户列表",
                "users",
                headers,
                rows
        );
    }

    @Operation(summary = "导入用户")
    @PostMapping("/import/excel")
    public Result<?> importExcel(
            @RequestParam("file") MultipartFile file
    ) throws Exception {

        userService.importUsers(file);

        return Result.success();
    }
}
