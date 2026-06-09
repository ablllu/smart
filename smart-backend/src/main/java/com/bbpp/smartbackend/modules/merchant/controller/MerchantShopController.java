package com.bbpp.smartbackend.modules.merchant.controller;

import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.common.auth.RequireRole;
import com.bbpp.smartbackend.modules.merchant.dto.MerchantShopPageDTO;
import com.bbpp.smartbackend.modules.merchant.dto.MerchantShopSaveDTO;
import com.bbpp.smartbackend.modules.merchant.service.MerchantShopService;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin/merchant-shop")
@RequiredArgsConstructor
public class MerchantShopController {

    private final MerchantShopService merchantShopService;

    @GetMapping("/page")
    @Operation(summary = "分页查询店铺")
    public Result<?> page(MerchantShopPageDTO dto) {
        return Result.success(merchantShopService.getPage(dto));
    }

    @GetMapping("/{id}")
    @Operation(summary = "查询店铺详情")
    public Result<?> getById(@PathVariable Long id) {
        return Result.success(merchantShopService.getById(id));
    }

    @PostMapping
    @RequireRole({"SUPER_ADMIN", "OPERATOR"})
    @Operation(summary = "新增店铺")
    public Result<?> create(@RequestBody MerchantShopSaveDTO dto) {
        merchantShopService.create(dto);
        return Result.success();
    }

    @PutMapping("/{id}")
    @RequireRole({"SUPER_ADMIN", "OPERATOR"})
    @Operation(summary = "修改店铺")
    public Result<?> update(@PathVariable Long id, @RequestBody MerchantShopSaveDTO dto) {
        merchantShopService.update(id, dto);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    @RequireRole({"SUPER_ADMIN", "OPERATOR"})
    @Operation(summary = "删除店铺")
    public Result<?> delete(@PathVariable Long id) {
        merchantShopService.delete(id);
        return Result.success();
    }
}
