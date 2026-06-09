package com.bbpp.smartbackend.modules.order.service;


import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.order.entity.Review;

public interface ReviewService {

    /** 提交评价，返回评价ID */
    Long submit(Long memberId, Long orderId, Integer rating, String content);

    /** 某个商品的所有评价 */
    PageResult<Review> pageBySpu(Long spuId, Integer pageNum, Integer pageSize);
}
