package com.bbpp.smartbackend.modules.statistics.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.bbpp.smartbackend.modules.member.mapper.MemberMapper;
import com.bbpp.smartbackend.modules.order.entity.Order;
import com.bbpp.smartbackend.modules.order.mapper.OrderMapper;
import com.bbpp.smartbackend.modules.statistics.service.StatisticsService;
import com.bbpp.smartbackend.modules.statistics.vo.StatisticsVO;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Service
public class StatisticsServiceImpl implements StatisticsService {

    private final OrderMapper orderMapper;
    private final MemberMapper memberMapper;

    public StatisticsServiceImpl(OrderMapper orderMapper, MemberMapper memberMapper) {
        this.orderMapper = orderMapper;
        this.memberMapper = memberMapper;
    }

    @Override
    public StatisticsVO overview() {
        StatisticsVO vo = new StatisticsVO();

        // 会员总数
        vo.setMemberCount(memberMapper.selectCount(null));

        // 订单总数
        vo.setOrderCount(orderMapper.selectCount(null));

        // 今日新增订单
        LocalDateTime todayStart = LocalDateTime.of(LocalDate.now(), LocalTime.MIN);
        LocalDateTime todayEnd = LocalDateTime.of(LocalDate.now(), LocalTime.MAX);
        LambdaQueryWrapper<Order> todayWrapper = new LambdaQueryWrapper<>();
        todayWrapper.between(Order::getCreateTime, todayStart, todayEnd);

        vo.setTodayOrderCount(orderMapper.selectCount(todayWrapper));


        // 待付款
        LambdaQueryWrapper<Order> pendingPayWrapper = new LambdaQueryWrapper<>();
        pendingPayWrapper.eq(Order::getStatus, 0);

        vo.setPendingPayCount(orderMapper.selectCount(pendingPayWrapper));


        // 待发货
        LambdaQueryWrapper<Order> pendingShipWrapper = new LambdaQueryWrapper<>();
        pendingShipWrapper.eq(Order::getStatus, 1);

        vo.setPendingShipCount(orderMapper.selectCount(pendingShipWrapper));

        return vo;
    }
}
