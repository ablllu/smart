package com.bbpp.smartbackend.modules.member.vo;

import com.bbpp.smartbackend.modules.member.entity.Address;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class MemberDetailVO {
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

    private List<AddressVO> addresses;

    @Data
    public static class AddressVO {
        private Long id;
        private String name;
        private String phone;
        private String province;
        private String city;
        private String district;
        private String detail;
        private Integer isDefault;
    }
}
