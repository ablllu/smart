package com.bbpp.smartbackend.modules.member.vo;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class MemberVO {
    private Long id;
    private String username;
    private String nickname;
    private String phone;
    private String email;
    private String avatar;
    private Integer gender;
    private LocalDate birthday;
    private Integer memberLevel;
    private Integer status;
    private LocalDateTime createTime;
}
