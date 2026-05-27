package com.bbpp.smartbackend.framework.aspect;

import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.idempotent.Idempotent;
import com.bbpp.smartbackend.common.utils.RedisUtils;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Aspect
@Component
public class IdempotentAspect { // 幂等切面

    private final RedisUtils redisUtils;


    public IdempotentAspect(RedisUtils redisUtils) {
        this.redisUtils = redisUtils;
    }

    @Before("@annotation(idempotent)")
    public void check(Idempotent idempotent) {
        // 动态获取Request , 避免构造器注入的线程安全问题
        ServletRequestAttributes attributes =
                (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();

        if(attributes == null) {
            return;
        }

        HttpServletRequest request = attributes.getRequest();

        // 获取TOKEN
        String token = request.getHeader("Authorization");

        if( token == null) {
            return;
        }

        // 请求路径
        String path = request.getRequestURI();

        // 幂等 key
        String key = "idempotent:" + token + ":" +path;

        //判断是否重复
        Boolean exists = redisUtils.hasKey(key);

        if(Boolean.TRUE.equals( exists)) {

            throw new BusinessException(400, "请勿重复提交");
        }

        // 写入 redis
        redisUtils.set(key, 1, idempotent.timeout() * 1000);
    }

}
