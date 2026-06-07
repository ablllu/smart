package com.bbpp.smartbackend.modules.order.dto;

import lombok.Data;


import java.util.List;

/**
 * C端创建订单请求 DTO
 */
@Data
public class OrderCreateDTO {

    // 购物车模式
    private List<Long> cartIds;

    /** 订单备注，选填 */
    private String remark;

    // 直购模式
    private Long spuId;
    private Long skuId;
    private Integer quantity;
}
