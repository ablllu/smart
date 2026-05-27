package com.bbpp.smartbackend.modules.product.controller;

import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.product.vo.CategoryVO;
import com.bbpp.smartbackend.modules.product.dto.CategoryCreateDTO;
import com.bbpp.smartbackend.modules.product.dto.CategoryUpdateDTO;
import com.bbpp.smartbackend.modules.product.service.CategoryService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Tag(name = "商品分类")
@RestController
@RequestMapping("/admin/category")
public class CategoryController {

    private final CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Operation(summary = "获取分类树")
    @GetMapping
    public Result<List<CategoryVO>> tree() {
        return Result.success(categoryService.tree());
    }

    @Operation(summary = "新增分类")
    @PostMapping
    public Result<?> create(@Valid @RequestBody CategoryCreateDTO dto) {
        categoryService.create(dto);
        return Result.success();
    }

    @Operation(summary = "修改分类")
    @PutMapping("/{id}")
    public Result<?> update(@PathVariable Long id, @Valid @RequestBody CategoryUpdateDTO dto) {
        categoryService.update(id, dto);
        return Result.success();
    }

    @Operation(summary = "删除分类")
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        categoryService.delete(id);
        return Result.success();
    }
}
