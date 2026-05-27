package com.bbpp.smartbackend.framework.interceptor;


import com.bbpp.smartbackend.common.auth.LoginUser;
import com.bbpp.smartbackend.common.auth.RequireRole;
import com.bbpp.smartbackend.common.auth.UserContext;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.utils.JwtUtil;
import com.bbpp.smartbackend.common.utils.RedisUtils;
import io.jsonwebtoken.Claims;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    private final JwtUtil jwtUtil;

    private final RedisUtils redisUtils;

    public LoginInterceptor(JwtUtil jwtUtil, RedisUtils redisUtils) {
        this.jwtUtil = jwtUtil;
        this.redisUtils = redisUtils;
    }

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler
    ) {

        // 获取请求头token
        String token = request.getHeader("Authorization");

        // token不存在
        if(token == null || token.isEmpty()) {
            throw new BusinessException(401, "未登录");
        }

        //解析TOKEN，获取用户ID、username和role （只捕获解析异常)
        try {
            Claims claims = jwtUtil.parseToken(token);

            Long userId = ((Number) claims.get("userId")).longValue();

            String username = (String) claims.get("username");

            String role = (String) claims.get("role");

            // 检查TOKEN是否存在
            Boolean exists =
                    redisUtils.hasKey(
                            "login:" + token
                    );

            if (Boolean.FALSE.equals(exists)) {

                throw new BusinessException(
                        401,
                        "登录已失效"
                );
            }

            // 更新用户最后活跃时间（5分钟过期）
            String activeKey = "active:" + userId;
            redisUtils.set(activeKey, System.currentTimeMillis(), 5*60*1000L);

            // 保存到上下文
            UserContext.set(
                    new LoginUser(userId, username, role)
            );


        } catch (Exception e) {

            throw new BusinessException(401, "token无效或已过期");
        }


        // 权限校验
        if(handler instanceof HandlerMethod) {

            HandlerMethod method = (HandlerMethod) handler;
            RequireRole requireRole = method.getMethodAnnotation(RequireRole.class);

            if(requireRole != null) {

                String needRole = requireRole.value();

                LoginUser loginUser = UserContext.get();

                if(!needRole.equals(loginUser.getRole())) {

                    throw new BusinessException(403, "无权限访问");
                }
            }
        }

        return true;

    }


    @Override
    public void afterCompletion(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            Exception ex
    ) {

        // 请求结束请理ThreadLocal
        UserContext.remove();
    }

}
