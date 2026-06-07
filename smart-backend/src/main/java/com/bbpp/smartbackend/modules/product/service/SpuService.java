package com.bbpp.smartbackend.modules.product.service;

import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.product.dto.ProductPageDTO;
import com.bbpp.smartbackend.modules.product.vo.ProductDetailVO;
import com.bbpp.smartbackend.modules.product.vo.ProductVO;
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

    /** C端：商品搜索（只返回上架商品，含最低价） */
    PageResult<ProductVO> pageForShop(ProductPageDTO dto);

    /** C端：商品详情（含SKU列表和轮播图） */
    ProductDetailVO detailForShop(Long id);


}
