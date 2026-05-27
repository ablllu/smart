package com.bbpp.smartbackend.common.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordUtil {

    private static final BCryptPasswordEncoder ENCODER = new BCryptPasswordEncoder();

    // 密码加密
    public static String encode(String password) {

        return ENCODER.encode(password);
    }

    // 校验密码
    public static boolean matches(String rawPassword, String encodedaPassword) {

        return ENCODER.matches(rawPassword, encodedaPassword);
    }

}
