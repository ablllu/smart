package com.bbpp.smartbackend.modules.product.service;

import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.product.vo.SpuDetailVO;
import com.bbpp.smartbackend.modules.product.vo.SpuVO;
import com.bbpp.smartbackend.modules.product.dto.SpuCreateDTO;
import com.bbpp.smartbackend.modules.product.dto.SpuPageDTO;
import com.bbpp.smartbackend.modules.product.dto.SpuUpdateDTO;

public interface SpuService {

    // 分页
    PageResult<SpuVO> page(SpuPageDTO dto);

    // 详情（含sku）
    SpuDetailVO detail(Long id);

    // 创建（含sku）
    void create(SpuCreateDTO dto);

    // 修改
    void update(Long id, SpuUpdateDTO dto);

    // 上/下架
    void updateStatus(Long id, Integer status);

    // 删除
    void delete(Long id);
}
