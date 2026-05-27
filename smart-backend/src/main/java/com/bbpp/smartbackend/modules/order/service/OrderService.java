package com.bbpp.smartbackend.modules.order.service;


import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.order.dto.OrderPageDTO;
import com.bbpp.smartbackend.modules.order.vo.OrderDetailVO;
import com.bbpp.smartbackend.modules.order.vo.OrderVO;

public interface OrderService {

    /** 订单分页 */
    PageResult<OrderVO> page(OrderPageDTO dto);
    
    /** 订单详情 */
    OrderDetailVO detail(Long id);

    /** 发货 */
    void ship(Long id);

    /** 取消订单 */
    void cancel(Long id);
}
