package com.bbpp.smartbackend.modules.order.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("oms_cart")
public class Cart {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long memberId;

    private Long spuId;

    private Long skuId;

    private Integer quantity;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
}
