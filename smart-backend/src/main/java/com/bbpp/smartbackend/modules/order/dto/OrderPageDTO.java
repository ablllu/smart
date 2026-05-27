package com.bbpp.smartbackend.modules.order.dto;


import lombok.Data;

@Data
public class OrderPageDTO {

    private Integer pageNum = 1;

    private Integer pageSize = 10;

    /**订单号， 模糊搜索 */
    private String orderNo;

    /** 0-待付款 1-待发货 2-待收货 3-已完成 4-已取消 */
    private Integer status;

    /** 收货人手机号，模糊搜索 */
    private String receiverPhone;

    /** 下单时间起 */
    private String startTime;

    /** 下单时间止 */
    private String endTime;

}
