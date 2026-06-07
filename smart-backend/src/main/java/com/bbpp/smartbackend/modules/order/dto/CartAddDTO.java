package com.bbpp.smartbackend.modules.order.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 加入购物车请求 DTO
 */
@Data
public class CartAddDTO {

    @NotNull(message = "商品ID不能为空")
    private Long spuId;

    @NotNull(message = "SKU ID不能为空")
    private Long skuId;

    /** 数量，默认1 */
    private Integer quantity = 1;
}
