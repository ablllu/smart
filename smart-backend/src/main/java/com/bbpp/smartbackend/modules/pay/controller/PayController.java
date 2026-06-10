package com.bbpp.smartbackend.modules.pay.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.framework.interceptor.MemberInterceptor;
import com.bbpp.smartbackend.modules.order.entity.Order;
import com.bbpp.smartbackend.modules.order.mapper.OrderMapper;
import com.bbpp.smartbackend.modules.pay.service.AlipayService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Tag(name = "C端-支付")
@RestController
@RequestMapping("/api/pay")
public class PayController {

    private final AlipayService alipayService;
    private final OrderMapper orderMapper;

    public PayController(AlipayService alipayService, OrderMapper orderMapper) {
        this.alipayService = alipayService;
        this.orderMapper = orderMapper;
    }

    private Long requireLogin() {
        Long memberId = MemberInterceptor.getMemberId();
        if (memberId == null) throw new BusinessException(401, "请先登录");
        return memberId;
    }

    @Operation(summary = "创建支付")
    @PostMapping("/create/{orderId}")
    public Result<Map<String, String>> create(@PathVariable Long orderId) {
        Long memberId = requireLogin();
        Order order = orderMapper.selectById(orderId);
        if (order == null || !order.getMemberId().equals(memberId)) {
            throw new BusinessException(403, "无权操作");
        }
        if (order.getStatus() != 0) {
            throw new BusinessException(400, "只有待付款订单可以支付");
        }

        try {
            String html = alipayService.createPagePay(
                    order.getOrderNo(),
                    order.getPayAmount().toString(),
                    "订单" + order.getOrderNo()
            );
            Map<String, String> result = new HashMap<>();
            result.put("html", html);
            return Result.success(result);
        } catch (Exception e) {
            throw new BusinessException(500, "创建支付失败: " + e.getMessage());
        }
    }

    @Operation(summary = "支付宝异步通知")
    @PostMapping("/notify")
    public String notify(HttpServletRequest request) {
        Map<String, String> params = new HashMap<>();
        request.getParameterMap().forEach((k, v) -> params.put(k, v[0]));

        try {
            if (!alipayService.verifySign(params)) {
                return "failure";
            }
            if (!"TRADE_SUCCESS".equals(params.get("trade_status"))) {
                return "failure";
            }

            String orderNo = params.get("out_trade_no");
            Order order = orderMapper.selectOne(
                    new LambdaQueryWrapper<Order>().eq(Order::getOrderNo, orderNo)
            );
            if (order != null && order.getStatus() == 0) {
                order.setStatus(1);
                orderMapper.updateById(order);
            }
            return "success";
        } catch (Exception e) {
            return "failure";
        }
    }
}
