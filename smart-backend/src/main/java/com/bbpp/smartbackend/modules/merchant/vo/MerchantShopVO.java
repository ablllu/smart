package com.bbpp.smartbackend.modules.merchant.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class MerchantShopVO {
    private Long id;
    private Long userId;
    private String shopName;
    private String logo;
    private String description;
    private String contactPhone;
    private BigDecimal rating;
    private Integer status;
    private LocalDateTime createTime;
}
