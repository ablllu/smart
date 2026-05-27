package com.bbpp.smartbackend.modules.order.vo;


import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class OrderDetailVO {

    private Long id;

    private String orderNo;

    private Long memberId;

    private BigDecimal totalAmount;

    private BigDecimal payAmount;

    private BigDecimal freightAmount;

    private Integer payType;

    private LocalDateTime payTime;

    /** 0-待付款 1-待发货 2-待收货 3-已完成 4-已取消 */
    private Integer status;

    private String receiverName;

    private String receiverPhone;

    private String receiverAddress;

    private String remark;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    /** 订单明细 */
    private List<OrderItemVO> items;

    @Data
    public static class OrderItemVO {

        private Long id;

        private String spuName;

        private String skuName;

        private String specInfo;

        private String image;

        private BigDecimal price;

        private Integer quantity;

        private BigDecimal totalAmount;
    }


}
