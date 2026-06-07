package com.bbpp.smartbackend.modules.order.vo;

import lombok.Data;
import java.math.BigDecimal;

/**
 * 购物车列表项 VO
 */
@Data
public class CartVO {

    /** 购物车记录ID */
    private Long id;

    /** SPU ID */
    private Long spuId;

    /** SPU 名称 */
    private String spuName;

    /** SPU 主图 */
    private String mainImage;

    /** SKU ID */
    private Long skuId;

    /** SKU 名称 */
    private String skuName;

    /** SKU 图片 */
    private String skuImage;

    /** SKU 单价 */
    private BigDecimal price;

    /** 数量 */
    private Integer quantity;
}
