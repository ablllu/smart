package com.bbpp.smartbackend.modules.product.vo;

import lombok.Data;

import java.util.List;


@Data
public class CategoryVO {

    private Long id;

    private String name;

    private Long parentId;

    private String icon;

    private Integer sortNum;

    private Integer status;

    // 子分类（树状结构）
    private List<CategoryVO> children;
}
