package com.bbpp.smartbackend.modules.product.vo;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class SpuDetailVO {

    private Long id;

    private String name;

    private Long categoryId;

    private String categoryName;

    private String brand;

    private String description;

    private String mainImage;

    private List<String> images;

    private Integer status;

    private Integer saleCount;

    private LocalDateTime createTime;

    // 关联的SKU列表
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

        private Integer status;
    }
}
