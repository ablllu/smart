package com.bbpp.smartbackend.modules.product.vo;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * C端商品详情 VO
 * 列表 ProductVO          详情 ProductDetailVO
 * ─────────────────      ─────────────────────
 * 图片（主图一张）   →    轮播图（多张）
 * 不需要描述        →    富文本描述（展示商品详情）
 * 最低价            →    所有 SKU（选规格时切换价格）
 * 不需要规格        →    SKU 列表（选颜色/尺寸/存储）
 */
@Data
public class ProductDetailVO {

    private Long id;
    private String name;
    private Long categoryId;
    private String categoryName;
    private String brand;
    private String description;
    private String mainImage;
    private List<String> images;
    private Integer saleCount;
    private LocalDateTime createTime;
    private List<SkuVO> skus;

    @Data
    public static class SkuVO {
        private Long id;
        private String skuName;
        private String specInfo;
        private BigDecimal price;
        private BigDecimal originalPrice;
        private Integer stock;
        private String image;
    }
}

