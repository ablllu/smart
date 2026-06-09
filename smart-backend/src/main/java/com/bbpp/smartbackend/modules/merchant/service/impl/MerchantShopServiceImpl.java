package com.bbpp.smartbackend.modules.merchant.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.modules.merchant.dto.MerchantShopPageDTO;
import com.bbpp.smartbackend.modules.merchant.dto.MerchantShopSaveDTO;
import com.bbpp.smartbackend.modules.merchant.entity.MerchantShop;
import com.bbpp.smartbackend.modules.merchant.mapper.MerchantShopMapper;
import com.bbpp.smartbackend.modules.merchant.service.MerchantShopService;
import com.bbpp.smartbackend.modules.merchant.vo.MerchantShopVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MerchantShopServiceImpl implements MerchantShopService {

    private final MerchantShopMapper merchantShopMapper;

    @Override
    public Page<MerchantShopVO> getPage(MerchantShopPageDTO dto) {
        LambdaQueryWrapper<MerchantShop> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.hasText(dto.getShopName())) {
            wrapper.like(MerchantShop::getShopName, dto.getShopName());
        }
        if (dto.getStatus() != null) {
            wrapper.eq(MerchantShop::getStatus, dto.getStatus());
        }
        wrapper.orderByDesc(MerchantShop::getCreateTime);

        Page<MerchantShop> page = new Page<>(dto.getPageNum(), dto.getPageSize());
        Page<MerchantShop> result = merchantShopMapper.selectPage(page, wrapper);

        List<MerchantShopVO> records = result.getRecords().stream().map(e -> {
            MerchantShopVO vo = new MerchantShopVO();
            BeanUtils.copyProperties(e, vo);
            return vo;
        }).collect(Collectors.toList());
        Page<MerchantShopVO> voPage = new Page<>(dto.getPageNum(), dto.getPageSize(), result.getTotal());
        voPage.setRecords(records);
        return voPage;
    }

    @Override
    public MerchantShopVO getById(Long id) {
        MerchantShop shop = merchantShopMapper.selectById(id);
        if (shop == null) {
            throw new BusinessException(404, "店铺不存在");
        }
        MerchantShopVO vo = new MerchantShopVO();
        BeanUtils.copyProperties(shop, vo);
        return vo;
    }

    @Override
    public MerchantShopVO getByUserId(Long userId) {
        MerchantShop shop = merchantShopMapper.selectOne(
                new LambdaQueryWrapper<MerchantShop>().eq(MerchantShop::getUserId, userId));
        if (shop == null) {
            return null;
        }
        MerchantShopVO vo = new MerchantShopVO();
        BeanUtils.copyProperties(shop, vo);
        return vo;
    }

    @Override
    public void create(MerchantShopSaveDTO dto) {
        Long count = merchantShopMapper.selectCount(
                new LambdaQueryWrapper<MerchantShop>().eq(MerchantShop::getUserId, dto.getUserId()));
        if (count > 0) {
            throw new BusinessException("该用户已有关联店铺");
        }
        MerchantShop shop = new MerchantShop();
        BeanUtils.copyProperties(dto, shop);
        shop.setRating(BigDecimal.valueOf(5.0));
        merchantShopMapper.insert(shop);
    }

    @Override
    public void update(Long id, MerchantShopSaveDTO dto) {
        MerchantShop shop = merchantShopMapper.selectById(id);
        if (shop == null) {
            throw new BusinessException(404, "店铺不存在");
        }
        BeanUtils.copyProperties(dto, shop);
        // 不覆盖 rating，评分由系统计算
        shop.setRating(merchantShopMapper.selectById(id).getRating());
        merchantShopMapper.updateById(shop);
    }

    @Override
    public void delete(Long id) {
        MerchantShop shop = merchantShopMapper.selectById(id);
        if (shop == null) {
            throw new BusinessException(404, "店铺不存在");
        }
        merchantShopMapper.deleteById(id);
    }
}
