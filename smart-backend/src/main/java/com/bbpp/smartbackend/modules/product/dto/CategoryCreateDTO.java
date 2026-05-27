package com.bbpp.smartbackend.modules.product.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class CategoryCreateDTO {

    @NotBlank(message = "分类名称不能为空")
    private String name;

    private Long parentId;

    private String icon;

    private Integer sortNum;

    private Integer status;
}
