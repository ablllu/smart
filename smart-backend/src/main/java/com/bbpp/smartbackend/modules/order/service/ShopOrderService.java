package com.bbpp.smartbackend.modules.order.service;

import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.order.dto.OrderCreateDTO;
import com.bbpp.smartbackend.modules.order.entity.Order;
import com.bbpp.smartbackend.modules.order.vo.OrderDetailVO;

import java.util.Map;

/**
 * C端订单服务接口
 */
public interface ShopOrderService {

    /** 我的订单分页列表 */
    PageResult<Order> page(Long memberId, Integer pageNum, Integer pageSize);

    /** 订单详情 */
    OrderDetailVO detail(Long memberId, Long orderId);

    /** 从购物车创建订单，返回 { orderId, orderNo, payAmount } */
    Map<String, Object> create(Long memberId, OrderCreateDTO dto);

    /** 模拟支付 */
    void pay(Long memberId, Long orderId);

    /** 取消订单 */
    void cancel(Long memberId, Long orderId);

    /** 确认收货 */
    void receive(Long memberId, Long orderId);
}
