package com.bbpp.smartbackend.modules.product.controller;

import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.product.dto.SpuCreateDTO;
import com.bbpp.smartbackend.modules.product.dto.SpuPageDTO;
import com.bbpp.smartbackend.modules.product.dto.SpuUpdateDTO;
import com.bbpp.smartbackend.modules.product.service.SpuService;
import com.bbpp.smartbackend.modules.product.vo.SpuDetailVO;
import com.bbpp.smartbackend.modules.product.vo.SpuVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Tag(name = "商品管理")
@RestController
@RequestMapping("/admin/spu")
public class SpuController {

    private final SpuService spuService;

    public SpuController(SpuService spuService) {
        this.spuService = spuService;
    }

    @Operation(summary = "商品分页")
    @GetMapping("/page")
    public Result<PageResult<SpuVO>> page(SpuPageDTO dto) {

        return Result.success(spuService.page(dto));
    }

    @Operation(summary = "商品详情")
    @GetMapping("/{id}")
    public Result<SpuDetailVO> detial(@PathVariable Long id) {

        return Result.success(spuService.detail(id));
    }

    @Operation(summary = "商品创建")
    @PostMapping
    public Result<?> create(@Valid @RequestBody SpuCreateDTO dto) {

        spuService.create(dto);

        return Result.success();
    }

    @Operation(summary = "商品修改")
    @PutMapping("/{id}")
    public Result<?> update(@PathVariable Long id, @Valid @RequestBody SpuUpdateDTO dto) {

        spuService.update(id, dto);

        return Result.success();
    }

    @Operation(summary = "商品上下架")
    @PutMapping("/{id}/status")
    public Result<?> updateStatus(@PathVariable Long id, @RequestParam Integer status) {

        spuService.updateStatus(id, status);

        return Result.success();
    }

    @Operation(summary = "商品删除")
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        spuService.delete(id);
        return Result.success();
    }
}
