package com.bbpp.smartbackend.framework.interceptor;


import com.bbpp.smartbackend.common.utils.MemberJwtUtil;
import io.jsonwebtoken.Claims;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * C端会员拦截器
 * 和管理后台 LoginInterceptor 的区别：
 * - 不强制登录（没 token 也放行）
 * - 不检查角色
 * - 只负责解析 token 并存 ThreadLocal
 */
@Component
public class MemberInterceptor implements HandlerInterceptor {

    private final MemberJwtUtil memberJwtUtil;
    public MemberInterceptor(MemberJwtUtil memberJwtUtil) {
        this.memberJwtUtil = memberJwtUtil;
    }

    private static final ThreadLocal< Long> MEMBER_ID = new ThreadLocal<>();
    private static final ThreadLocal< String> MEMBER_USERNAME = new ThreadLocal<>();

    public static Long getMemberId() {
        return MEMBER_ID.get();
    }
    public static String getMemberUsername() {
        return MEMBER_USERNAME.get();
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String token = request.getHeader("Authorization");
        if (token == null || token.isEmpty()) {
            return true; // 没登陆也放行
        }
        try {
            Claims claims = memberJwtUtil.parseToken(token);
            MEMBER_ID.set(((Number) claims.get("memberId")).longValue());
            MEMBER_USERNAME.set((String) claims.get("username"));
        } catch (Exception e) {
            // token 无效也放行，接口自己判断
        }
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        MEMBER_ID.remove();
        MEMBER_USERNAME.remove();
    }
}
