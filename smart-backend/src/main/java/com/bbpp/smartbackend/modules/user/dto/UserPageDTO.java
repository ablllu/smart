package com.bbpp.smartbackend.modules.user.dto;


import lombok.Data;

@Data
public class UserPageDTO {

    // 页码
    private Integer pageNum = 1;

    // 页大小
    private Integer pageSize = 10;

    // 用户名
    private String username;

    // 状态
    private Integer status;

}
