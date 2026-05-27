package com.bbpp.smartbackend.modules.order.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.order.dto.OrderPageDTO;
import com.bbpp.smartbackend.modules.order.entity.Order;
import com.bbpp.smartbackend.modules.order.entity.OrderItem;
import com.bbpp.smartbackend.modules.order.mapper.OrderItemMapper;
import com.bbpp.smartbackend.modules.order.mapper.OrderMapper;
import com.bbpp.smartbackend.modules.order.service.OrderService;
import com.bbpp.smartbackend.modules.order.vo.OrderDetailVO;
import com.bbpp.smartbackend.modules.order.vo.OrderVO;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl implements OrderService {

    private OrderMapper orderMapper;
    private OrderItemMapper orderItemMapper;

    public OrderServiceImpl(OrderMapper orderMapper, OrderItemMapper orderItemMapper) {
        this.orderMapper = orderMapper;
        this.orderItemMapper = orderItemMapper;
    }

    @Override
    public PageResult<OrderVO> page(OrderPageDTO dto) {
        // 创建分页对象
        Page<Order> page = new Page<>(dto.getPageNum(), dto.getPageSize());

        // 创建查询条件
        LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();

        wrapper.like(
                dto.getOrderNo() != null && !dto.getOrderNo().trim().isEmpty(),
                Order::getOrderNo,
                dto.getOrderNo()
        );
        wrapper.eq(
                dto.getStatus() != null,
                Order::getStatus,
                dto.getStatus()
        );
        wrapper.like(
                dto.getReceiverPhone() != null && !dto.getReceiverPhone().trim().isEmpty(),
                Order::getReceiverPhone,
                dto.getReceiverPhone()
        );
        // 时间范围筛选
        if(StringUtils.hasText(dto.getStartTime())) {
            wrapper.ge(
                    Order::getCreateTime,
                    LocalDateTime.parse(dto.getStartTime(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            );
        }
        if(StringUtils.hasText(dto.getEndTime())) {
            wrapper.le(
                    Order::getCreateTime,
                    LocalDateTime.parse(dto.getEndTime(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            );
        }

        wrapper.orderByDesc(Order::getCreateTime);

        // 查询
        Page<Order> result = orderMapper.selectPage(page, wrapper);

        List<OrderVO> records = result.getRecords().stream().map(this::toVO).collect(Collectors.toList());

        return new PageResult<>(result.getTotal(), records);
    }

    private OrderVO toVO(Order order) {
        OrderVO vo = new OrderVO();

        BeanUtils.copyProperties(order, vo);
        return vo;
    }

    @Override
    public OrderDetailVO detail(Long id) {
        Order order = orderMapper.selectById(id);
        if(order == null) {
            throw new BusinessException(404, "订单不存在");
        }
        OrderDetailVO vo = new OrderDetailVO();
        BeanUtils.copyProperties(order, vo);

        // 查询订单明细
        LambdaQueryWrapper<OrderItem> itemWRapper = new LambdaQueryWrapper<>();
        itemWRapper.eq(OrderItem::getOrderId, id);
        List<OrderItem> items = orderItemMapper.selectList(itemWRapper);
        List<OrderDetailVO.OrderItemVO> itemVOS = items.stream().map(item -> {
            OrderDetailVO.OrderItemVO itemVO = new OrderDetailVO.OrderItemVO();
            BeanUtils.copyProperties(item, itemVO);
            return itemVO;
        }).collect(Collectors.toList());

        vo.setItems(itemVOS);
        return vo;
    }


    @Override
    public void ship(Long id) {

        Order order = orderMapper.selectById(id);
        if(order == null) {
            throw new BusinessException(404, "订单不存在");
        }
        if(order.getStatus() != 1) {
            throw new BusinessException("只有待发货状态的订单才能发货");
        }

        order.setStatus(2); // 2 = 待收货
        orderMapper.updateById(order);
    }

    @Override
    public void cancel(Long id) {

        Order order = orderMapper.selectById(id);
        if(order == null) {
            throw new BusinessException(404, "订单不存在");
        }
        if(order.getStatus() != 0 && order.getStatus() != 1) {
            throw new BusinessException("只有待付款和待发货状态的订单才能取消");
        }

        order.setStatus(4); // 4 = 已取消
        orderMapper.updateById(order);
    }
}
