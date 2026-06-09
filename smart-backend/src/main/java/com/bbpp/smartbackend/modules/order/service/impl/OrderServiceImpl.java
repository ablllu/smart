package com.bbpp.smartbackend.modules.order.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bbpp.smartbackend.common.auth.LoginUser;
import com.bbpp.smartbackend.common.auth.RoleEnum;
import com.bbpp.smartbackend.common.auth.UserContext;
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
import com.bbpp.smartbackend.modules.product.entity.Spu;
import com.bbpp.smartbackend.modules.product.mapper.SpuMapper;

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
    private SpuMapper spuMapper;

    public OrderServiceImpl(OrderMapper orderMapper, OrderItemMapper orderItemMapper,
                            SpuMapper spuMapper) {
        this.orderMapper = orderMapper;
        this.orderItemMapper = orderItemMapper;
        this.spuMapper = spuMapper;
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

        // MERCHANT 只能看自己商品的订单（通过 order_item → spu 关联）
        LoginUser loginUser = UserContext.get();
        List<Long> spuIds = null;
        if (loginUser != null && RoleEnum.MERCHANT.name().equals(loginUser.getRole())) {
            spuIds = spuMapper.selectList(
                new LambdaQueryWrapper<Spu>()
                    .eq(Spu::getMerchantId, loginUser.getUserId())
                    .select(Spu::getId)
            ).stream().map(Spu::getId).collect(Collectors.toList());

            List<Long> orderIds;
            if (spuIds.isEmpty()) {
                orderIds = java.util.Collections.emptyList();
            } else {
                orderIds = orderItemMapper.selectList(
                    new LambdaQueryWrapper<OrderItem>()
                        .in(OrderItem::getSpuId, spuIds)
                        .select(OrderItem::getOrderId)
                ).stream().map(OrderItem::getOrderId).distinct().collect(Collectors.toList());
            }

            if (orderIds.isEmpty()) {
                return new PageResult<>(0L, java.util.Collections.emptyList());
            }
            wrapper.in(Order::getId, orderIds);
        }

        // 查询
        Page<Order> result = orderMapper.selectPage(page, wrapper);

        List<OrderVO> records;
        if (loginUser != null && RoleEnum.MERCHANT.name().equals(loginUser.getRole())) {
            // MERCHANT：金额只算自己商品的部分
            List<Long> resultOrderIds = result.getRecords().stream()
                .map(Order::getId).collect(Collectors.toList());

            java.util.Map<Long, java.math.BigDecimal> merchantTotals = new java.util.HashMap<>();
            if (!resultOrderIds.isEmpty()) {
                List<OrderItem> items = orderItemMapper.selectList(
                    new LambdaQueryWrapper<OrderItem>()
                        .in(OrderItem::getOrderId, resultOrderIds)
                        .in(OrderItem::getSpuId, spuIds)
                );
                for (OrderItem item : items) {
                    merchantTotals.merge(item.getOrderId(), item.getTotalAmount(), java.math.BigDecimal::add);
                }
            }

            records = new java.util.ArrayList<>();
            for (Order order : result.getRecords()) {
                OrderVO vo = new OrderVO();
                BeanUtils.copyProperties(order, vo);
                java.math.BigDecimal amount = merchantTotals.getOrDefault(order.getId(), java.math.BigDecimal.ZERO);
                vo.setPayAmount(amount);
                vo.setTotalAmount(amount);
                records.add(vo);
            }
        } else {
            records = result.getRecords().stream().map(this::toVO).collect(Collectors.toList());
        }

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

        // MERCHANT 只看自己的商品明细
        LoginUser loginUser = UserContext.get();
        if (loginUser != null && RoleEnum.MERCHANT.name().equals(loginUser.getRole())) {
            List<Long> spuIds = spuMapper.selectList(
                new LambdaQueryWrapper<Spu>()
                    .eq(Spu::getMerchantId, loginUser.getUserId())
                    .select(Spu::getId)
            ).stream().map(Spu::getId).collect(Collectors.toList());
            itemVOS = itemVOS.stream()
                .filter(item -> spuIds.contains(item.getSpuId()))
                .collect(Collectors.toList());
        }

        vo.setItems(itemVOS);
        return vo;
    }


    @Override
    public void ship(Long id) {

        Order order = orderMapper.selectById(id);
        if(order == null) {
            throw new BusinessException(404, "订单不存在");
        }

        // MERCHANT 只能发自己商品的订单
        LoginUser loginUser = UserContext.get();
        if (loginUser != null && RoleEnum.MERCHANT.name().equals(loginUser.getRole())) {
            List<Long> spuIds = spuMapper.selectList(
                new LambdaQueryWrapper<Spu>()
                    .eq(Spu::getMerchantId, loginUser.getUserId())
                    .select(Spu::getId)
            ).stream().map(Spu::getId).collect(Collectors.toList());
            Long count = orderItemMapper.selectCount(
                new LambdaQueryWrapper<OrderItem>()
                    .eq(OrderItem::getOrderId, id)
                    .in(OrderItem::getSpuId, spuIds)
            );
            if (count == 0) {
                throw new BusinessException(403, "该订单不包含您的商品");
            }
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
