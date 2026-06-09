package com.bbpp.smartbackend.modules.order.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.order.dto.OrderCreateDTO;
import com.bbpp.smartbackend.modules.order.entity.Cart;
import com.bbpp.smartbackend.modules.order.entity.Order;
import com.bbpp.smartbackend.modules.order.entity.OrderItem;
import com.bbpp.smartbackend.modules.order.mapper.CartMapper;
import com.bbpp.smartbackend.modules.order.mapper.OrderItemMapper;
import com.bbpp.smartbackend.modules.order.mapper.OrderMapper;
import com.bbpp.smartbackend.modules.order.service.ShopOrderService;
import com.bbpp.smartbackend.modules.order.vo.OrderDetailVO;
import com.bbpp.smartbackend.modules.product.entity.Sku;
import com.bbpp.smartbackend.modules.product.entity.Spu;
import com.bbpp.smartbackend.modules.product.mapper.SkuMapper;
import com.bbpp.smartbackend.modules.product.mapper.SpuMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
public class ShopOrderServiceImpl implements ShopOrderService {

    private final OrderMapper orderMapper;
    private final OrderItemMapper orderItemMapper;
    private final CartMapper cartMapper;
    private final SkuMapper skuMapper;
    private final SpuMapper spuMapper;

    public ShopOrderServiceImpl(OrderMapper orderMapper, OrderItemMapper orderItemMapper,
                                 CartMapper cartMapper, SkuMapper skuMapper, SpuMapper spuMapper) {
        this.orderMapper = orderMapper;
        this.orderItemMapper = orderItemMapper;
        this.cartMapper = cartMapper;
        this.skuMapper = skuMapper;
        this.spuMapper = spuMapper;
    }

