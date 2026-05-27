package com.bbpp.smartbackend.modules.user.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;


@Data
public class UserUpdateDTO {
    @NotBlank(message = "用户名不能为空")
    @Size(max = 30, message = "用户名长度不能超过30个字符")
    private String username;

    @NotBlank(message = "昵称不能为空")
    @Size(max = 10, message = "昵称长度不能超过10个字符")
    private String nickname;

    private String password;

    private String phone;

    private String email;

    private Integer status;

    private String avatar;
}
