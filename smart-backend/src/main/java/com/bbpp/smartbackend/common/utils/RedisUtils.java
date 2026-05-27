package com.bbpp.smartbackend.common.utils;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;


@Component
public class RedisUtils {

    private final RedisTemplate<String, Object> redisTemplate;

    public RedisUtils(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public void set(
            String key,
            Object value,
            Long  timeout
    ) {

        redisTemplate.opsForValue().set(
                key,
                value,
                timeout,
                TimeUnit.MILLISECONDS
        );
    }

    public Object get(String key) {

        return redisTemplate.opsForValue().get(key);
    }

    public void delete(String key) {

        redisTemplate.delete(key);
    }

    public Boolean hasKey(String key) {

        return redisTemplate.hasKey(key);
    }
}
