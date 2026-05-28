package com.bbpp.smartbackend.modules.order.controller;


import com.bbpp.smartbackend.common.audit.AuditLogAnnotation;
import com.bbpp.smartbackend.common.idempotent.Idempotent;
import com.bbpp.smartbackend.common.log.OperationLogAnnotation;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.order.dto.OrderPageDTO;
import com.bbpp.smartbackend.modules.order.entity.Order;
import com.bbpp.smartbackend.modules.order.service.OrderService;
import com.bbpp.smartbackend.modules.order.vo.OrderDetailVO;
import com.bbpp.smartbackend.modules.order.vo.OrderVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

@Tag(name = "订单模块")
@RestController
@RequestMapping("/admin/order")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @Operation(summary = "订单分页")
    @GetMapping("/page")
    public Result<PageResult<OrderVO>> page(OrderPageDTO dto) {
        return Result.success(orderService.page(dto));
    }

    @Operation(summary = "订单详情")
    @GetMapping("/{id}")
    public Result<OrderDetailVO> detail(@PathVariable Long id) {
        return Result.success(orderService.detail(id));
    }

    @Idempotent(timeout = 5)
    @Operation(summary = "发货")
    @OperationLogAnnotation(value = "订单发货")
    @AuditLogAnnotation(module = "订单管理", operation = "订单发货", entityClass = Order.class)
    @PutMapping("/{id}/ship")
    public Result<?> ship(@PathVariable Long id) {
        orderService.ship(id);
        return Result.success();
    }

    @Idempotent(timeout = 5)
    @Operation(summary = "取消订单")
    @OperationLogAnnotation(value = "取消订单")
    @AuditLogAnnotation(module = "订单管理", operation = "取消订单", entityClass = Order.class)
    @PutMapping("/{id}/cancel")
    public Result<?> cancel(@PathVariable Long id) {
        orderService.cancel(id);
        return Result.success();
    }
}
