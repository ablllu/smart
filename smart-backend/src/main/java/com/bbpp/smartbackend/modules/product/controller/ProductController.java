package com.bbpp.smartbackend.modules.product.controller;


import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.product.dto.ProductPageDTO;
import com.bbpp.smartbackend.modules.product.service.SpuService;
import com.bbpp.smartbackend.modules.product.vo.ProductDetailVO;
import com.bbpp.smartbackend.modules.product.vo.ProductVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "C端-商品浏览")
@RestController
@RequestMapping("/api/product")
public class ProductController {

    private final SpuService spuService;

    public ProductController(SpuService spuService) {
        this.spuService = spuService;
    }

    @Operation(summary = "商品搜索/分页")
    @GetMapping("/page")
    public Result<PageResult<ProductVO>> page(ProductPageDTO dto) {
        return Result.success(spuService.pageForShop(dto));
    }

    @Operation(summary = "商品详情")
    @GetMapping("/{id}")
    public Result<ProductDetailVO> detail(@PathVariable Long id) {
        return Result.success(spuService.detailForShop(id));
    }

}
