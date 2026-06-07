package com.bbpp.smartbackend.modules.order.controller;

import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.framework.interceptor.MemberInterceptor;
import com.bbpp.smartbackend.modules.order.dto.CartAddDTO;
import com.bbpp.smartbackend.modules.order.dto.CartUpdateDTO;
import com.bbpp.smartbackend.modules.order.service.CartService;
import com.bbpp.smartbackend.modules.order.vo.CartVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Tag(name = "C端-购物车")
@RestController
@RequestMapping("/api/cart")
public class CartController {

    private final CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @Operation(summary = "我的购物车列表")
    @GetMapping
    public Result<List<CartVO>> list() {
        Long memberId = MemberInterceptor.getMemberId();
        if (memberId == null) return Result.error(401, "请先登录");
        return Result.success(cartService.list(memberId));
    }

    @Operation(summary = "加入购物车")
    @PostMapping
    public Result<?> add(@Valid @RequestBody CartAddDTO dto) {
        Long memberId = MemberInterceptor.getMemberId();
        if (memberId == null) return Result.error(401, "请先登录");
        cartService.add(memberId, dto);
        return Result.success();
    }

    @Operation(summary = "修改数量")
    @PutMapping("/{id}")
    public Result<?> update(@PathVariable Long id, @Valid @RequestBody CartUpdateDTO dto) {
        Long memberId = MemberInterceptor.getMemberId();
        if (memberId == null) return Result.error(401, "请先登录");
        cartService.updateQuantity(memberId, id, dto);
        return Result.success();
    }

    @Operation(summary = "删除购物车项")
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        Long memberId = MemberInterceptor.getMemberId();
        if (memberId == null) return Result.error(401, "请先登录");
        cartService.delete(memberId, id);
        return Result.success();
    }
}
