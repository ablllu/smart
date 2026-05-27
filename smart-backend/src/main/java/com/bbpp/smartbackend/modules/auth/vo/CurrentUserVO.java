package com.bbpp.smartbackend.modules.auth.vo;


import lombok.Data;

@Data
public class CurrentUserVO {

    private Long userId;

    private String username;

    private String nickname;

    private String email;

    private String phone;
}
