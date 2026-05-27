package com.bbpp.smartbackend.modules.menu.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;


/**
 * 菜单
 * | 字段         | 含义       |
 * | ---------- | -------- |
 * | parent_id  | 父菜单      |
 * | name       | 菜单名      |
 * | path       | 前端路由     |
 * | component  | Vue页面    |
 * | permission | 权限标识     |
 * | type       | 目录/菜单/按钮 |
 * | sort_num   | 排序       |
 */
@Data
@TableName("sys_menu")
public class Menu {

    private Long id;

    private Long parentId;

    private String name;

    private String path;

    private String component;

    private String permission;

    private Integer type;

    private Integer sortNum;
}
