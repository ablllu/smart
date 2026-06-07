package com.bbpp.smartbackend.modules.order.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.modules.order.dto.CartAddDTO;
import com.bbpp.smartbackend.modules.order.dto.CartUpdateDTO;
import com.bbpp.smartbackend.modules.order.entity.Cart;
import com.bbpp.smartbackend.modules.order.mapper.CartMapper;
import com.bbpp.smartbackend.modules.order.service.CartService;
import com.bbpp.smartbackend.modules.order.vo.CartVO;
import com.bbpp.smartbackend.modules.product.entity.Sku;
import com.bbpp.smartbackend.modules.product.entity.Spu;
import com.bbpp.smartbackend.modules.product.mapper.SkuMapper;
import com.bbpp.smartbackend.modules.product.mapper.SpuMapper;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    private final CartMapper cartMapper;
    private final SpuMapper spuMapper;
    private final SkuMapper skuMapper;

    public CartServiceImpl(CartMapper cartMapper, SpuMapper spuMapper, SkuMapper skuMapper) {
        this.cartMapper = cartMapper;
        this.spuMapper = spuMapper;
        this.skuMapper = skuMapper;
    }

    @Override
    public List<CartVO> list(Long memberId) {
        List<Cart> carts = cartMapper.selectList(
                new LambdaQueryWrapper<Cart>().eq(Cart::getMemberId, memberId)
        );

        List<CartVO> result = new ArrayList<>();
        for (Cart cart : carts) {
            CartVO vo = new CartVO();
            vo.setId(cart.getId());
            vo.setSpuId(cart.getSpuId());
            vo.setSkuId(cart.getSkuId());
            vo.setQuantity(cart.getQuantity());

            Spu spu = spuMapper.selectById(cart.getSpuId());
            if (spu != null) {
                vo.setSpuName(spu.getName());
                vo.setMainImage(spu.getMainImage());
            }

            Sku sku = skuMapper.selectById(cart.getSkuId());
            if (sku != null) {
                vo.setSkuName(sku.getSkuName());
                vo.setSkuImage(sku.getImage());
                vo.setPrice(sku.getPrice());
            }

            result.add(vo);
        }
        return result;
    }

    @Override
    public void add(Long memberId, CartAddDTO dto) {
        // 检查是否已有同SKU，有则累加数量
        Cart exist = cartMapper.selectOne(
                new LambdaQueryWrapper<Cart>()
                        .eq(Cart::getMemberId, memberId)
                        .eq(Cart::getSkuId, dto.getSkuId())
        );
        if (exist != null) {
            exist.setQuantity(exist.getQuantity() + dto.getQuantity());
            cartMapper.updateById(exist);
        } else {
            Cart cart = new Cart();
            cart.setMemberId(memberId);
            cart.setSpuId(dto.getSpuId());
            cart.setSkuId(dto.getSkuId());
            cart.setQuantity(dto.getQuantity());
            cartMapper.insert(cart);
        }
    }

    @Override
    public void updateQuantity(Long memberId, Long cartId, CartUpdateDTO dto) {
        Cart cart = cartMapper.selectById(cartId);
        if (cart == null || !cart.getMemberId().equals(memberId)) {
            throw new BusinessException(403, "无权操作");
        }
        cart.setQuantity(dto.getQuantity());
        cartMapper.updateById(cart);
    }

    @Override
    public void delete(Long memberId, Long cartId) {
        Cart cart = cartMapper.selectById(cartId);
        if (cart == null || !cart.getMemberId().equals(memberId)) {
            throw new BusinessException(403, "无权操作");
        }
        cartMapper.deleteById(cartId);
    }
}
