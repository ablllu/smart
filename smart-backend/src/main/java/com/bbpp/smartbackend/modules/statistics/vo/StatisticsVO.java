package com.bbpp.smartbackend.modules.statistics.vo;

import lombok.Data;

@Data
public class StatisticsVO {

    private Long memberCount; // 会员总数

    private Long orderCount; // 订单总数

    private Long todayOrderCount; // 今日新增订单数量

    private Long pendingShipCount; // 待发货订单数

    private Long pendingPayCount; // 待付款订单数
}
