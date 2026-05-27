package com.bbpp.smartbackend.framework.config;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;

@Configuration
public class RedisConfig {

    @Bean
    public RedisTemplate<String, Object> redisTemplate(
            RedisConnectionFactory factory
    ) {
        RedisTemplate<String, Object> template =
                new RedisTemplate<>();

        template.setConnectionFactory(factory);

        // key 序列化
        template.setKeySerializer(
                new StringRedisSerializer()
        );

        // value 序列化
        GenericJackson2JsonRedisSerializer serializer = createSerializer();
        template.setValueSerializer(serializer);
        template.setHashValueSerializer(serializer);

        return template;
    }

    private GenericJackson2JsonRedisSerializer createSerializer() {
        ObjectMapper mapper = new ObjectMapper();

        // 启用类型信息， 防止反序列化时出现ClassCastException
        mapper.activateDefaultTyping(
                LaissezFaireSubTypeValidator.instance,
                ObjectMapper.DefaultTyping.NON_FINAL,
                JsonTypeInfo.As.PROPERTY
        );
        return new GenericJackson2JsonRedisSerializer();
    }

}
