package com.bbpp.smartbackend.modules.user.dto;

import lombok.Data;

import javax.validation.constraints.*;

@Data
public class UserCreateDTO {

    @NotBlank(message = "用户名不能为空")
    @Size(min = 3, max = 20, message = "用户名长度必须在3到20个字符之间")
    private String username;


    @NotBlank(message = "密码不能为空")
    @Size(min = 6, max = 20, message = "密码长度必须在6到20个字符之间")
    private String password;

    private String nickname;

    private String avatar;

//    @Pattern(regexp = "^1[3-9]\\d{9}$", message = "手机号格式不正确")
//    private String phone;
//
//    @Email(message = "邮箱格式不正确")
//    private String email;
//
//    @Min(value = 0, message = "状态值不能小于0")
//    @Max(value = 1, message = "状态值不能大于1")
//    private Integer status;
}


