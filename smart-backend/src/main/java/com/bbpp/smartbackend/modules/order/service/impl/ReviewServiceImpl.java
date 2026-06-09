package com.bbpp.smartbackend.modules.order.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.order.entity.Order;
import com.bbpp.smartbackend.modules.order.entity.OrderItem;
import com.bbpp.smartbackend.modules.order.entity.Review;
import com.bbpp.smartbackend.modules.order.mapper.OrderItemMapper;
import com.bbpp.smartbackend.modules.order.mapper.OrderMapper;
import com.bbpp.smartbackend.modules.order.mapper.ReviewMapper;
import com.bbpp.smartbackend.modules.order.service.ReviewService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReviewServiceImpl implements ReviewService {

    private final ReviewMapper reviewMapper;
    private final OrderMapper orderMapper;
    private final OrderItemMapper orderItemMapper;

    public ReviewServiceImpl(ReviewMapper reviewMapper, OrderMapper orderMapper, OrderItemMapper orderItemMapper) {
        this.reviewMapper = reviewMapper;
        this.orderMapper = orderMapper;
        this.orderItemMapper = orderItemMapper;
    }

    @Override
    @Transactional
    public Long submit(Long memberId, Long orderId, Integer rating, String content) {
        // 1.校验订单属于当前用户
        Order order = orderMapper.selectById(orderId);
        if(order == null || !order.getMemberId().equals(memberId)) {
            throw new BusinessException(403, "订单不存在或无权限");
        }

        // 2. 必须是已收货状态
        if (order.getStatus() != 3) {
            throw new BusinessException(400, "只有已收货订单可以评价");
        }

        // 3. 不能重复评价
        boolean exists = reviewMapper.exists(
                new LambdaQueryWrapper<Review>()
                        .eq(Review::getOrderId, orderId)
        );
        if (exists) {
            throw new BusinessException(400, "该订单已评价过");
        }

        // 4. 取订单中的第一个商品作为评价对象
        OrderItem item = orderItemMapper.selectOne(
                new LambdaQueryWrapper<OrderItem>()
                        .eq(OrderItem::getOrderId, orderId)
                        .last("limit 1")
        );

        Review review = new Review();
        review.setOrderId(orderId);
        review.setOrderNo(order.getOrderNo());
        review.setSpuId(item != null ? item.getSpuId() : 0L);
        review.setMemberId(memberId);
        review.setRating(rating);
        review.setContent(content);
        reviewMapper.insert(review);

        return review.getId();
    }

    @Override
    public PageResult<Review> pageBySpu(Long spuId, Integer pageNum, Integer pageSize) {
        Page<Review> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Review> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Review::getSpuId, spuId)
                .orderByDesc(Review::getCreateTime);
        Page<Review> result = reviewMapper.selectPage(page, wrapper);
        return new PageResult<>(result.getTotal(), result.getRecords());
    }
}
