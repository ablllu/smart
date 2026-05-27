package com.bbpp.smartbackend;

import com.bbpp.smartbackend.common.utils.PasswordUtil;

public class PasswordTest {
    public static void main(String[] args) {
        // 1. 这里写你想设置的明文密码
        String plainPassword = "123456";

        // 2. 调用工具类生成密文
        String encodedPassword = PasswordUtil.encode(plainPassword);

        // 3. 打印结果
        System.out.println("========== 密码加密结果 ==========");
        System.out.println("明文: " + plainPassword);
        System.out.println("密文: " + encodedPassword);
        System.out.println("===================================");
        System.out.println("请复制上面的【密文】，去数据库执行以下 SQL：");
        System.out.println("UPDATE sys_user SET password = '" + encodedPassword + "' WHERE username = 'admin';");
    }
}