    @Override
    public PageResult<Order> page(Long memberId, Integer pageNum, Integer pageSize) {
        Page<Order> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Order::getMemberId, memberId)
               .orderByDesc(Order::getCreateTime);
        Page<Order> result = orderMapper.selectPage(page, wrapper);
        return new PageResult<>(result.getTotal(), result.getRecords());
    }

    @Override
    public OrderDetailVO detail(Long memberId, Long orderId) {
        Order order = orderMapper.selectById(orderId);
        if (order == null || !order.getMemberId().equals(memberId)) {
            throw new BusinessException(403, "无权查看");
        }

        OrderDetailVO vo = new OrderDetailVO();
        vo.setId(order.getId());
        vo.setOrderNo(order.getOrderNo());
        vo.setTotalAmount(order.getTotalAmount());
        vo.setPayAmount(order.getPayAmount());
        vo.setStatus(order.getStatus());
        vo.setCreateTime(order.getCreateTime());

        List<OrderItem> items = orderItemMapper.selectList(
                new LambdaQueryWrapper<OrderItem>().eq(OrderItem::getOrderId, orderId)
        );
        List<OrderDetailVO.OrderItemVO> itemVOs = new ArrayList<>();
        for (OrderItem item : items) {
            OrderDetailVO.OrderItemVO iv = new OrderDetailVO.OrderItemVO();
            iv.setId(item.getId());
            iv.setSpuName(item.getSpuName());
            iv.setSkuName(item.getSkuName());
            iv.setPrice(item.getPrice());
            iv.setQuantity(item.getQuantity());
            itemVOs.add(iv);
        }
        vo.setItems(itemVOs);
        return vo;
    }

    @Override
    @Transactional
    public Map<String, Object> create(Long memberId, OrderCreateDTO dto) {
        if(dto.getCartIds() != null && !dto.getCartIds().isEmpty()) {
            // ==========购物车==========
            List<Cart> carts = cartMapper.selectBatchIds(dto.getCartIds());
            if (carts.isEmpty()) {
                throw new BusinessException(400, "购物车数据无效");
            }

            BigDecimal totalAmount = BigDecimal.ZERO;

            // 生成订单号
            String orderNo = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"))
                    + String.format("%010d", System.currentTimeMillis() % 10000000000L);

            Order order = new Order();
            order.setOrderNo(orderNo);
            order.setMemberId(memberId);
            order.setTotalAmount(BigDecimal.ZERO);
            order.setPayAmount(BigDecimal.ZERO);
            order.setStatus(0);  // 待付款
            order.setCreateTime(LocalDateTime.now());



            orderMapper.insert(order);

            for (Cart cart : carts) {
                Sku sku = skuMapper.selectById(cart.getSkuId());
                if (sku == null) continue;

                BigDecimal price = sku.getPrice();
                int qty = cart.getQuantity();
                totalAmount = totalAmount.add(price.multiply(BigDecimal.valueOf(qty)));

                OrderItem item = new OrderItem();
                item.setOrderId(order.getId());
                item.setOrderNo(orderNo);
                item.setSpuId(cart.getSpuId());
                item.setSkuId(cart.getSkuId());
                item.setPrice(price);
                item.setQuantity(qty);
                item.setTotalAmount(price.multiply(BigDecimal.valueOf(qty)));

                Spu spu = spuMapper.selectById(cart.getSpuId());
                item.setSpuName(spu != null ? spu.getName() : "");
                item.setSkuName(sku.getSkuName());
                orderItemMapper.insert(item);
            }

            // 更新订单金额
            order.setTotalAmount(totalAmount);
            order.setPayAmount(totalAmount);
            order.setRemark(dto.getRemark());
            orderMapper.updateById(order);

            // 清掉已下单的购物车项
            cartMapper.deleteBatchIds(dto.getCartIds());

            Map<String, Object> result = new HashMap<>();
            result.put("orderId", order.getId());
            result.put("orderNo", orderNo);
            result.put("payAmount", totalAmount);
            return result;
        } else if(dto.getSpuId() != null && dto.getSkuId() != null) {
            // =========立即购买=========
            int qty = dto.getQuantity() != null ? dto.getQuantity() : 1;

            Sku sku = skuMapper.selectById(dto.getSkuId());
            if(sku == null) {
                throw new BusinessException(400, "商品不存在");
            }

            // 生成订单号 （高并发下会重复）
            String orderNo = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"))
                    + String.format("%010d", System.currentTimeMillis() % 10000000000L);

            Spu spu = spuMapper.selectById(dto.getSpuId());

            Order order = new Order();
            order.setOrderNo(orderNo);
            order.setMemberId(memberId);
            order.setTotalAmount(sku.getPrice().multiply(BigDecimal.valueOf(qty)));
            order.setPayAmount(sku.getPrice().multiply(BigDecimal.valueOf(qty)));
            order.setStatus(0);
            order.setCreateTime(LocalDateTime.now());
       
            orderMapper.insert(order);

            OrderItem item = new OrderItem();
            item.setOrderId(order.getId());
            item.setOrderNo(orderNo);
            item.setSpuId(dto.getSpuId());
            item.setSkuId(dto.getSkuId());
            item.setPrice(sku.getPrice());
            item.setQuantity(qty);
            item.setTotalAmount(sku.getPrice().multiply(BigDecimal.valueOf(qty)));
            item.setSkuName(sku.getSkuName());
            item.setSpuName(spu != null ? spu.getName() : "");
            orderItemMapper.insert(item);

            Map<String, Object> result = new HashMap<>();
            result.put("orderId", order.getId());
            result.put("orderNo", orderNo);
            result.put("payAmount", order.getPayAmount());
            return result;
        } else {
            throw new BusinessException(400, "请选择商品");
        }


    }

    @Override
    public void pay(Long memberId, Long orderId) {
        Order order = orderMapper.selectById(orderId);
        if (order == null || !order.getMemberId().equals(memberId)) {
            throw new BusinessException(403, "无权操作");
        }
        if (order.getStatus() != 0) {
            throw new BusinessException(400, "只有待付款订单可以支付");
        }
        order.setStatus(1);  // 待发货
        order.setPay_time(LocalDateTime.now());
        orderMapper.updateById(order);
    }

    @Override
    public void cancel(Long memberId, Long orderId) {
        Order order = orderMapper.selectById(orderId);
        if (order == null || !order.getMemberId().equals(memberId)) {
            throw new BusinessException(403, "无权操作");
        }
        if (order.getStatus() != 0) {
            throw new BusinessException(400, "只有待付款订单可以取消");
        }
        order.setStatus(4);  // 已取消
        orderMapper.updateById(order);
    }

    @Override
    public void receive(Long memberId, Long orderId) {
        Order order = orderMapper.selectById(orderId);
        if (order == null || !order.getMemberId().equals(memberId)) {
            throw new BusinessException(403, "无权操作");
        }
        if (order.getStatus() != 2) {
            throw new BusinessException(400, "只有已发货订单可以确认收货");
        }
        order.setStatus(3);  // 已完成
        orderMapper.updateById(order);
    }
}
