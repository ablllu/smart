package com.bbpp.smartbackend.modules.statistics.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.bbpp.smartbackend.common.auth.LoginUser;
import com.bbpp.smartbackend.common.auth.RoleEnum;
import com.bbpp.smartbackend.common.auth.UserContext;
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

        LoginUser loginUser = UserContext.get();
        boolean isMerchant = loginUser != null && RoleEnum.MERCHANT.name().equals(loginUser.getRole());

        // 会员总数（商家无会员数据，显示 0）
        if (isMerchant) {
            vo.setMemberCount(0L);
        } else {
            vo.setMemberCount(memberMapper.selectCount(null));
        }

        // 构建 MERCHANT 订单过滤条件
        LambdaQueryWrapper<Order> baseWrapper = new LambdaQueryWrapper<>();
        if (isMerchant) {
            baseWrapper.eq(Order::getMerchantId, loginUser.getUserId());
        }

        // 订单总数
        vo.setOrderCount(orderMapper.selectCount(baseWrapper));

        // 今日新增订单
        LocalDateTime todayStart = LocalDateTime.of(LocalDate.now(), LocalTime.MIN);
        LocalDateTime todayEnd = LocalDateTime.of(LocalDate.now(), LocalTime.MAX);
        LambdaQueryWrapper<Order> todayWrapper = new LambdaQueryWrapper<>();
        todayWrapper.between(Order::getCreateTime, todayStart, todayEnd);
        if (isMerchant) {
            todayWrapper.eq(Order::getMerchantId, loginUser.getUserId());
        }
        vo.setTodayOrderCount(orderMapper.selectCount(todayWrapper));

        // 待付款
        LambdaQueryWrapper<Order> pendingPayWrapper = new LambdaQueryWrapper<>();
        pendingPayWrapper.eq(Order::getStatus, 0);
        if (isMerchant) {
            pendingPayWrapper.eq(Order::getMerchantId, loginUser.getUserId());
        }
        vo.setPendingPayCount(orderMapper.selectCount(pendingPayWrapper));

        // 待发货
        LambdaQueryWrapper<Order> pendingShipWrapper = new LambdaQueryWrapper<>();
        pendingShipWrapper.eq(Order::getStatus, 1);
        if (isMerchant) {
            pendingShipWrapper.eq(Order::getMerchantId, loginUser.getUserId());
        }
        vo.setPendingShipCount(orderMapper.selectCount(pendingShipWrapper));

        return vo;
    }
}
