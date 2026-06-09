package com.bbpp.smartbackend.modules.merchant.dto;

import lombok.Data;

@Data
public class MerchantShopSaveDTO {
    private Long userId;
    private String shopName;
    private String logo;
    private String description;
    private String contactPhone;
    private Integer status;
}
