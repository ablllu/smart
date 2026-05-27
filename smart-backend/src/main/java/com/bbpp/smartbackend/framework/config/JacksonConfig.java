package com.bbpp.smartbackend.framework.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

/**
 * Jackson 配置类
 * 解决前端 Long 类型精度丢失问题，将 Long 序列化为字符串
 */
@Configuration
public class JacksonConfig {

    @Bean
    public ObjectMapper objectMapper(Jackson2ObjectMapperBuilder builder) {
        ObjectMapper objectMapper = builder.createXmlMapper(false).build();

        // 创建 SimpleModule 并注册 Long 类型的自定义序列化器
        SimpleModule simpleModule = new SimpleModule();
        // 将 Long 类型序列化为字符串
        simpleModule.addSerializer(Long.class, ToStringSerializer.instance);
        // 将 long 基本类型也序列化为字符串
        simpleModule.addSerializer(long.class, ToStringSerializer.instance);

        objectMapper.registerModule(simpleModule);

        return objectMapper;
    }
}
