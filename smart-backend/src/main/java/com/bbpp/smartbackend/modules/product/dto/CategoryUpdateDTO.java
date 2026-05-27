package com.bbpp.smartbackend.modules.product.dto;

import lombok.Data;

@Data
public class CategoryUpdateDTO {

    private String name;

    private Long parentId;

    private String icon;

    private Integer sortNum;

    private Integer status;

}
