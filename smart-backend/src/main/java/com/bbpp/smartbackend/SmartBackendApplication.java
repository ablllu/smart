package com.bbpp.smartbackend;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@MapperScan("com.bbpp.smartbackend.modules.*.mapper")
@EnableScheduling
public class SmartBackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(SmartBackendApplication.class, args);
    }

}
