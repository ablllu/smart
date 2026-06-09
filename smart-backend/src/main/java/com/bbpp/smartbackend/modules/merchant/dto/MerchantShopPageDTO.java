package com.bbpp.smartbackend.modules.merchant.dto;

import lombok.Data;

@Data
public class MerchantShopPageDTO {
    private Integer pageNum = 1;
    private Integer pageSize = 10;
    private String shopName;
    private Integer status;
}
