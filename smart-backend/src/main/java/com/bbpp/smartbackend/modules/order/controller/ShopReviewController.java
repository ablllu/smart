package com.bbpp.smartbackend.modules.order.controller;

import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.framework.interceptor.MemberInterceptor;
import com.bbpp.smartbackend.modules.order.entity.Review;
import com.bbpp.smartbackend.modules.order.service.ReviewService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

@Tag(name = "C端-评价")
@RestController
@RequestMapping("/api/review")
public class ShopReviewController {

    private final ReviewService reviewService;

    public ShopReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    private Long requireLogin() {
        Long memberId = MemberInterceptor.getMemberId();
        if(memberId == null) {
            throw new BusinessException(401, "请先登录");
        }
        return memberId;
    }

    @Operation(summary = "提交评价")
    @PostMapping
    public Result<?> submit(@RequestParam Long orderId,
                            @RequestParam Integer rating,
                            @RequestParam(required = false) String content) {
        Long memberId = requireLogin();
        reviewService.submit(memberId, orderId, rating, content);
        return Result.success();
    }

    @Operation(summary = "某个商品所有评价(公开)")
    @GetMapping("/page")
    public Result<PageResult<Review>> page(@RequestParam Long spuId,
                                           @RequestParam(defaultValue = "1") Integer pageNum,
                                           @RequestParam(defaultValue = "10") Integer pageSize) {
        return Result.success(reviewService.pageBySpu(spuId, pageNum, pageSize));
    }
}
