package com.bbpp.smartbackend.modules.order.entity;


import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/** Order（订单表 oms_order）
 ┌─────────────────┬───────────────┬─────────────────────────────────────┐
 │      属性       │     类型      │                含义                 │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ id              │ Long          │ 主键ID                              │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ orderNo         │ String        │ 订单编号（业务唯一标识）            │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ memberId        │ Long          │ 下单会员ID                          │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ totalAmount     │ BigDecimal    │ 订单总金额（商品总价）              │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ payAmount       │ BigDecimal    │ 实付金额（扣除优惠后实际支付）      │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ freightAmount   │ BigDecimal    │ 运费金额                            │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ pay_type        │ Integer       │ 支付方式：1-微信 2-支付宝 3-银行卡  │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ pay_time        │ LocalDateTime │ 支付时间                            │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ status          │ Integer       │ 订单状态（0待付款/1待发货/2已发货/3已完成/4已取消 等） │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ receiverName    │ String        │ 收货人姓名                          │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ receiverPhone   │ String        │ 新增 收货人电话                     │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ receiverAddress │ String        │ 收货地址                            │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ remark          │ String        │ 订单备注                            │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ createTime      │ LocalDateTime │ 创建时间（自动填充）                │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ updateTime      │ LocalDateTime │ 更新时间（自动填充）                │
 ├─────────────────┼───────────────┼─────────────────────────────────────┤
 │ deleted         │ Integer       │ 逻辑删除标记                        │
 */

@Data
@TableName("oms_order")
public class Order {

    private Long id;

    private String orderNo;

    private Long memberId;

    private BigDecimal totalAmount;

    private BigDecimal payAmount;

    private BigDecimal freightAmount;

    /** 1-微信 2-支付宝 3-银行卡 */
    private Integer pay_type;

    private LocalDateTime pay_time;

    private Integer status;

    private String receiverName;

    private String receiverPhone;

    private String receiverAddress;

    private String remark;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @TableLogic
    private Integer deleted;
}
