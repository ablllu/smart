package com.bbpp.smartbackend.modules.member.entity;


import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@TableName("ums_member")
public class Member {

    private Long id;

    private String username;

    private String password;

    private String nickname;

    private String phone;

    private String email;

    private String avatar;

    private Integer gender; // 1-男 2-女

    private LocalDate birthday;

    private Integer memberLevel; // 1-普通会员 2-银卡 3-金卡

    private Integer status; // 0-禁用 1-启用

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @TableLogic
    private Integer deleted;
}
