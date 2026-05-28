package com.bbpp.smartbackend.modules.product.controller;

import com.bbpp.smartbackend.common.audit.AuditLogAnnotation;
import com.bbpp.smartbackend.common.idempotent.Idempotent;
import com.bbpp.smartbackend.common.log.OperationLogAnnotation;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.product.dto.SpuCreateDTO;
import com.bbpp.smartbackend.modules.product.dto.SpuPageDTO;
import com.bbpp.smartbackend.modules.product.dto.SpuUpdateDTO;
import com.bbpp.smartbackend.modules.product.entity.Spu;
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

    @Idempotent(timeout = 5)
    @Operation(summary = "商品创建")
    @OperationLogAnnotation(value = "创建商品")
    @AuditLogAnnotation(module = "商品管理", operation = "创建商品")
    @PostMapping
    public Result<?> create(@Valid @RequestBody SpuCreateDTO dto) {

        spuService.create(dto);

        return Result.success();
    }

    @Idempotent(timeout = 5)
    @Operation(summary = "商品修改")
    @OperationLogAnnotation(value = "修改商品")
    @AuditLogAnnotation(module = "商品管理", operation = "修改商品", entityClass = Spu.class)
    @PutMapping("/{id}")
    public Result<?> update(@PathVariable Long id, @Valid @RequestBody SpuUpdateDTO dto) {

        spuService.update(id, dto);

        return Result.success();
    }

    @Idempotent(timeout = 5)
    @Operation(summary = "商品上下架")
    @OperationLogAnnotation(value = "商品上下架")
    @AuditLogAnnotation(module = "商品管理", operation = "商品上下架", entityClass = Spu.class)
    @PutMapping("/{id}/status")
    public Result<?> updateStatus(@PathVariable Long id, @RequestParam Integer status) {

        spuService.updateStatus(id, status);

        return Result.success();
    }

    @Idempotent(timeout = 5)
    @Operation(summary = "商品删除")
    @OperationLogAnnotation(value = "删除商品")
    @AuditLogAnnotation(module = "商品管理", operation = "删除商品", entityClass = Spu.class)
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        spuService.delete(id);
        return Result.success();
    }
}
