package com.bbpp.smartbackend.modules.member.vo;


import lombok.Data;

@Data
public class MemberLoginVO {
    private Long memberId;

    private String username;

    private String nickname;

    private String token;
}
