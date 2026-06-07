package com.bbpp.smartbackend.common.auth;

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RequireRole {

    /**
     * 允许访问的角色列表，满足其中任意一个即可
     * SUPER_ADMIN 自动通过所有检查，无需显式列出
     */
    String[] value();
}

