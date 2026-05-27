package com.bbpp.smartbackend.modules.user.entity;


import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.lang.reflect.Field;
import java.time.LocalDateTime;

@Data
@TableName("sys_user")
public class User {

    private Long id;

    private String username;

    private String password;

    private String nickname;

    private String phone;

    private String email;

    private Integer status;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    private String role;

   @TableLogic
    private Integer deleted;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    private String avatar;
}
