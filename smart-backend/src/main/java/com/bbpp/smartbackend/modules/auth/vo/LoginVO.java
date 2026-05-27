package com.bbpp.smartbackend.modules.auth.vo;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class LoginVO {

    private Long UserId;

    private String username;

    private String nickname;

    private String token;
}
