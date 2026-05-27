package com.bbpp.smartbackend.modules.order.vo;


import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class OrderVO {

    private Long id;

    private String orderNo;

    /** 订单总金额 */
    private BigDecimal totalAmount;

    /** 实付金额 */
    private BigDecimal payAmount;

    private Integer payType;

    /** 0-待付款 1-待发货 2-待收货 3-已完成 4-已取消 */
    private Integer status;

    private String receiverName;

    private String receiverPhone;

    private LocalDateTime createTime;

    private LocalDateTime payTime;

}

