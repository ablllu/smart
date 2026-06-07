package com.bbpp.smartbackend.modules.product.vo;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * C端商品列表 VO
 * 只包含买家浏览列表时需要的字段
 * id	点进去看详情	同
 * name	"iPhone 16 Pro Max"	同
 * categoryId	分类筛选	同
 * categoryName	显示"手机"标签	后台 VO 也有
 * brand	"Apple"	同
 * mainImage	商品图片	同
 * minPrice	¥12,999 起	后台展示所有 SKU 价格，C 端列表只需要最低价
 * saleCount	已售 12890	同
 * createTime	上架时间	同
 */
@Data
public class ProductVO {

    private Long id;

    private String name;

    private Long categoryId;

    private String categoryName;

    private String brand;

    private String mainImage;

    private BigDecimal minPrice;

    private Integer saleCount;

    private LocalDateTime createTime;
}

