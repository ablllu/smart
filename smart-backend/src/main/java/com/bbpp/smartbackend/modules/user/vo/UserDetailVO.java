package com.bbpp.smartbackend.modules.user.vo;


import lombok.Data;

import java.time.LocalDateTime;

@Data
public class UserDetailVO {

    private Long id;

    private String username;

    private String nickname;

    private String phone;

    private String email;

    private Integer status;

    private LocalDateTime createTime;

    private String avatar;
}
