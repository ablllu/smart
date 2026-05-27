package com.bbpp.smartbackend.common.auth;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class LoginUser {

    private Long userId;

    private String username;

    private String role;
}
