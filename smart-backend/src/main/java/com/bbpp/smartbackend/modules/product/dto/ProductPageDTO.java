package com.bbpp.smartbackend.modules.product.dto;

import lombok.Data;

/**
 * C端商品搜索请求参数
 * pageNum	分页第几页	1
 * pageSize	每页多少条	20
 * keyword	搜索框输入的文字	"iPhone"
 * categoryId	点分类标签传的 ID	10101（手机）
 * sort	排序方式	"newest" / "sale_desc" / "price_asc" / "price_desc"
 */
@Data
public class ProductPageDTO {

    private Integer pageNum = 1;

    private Integer pageSize = 20;

    private String keyword;

    private Long categoryId;

    private String sort;
}
