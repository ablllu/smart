package com.bbpp.smartbackend.modules.order.entity;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * OrderItem（订单项表 oms_order_item）
 *
 *   ┌─────────────┬───────────────┬───────────────────────────────────────┐
 *   │    属性     │     类型      │                 含义                  │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ id          │ Long          │ 主键ID                                │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ orderId     │ Long          │ 所属订单ID（关联 oms_order.id）       │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ orderNo     │ String        │ 订单编号（冗余字段，方便查询）        │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ spuId       │ Long          │ 商品SPU ID                            │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ skuId       │ Long          │ 商品SKU ID                            │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ spuName     │ String        │ SPU名称（如 "iPhone 15"）             │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ skuName     │ String        │ SKU名称（如 "iPhone 15 黑色 256G"）   │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ specInfo    │ String        │ 规格信息（如 "颜色:黑色, 容量:256G"） │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ image       │ String        │ 商品图片URL                           │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ price       │ BigDecimal    │ 购买时的商品单价                      │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ quantity    │ Integer       │ 购买数量                              │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ totalAmount │ BigDecimal    │ 小计金额（price × quantity）          │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ createTime  │ LocalDateTime │ 创建时间                              │
 *   ├─────────────┼───────────────┼───────────────────────────────────────┤
 *   │ deleted     │ Integer       │ 逻辑删除标记（@TableLogic）           │
 *   └─────────────┴───────────────┴───────────────────────────────────────┘
 */
@Data
@TableName("oms_order_item")
public class OrderItem {

    private Long id;

    private Long orderId;

    private String orderNo;

    private Long spuId;

    private Long skuId;

    private String spuName;

    private String skuName;

    private String specInfo;

    private String image;

    private BigDecimal price;

    private Integer quantity;

    private BigDecimal totalAmount;

    private LocalDateTime createTime;

    @TableLogic
    private Integer deleted;
}
