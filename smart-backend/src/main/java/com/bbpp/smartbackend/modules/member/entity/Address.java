package com.bbpp.smartbackend.modules.member.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("ums_address")
public class Address {

    private Long id;

    private Long memberId; // 会员ID

    private String name; // 收货人

    private String phone; // 收货人手机

    private String province; // 省

    private String city;  // 市

    private String district; // 区

    private String detail; // 详细地址

    private Integer isDefault; // 是否默认地址(0-否, 1-是)

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @TableLogic
    private Integer deleted;
}
