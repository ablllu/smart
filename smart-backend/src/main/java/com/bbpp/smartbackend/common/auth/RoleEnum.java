package com.bbpp.smartbackend.common.auth;

/**
 * 角色枚举 — 五角色层级体系
 *
 * 层级: SUPER_ADMIN(4) > OPERATOR(3) > MERCHANT(2) > CS(1) > BUYER(0)
 * - 高级别角色的 satisfies() 自动满足低级别
 * - SUPER_ADMIN 的 isSuperAdmin() 绕过所有权限检查
 * - BUYER 在拦截器层被拒绝访问管理后台
 */
public enum RoleEnum {

    BUYER(0),         // 买家 — C端用户，不允许访问管理后台
    CS(1),            // 客服 — 处理纠纷 + 退款
    MERCHANT(2),      // 商家 — 管理自己店铺（商品/订单/发货）
    OPERATOR(3),      // 运营人员 — 商品审核 + 订单管理 + 用户管理
    SUPER_ADMIN(4);   // 超级管理员 — 管一切

    private final int level;

    RoleEnum(int level) {
        this.level = level;
    }

    public int getLevel() {
        return level;
    }


    public boolean satisfies(RoleEnum required) {
        return this.level >= required.level;
    }

    public boolean isSuperAdmin() {
        return this == SUPER_ADMIN;
    }

    /**
     * 从字符串解析，无法识别时默认BUYER
     */
    public static RoleEnum fromString(String s) {
        if(s == null || s.trim().isEmpty()) {
            return BUYER;
        }

        try {
            return valueOf(s.toUpperCase());
        } catch (IllegalArgumentException e) {
            return BUYER;
        }
    }
}


