package com.bbpp.smartbackend.modules.product.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;


/**
 * SKU (Stock Keeping Unit) - 库存量单位
 * 定义：具体可销售的最小商品单元（实际商品）
 * id 商品id
 * spuId
 * skuName 商品名称
 * specInfo 商品规格信息
 * price 商品价格
 * originalPrice 商品原价
 * costPrice 商品成本价
 * stock 库存
 * image 商品图片
 * status 状态
 * createTime 创建时间
 * updateTime 更新时间
 * deleted 逻辑删除标记
 */
@Data
@TableName("pms_sku")
public class Sku {

    private Long id;

    private Long spuId;

    private String skuName;

    private String specInfo;

    private BigDecimal price;

    private BigDecimal originalPrice;

    private BigDecimal costPrice;

    private Integer stock;

    private Integer lockedStock;

    private String image;

    private Integer status;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @TableLogic
    private Integer deleted;
}
