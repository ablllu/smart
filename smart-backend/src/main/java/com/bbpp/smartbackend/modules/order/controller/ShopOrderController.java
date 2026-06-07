package com.bbpp.smartbackend.modules.order.controller;

import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.framework.interceptor.MemberInterceptor;
import com.bbpp.smartbackend.modules.order.dto.OrderCreateDTO;
import com.bbpp.smartbackend.modules.order.entity.Order;
import com.bbpp.smartbackend.modules.order.service.ShopOrderService;
import com.bbpp.smartbackend.modules.order.vo.OrderDetailVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Tag(name = "C端-订单")
@RestController
@RequestMapping("/api/order")
public class ShopOrderController {

    private final ShopOrderService shopOrderService;

    public ShopOrderController(ShopOrderService shopOrderService) {
        this.shopOrderService = shopOrderService;
    }

    private Long requireLogin() {
        Long memberId = MemberInterceptor.getMemberId();
        if (memberId == null) {
            throw new BusinessException(401, "请先登录");
        }
        return memberId;
    }

    @Operation(summary = "我的订单列表")
    @GetMapping("/page")
    public Result<PageResult<Order>> page(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize) {
        Long memberId = requireLogin();
        return Result.success(shopOrderService.page(memberId, pageNum, pageSize));
    }

    @Operation(summary = "订单详情")
    @GetMapping("/{id}")
    public Result<OrderDetailVO> detail(@PathVariable Long id) {
        Long memberId = requireLogin();
        return Result.success(shopOrderService.detail(memberId, id));
    }

    @Operation(summary = "创建订单")
    @PostMapping
    public Result<Map<String, Object>> create(@Valid @RequestBody OrderCreateDTO dto) {
        Long memberId = requireLogin();
        return Result.success(shopOrderService.create(memberId, dto));
    }

    @Operation(summary = "模拟支付")
    @PutMapping("/{id}/pay")
    public Result<?> pay(@PathVariable Long id) {
        Long memberId = requireLogin();
        shopOrderService.pay(memberId, id);
        return Result.success();
    }

    @Operation(summary = "取消订单")
    @PutMapping("/{id}/cancel")
    public Result<?> cancel(@PathVariable Long id) {
        Long memberId = requireLogin();
        shopOrderService.cancel(memberId, id);
        return Result.success();
    }

    @Operation(summary = "确认收货")
    @PutMapping("/{id}/receive")
    public Result<?> receive(@PathVariable Long id) {
        Long memberId = requireLogin();
        shopOrderService.receive(memberId, id);
        return Result.success();
    }
}
