package com.bbpp.smartbackend.modules.product.dto;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;

@Data
public class SpuCreateDTO {

    @NotBlank(message = "商品名称不能为空")
    private String name;

    @NotNull(message = "分类不能为空")
    private Long categoryId;

    private String brand;

    private String description;

    private String mainImage;

    private List< String> images;


    // 新增SPU时要一起提交SKU列表
    private List<SkuDTO> skus;

    @Data
    public static class SkuDTO {

        @NotBlank(message = "SKU名称不能为空")
        private String skuName;

        private String specInfo;

        @NotNull(message = "商品价格不能为空")
        private BigDecimal price;

        private BigDecimal originalPrice;

        private BigDecimal costPrice;

        @NotNull(message = "商品库存不能为空")
        private Integer stock;

        private String image;
    }
}
