package com.bbpp.smartbackend.modules.merchant.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bbpp.smartbackend.modules.merchant.dto.MerchantShopPageDTO;
import com.bbpp.smartbackend.modules.merchant.dto.MerchantShopSaveDTO;
import com.bbpp.smartbackend.modules.merchant.vo.MerchantShopVO;

public interface MerchantShopService {
    Page<MerchantShopVO> getPage(MerchantShopPageDTO dto);
    MerchantShopVO getById(Long id);
    MerchantShopVO getByUserId(Long userId);
    void create(MerchantShopSaveDTO dto);
    void update(Long id, MerchantShopSaveDTO dto);
    void delete(Long id);
}
