package com.bbpp.smartbackend.modules.order.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 商品评价表 oms_review
 */
@Data
@TableName("oms_review")
public class Review {

    private Long id;

    private Long orderId;

    private String orderNo;

    private Long spuId;

    private Long memberId;

    /** 评分 1-5 */
    private Integer rating;

    /** 评价内容 */
    private String content;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @TableLogic
    private Integer deleted;
}
