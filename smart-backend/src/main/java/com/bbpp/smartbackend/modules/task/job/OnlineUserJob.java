package com.bbpp.smartbackend.modules.task.job;

import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Slf4j
@Component
public class OnlineUserJob {

    private final RedisTemplate<String, Object> redisTemplate;

    public OnlineUserJob(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    @Scheduled(cron = "0/5 * * * * ?")
    public void statOnlineUsers() {
        // 统计五分钟内活跃用户数
        Long count = redisTemplate.keys("active:*").stream().count();

        log.info("当前在线用户数：{}", count);
    }
}
