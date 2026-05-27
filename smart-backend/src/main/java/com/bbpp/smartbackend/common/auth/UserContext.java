package com.bbpp.smartbackend.common.auth;

public class UserContext {

    private static final ThreadLocal<LoginUser> THREAD_LOCAL = new ThreadLocal<>();

    // 保存当前用户
    public static void set(LoginUser loginUser) {
        THREAD_LOCAL.set(loginUser);
    }

    // 获取当前用户
    public static LoginUser get() {
        return THREAD_LOCAL.get();
    }

    // 清除(销毁线程，否则会OOM）
    public static void remove() {
        THREAD_LOCAL.remove();
    }

}
