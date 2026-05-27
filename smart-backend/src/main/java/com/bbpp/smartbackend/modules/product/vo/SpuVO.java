package com.bbpp.smartbackend.modules.product.vo;


import lombok.Data;

import java.time.LocalDateTime;

@Data
public class SpuVO {

    private Long id;

    private String name;

    private Long categoryId;

    private String categoryName;

    private String brand;

    private String mainImage;

    private Integer status;

    private Integer saleCount;

    private LocalDateTime createTime;
}
