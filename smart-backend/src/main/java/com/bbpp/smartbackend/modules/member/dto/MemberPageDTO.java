package com.bbpp.smartbackend.modules.member.dto;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class MemberPageDTO {
    private Integer pageNum = 1;

    private Integer pageSize = 10;

    private String username; // 用户名模糊搜索

    private String phone; // 手机号模糊搜索

    private Integer status; //状态筛选
}
