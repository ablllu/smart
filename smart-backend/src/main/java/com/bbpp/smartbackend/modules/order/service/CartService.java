package com.bbpp.smartbackend.modules.order.service;

import com.bbpp.smartbackend.modules.order.dto.CartAddDTO;
import com.bbpp.smartbackend.modules.order.dto.CartUpdateDTO;
import com.bbpp.smartbackend.modules.order.vo.CartVO;

import java.util.List;

/**
 * 购物车服务接口
 */
public interface CartService {

    /** 获取当前会员的购物车列表 */
    List<CartVO> list(Long memberId);

    /** 加入购物车（同SKU已存在则累加数量） */
    void add(Long memberId, CartAddDTO dto);

    /** 修改购物车项数量 */
    void updateQuantity(Long memberId, Long cartId, CartUpdateDTO dto);

    /** 删除购物车项 */
    void delete(Long memberId, Long cartId);
}
