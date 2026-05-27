package com.bbpp.smartbackend.modules.product.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
    分类
    id: 分类id
    name: 分类名称
    parentId: 父级分类id
    icon: 分类图标
    sortNum: 排序
    status: 状态
    deleted: 逻辑删除
    createTime: 创建时间
    updateTime: 更新时间
    deleted: 逻辑删除
 */
@Data
@TableName("pms_category")
public class Category {

    private Long id;

    private String name;

    private Long parentId;

    private String icon;

    private Integer sortNum;

    private Integer status;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @TableLogic
    private Integer deleted;
}
