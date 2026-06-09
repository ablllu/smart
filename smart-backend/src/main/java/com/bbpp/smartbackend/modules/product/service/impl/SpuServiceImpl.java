package com.bbpp.smartbackend.modules.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bbpp.smartbackend.common.auth.LoginUser;
import com.bbpp.smartbackend.common.auth.RoleEnum;
import com.bbpp.smartbackend.common.auth.UserContext;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.product.dto.ProductPageDTO;
import com.bbpp.smartbackend.modules.product.dto.SpuCreateDTO;
import com.bbpp.smartbackend.modules.product.dto.SpuUpdateDTO;
import com.bbpp.smartbackend.modules.product.service.CategoryService;
import com.bbpp.smartbackend.modules.product.vo.ProductDetailVO;
import com.bbpp.smartbackend.modules.product.vo.ProductVO;
import com.bbpp.smartbackend.modules.product.vo.SpuDetailVO;
import com.bbpp.smartbackend.modules.product.vo.SpuVO;
import com.bbpp.smartbackend.modules.product.dto.SpuPageDTO;
import com.bbpp.smartbackend.modules.product.entity.Category;
import com.bbpp.smartbackend.modules.product.entity.Sku;
import com.bbpp.smartbackend.modules.product.entity.Spu;
import com.bbpp.smartbackend.modules.product.mapper.CategoryMapper;
import com.bbpp.smartbackend.modules.product.mapper.SkuMapper;
import com.bbpp.smartbackend.modules.product.mapper.SpuMapper;
import com.bbpp.smartbackend.modules.merchant.service.MerchantShopService;
import com.bbpp.smartbackend.modules.merchant.vo.MerchantShopVO;
import com.bbpp.smartbackend.modules.product.service.SpuService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class SpuServiceImpl implements SpuService {

    private final SpuMapper spuMapper;
    private final SkuMapper skuMapper;
    private final CategoryMapper categoryMapper;
    private final ObjectMapper objectMapper= new ObjectMapper();
    // 依赖categoryService
    private final CategoryService categoryService;
    private final MerchantShopService merchantShopService;

    public SpuServiceImpl(SpuMapper spuMapper, SkuMapper skuMapper, CategoryMapper categoryMapper, CategoryService categoryService, MerchantShopService merchantShopService) {
        this.spuMapper = spuMapper;
        this.skuMapper = skuMapper;
        this.categoryMapper = categoryMapper;
        this.categoryService = categoryService;
        this.merchantShopService = merchantShopService;
    }

    @Override
    public PageResult<SpuVO> page(SpuPageDTO dto) {

        Page<Spu> page = new Page<>(dto.getPageNum(), dto.getPageSize());

        LambdaQueryWrapper<Spu> wrapper = new LambdaQueryWrapper<>();

        wrapper.like(
                dto.getName() != null && !dto.getName().trim().isEmpty(),
                Spu::getName,
                dto.getName()
        );
        if(dto.getCategoryId() != null) {
            List<Long> categoryIds = categoryService.getDescendantIds(dto.getCategoryId());
            wrapper.in(Spu::getCategoryId, categoryIds);
        }
        wrapper.eq(
                dto.getStatus() != null,
                Spu::getStatus,
                dto.getStatus()
        );
        wrapper.orderByDesc(Spu::getCreateTime);

        // MERCHANT 只能看自己的商品
        LoginUser loginUser = UserContext.get();
        if (loginUser != null && RoleEnum.MERCHANT.name().equals(loginUser.getRole())) {
            wrapper.eq(Spu::getMerchantId, loginUser.getUserId());
        }

        Page<Spu> spuPage = spuMapper.selectPage(page, wrapper);

        List<SpuVO> records = spuPage.getRecords().stream().map(this::toVO).collect(Collectors.toList());

        return new PageResult<>(spuPage.getTotal(), records);
    }

    private SpuVO toVO(Spu spu) {
        SpuVO vo = new SpuVO();
        vo.setId(spu.getId());
        vo.setName(spu.getName());
        vo.setCategoryId(spu.getCategoryId());
        vo.setBrand(spu.getBrand());
        vo.setMainImage(spu.getMainImage());
        vo.setStatus(spu.getStatus());
        vo.setSaleCount(spu.getSaleCount());
        vo.setCreateTime(spu.getCreateTime());

        Category category = categoryMapper.selectById(spu.getCategoryId());

        if(category != null) {
            vo.setCategoryName(category.getName());
        }
        return vo;
    }

    @Override
    public SpuDetailVO detail(Long id) {
        Spu spu = spuMapper.selectById(id);

        if(spu == null) {
            throw new BusinessException(404, "商品不存在");
        }

        SpuDetailVO vo = new SpuDetailVO();
        vo.setId(spu.getId());
        vo.setName(spu.getName());
        vo.setCategoryId(spu.getCategoryId());
        vo.setBrand(spu.getBrand());
        vo.setDescription(spu.getDescription());
        vo.setMainImage(spu.getMainImage());
        vo.setStatus(spu.getStatus());
        vo.setSaleCount(spu.getSaleCount());
        vo.setCreateTime(spu.getCreateTime());

        // 分类名称
        Category category = categoryMapper.selectById(spu.getCategoryId());
        if(category != null) {
            vo.setCategoryName(category.getName());
        }

        // 轮播图 JSON ->  List
        vo.setImages(parseImages(spu.getImages()));

        // 查询SKU列表
        List<Sku> skus = skuMapper.selectList(new LambdaQueryWrapper<Sku>().eq(Sku::getSpuId, id));
        List<SpuDetailVO.SkuVO> skuVOs = skus.stream().map(sku -> {
            SpuDetailVO.SkuVO skuVO = new SpuDetailVO.SkuVO();
            skuVO.setId(sku.getId());
            skuVO.setSkuName(sku.getSkuName());
            skuVO.setSpecInfo(sku.getSpecInfo());
            skuVO.setPrice(sku.getPrice());
            skuVO.setOriginalPrice(sku.getOriginalPrice());
            skuVO.setStock(sku.getStock());
            skuVO.setImage(sku.getImage());
            skuVO.setStatus(sku.getStatus());
            return skuVO;
        }).collect(Collectors.toList());
        vo.setSkus(skuVOs);

        return vo;
    }

    private List<String> parseImages(String json) {
        if(json == null || json.trim().isEmpty()) return Collections.emptyList();

        try {
            return objectMapper.readValue(json, new TypeReference<List< String>>() {});
        } catch (JsonProcessingException e) {
            return Collections.emptyList();
        }
    }

    @Override
    @Transactional
    public void create(SpuCreateDTO dto) {
        // 1. 保存SPU
        Spu spu = new Spu();
        spu.setName(dto.getName());
        spu.setCategoryId(dto.getCategoryId());
        spu.setBrand(dto.getBrand());
        spu.setDescription(dto.getDescription());
        spu.setMainImage(dto.getMainImage());
        spu.setImages(toJson(dto.getImages()));
        spu.setStatus(2); // 待审核

        // MERCHANT 创建的商品绑定当前商家
        LoginUser loginUser = UserContext.get();
        if (loginUser != null && RoleEnum.MERCHANT.name().equals(loginUser.getRole())) {
            MerchantShopVO shop = merchantShopService.getByUserId(loginUser.getUserId());
            if (shop == null || shop.getStatus() != 1) {
                throw new BusinessException("请先创建并启用店铺后再发布商品");
            }
            spu.setMerchantId(loginUser.getUserId());
        }

        spuMapper.insert(spu);

        // 2. 保存SKU列表
        if (dto.getSkus() != null) {
            for (SpuCreateDTO.SkuDTO skuDTO : dto.getSkus()) {
                Sku sku = new Sku();
                sku.setSpuId(spu.getId());
                sku.setSkuName(skuDTO.getSkuName());
                sku.setSpecInfo(skuDTO.getSpecInfo());
                sku.setPrice(skuDTO.getPrice());
                sku.setOriginalPrice(skuDTO.getOriginalPrice());
                sku.setCostPrice(skuDTO.getCostPrice());
                sku.setStock(skuDTO.getStock());
                sku.setImage(skuDTO.getImage());
                skuMapper.insert(sku);
            }
        }
    }


    @Override
    public void update(Long id, SpuUpdateDTO dto) {

        Spu spu = spuMapper.selectById( id);

        if(spu == null) {
            throw new BusinessException(404, "商品不存在");
        }

        // MERCHANT 只能修改自己的商品
        LoginUser loginUser = UserContext.get();
        if (loginUser != null && RoleEnum.MERCHANT.name().equals(loginUser.getRole())) {
            if (!loginUser.getUserId().equals(spu.getMerchantId())) {
                throw new BusinessException(403, "只能修改自己的商品");
            }
        }

        if (dto.getName() != null) spu.setName(dto.getName());
        if (dto.getCategoryId() != null) spu.setCategoryId(dto.getCategoryId());
        if (dto.getBrand() != null) spu.setBrand(dto.getBrand());
        if (dto.getDescription() != null) spu.setDescription(dto.getDescription());
        if (dto.getMainImage() != null) spu.setMainImage(dto.getMainImage());
        if (dto.getImages() != null) spu.setImages(toJson(dto.getImages()));
        spuMapper.updateById(spu);

    }

    private String toJson(List<String> list) {
        if (list == null) return null;
        try {
            return objectMapper.writeValueAsString(list);
        } catch (JsonProcessingException e) {
            return null;
        }
    }


    @Override
    public void updateStatus(Long id, Integer status) {

        Spu spu = spuMapper.selectById(id);
        if(spu == null) {
            throw new BusinessException(404, "商品不存在");
        }

        // MERCHANT 只能操作自己的商品
        LoginUser loginUser = UserContext.get();
        if (loginUser != null && RoleEnum.MERCHANT.name().equals(loginUser.getRole())) {
            if (!loginUser.getUserId().equals(spu.getMerchantId())) {
                throw new BusinessException(403, "只能操作自己的商品");
            }
        }

        spu.setStatus(status);
        spuMapper.updateById(spu);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        Spu spu = spuMapper.selectById(id);
        if(spu == null) {
            throw new BusinessException(404, "商品不存在");
        }

        // MERCHANT 只能删除自己的商品
        LoginUser loginUser = UserContext.get();
        if (loginUser != null && RoleEnum.MERCHANT.name().equals(loginUser.getRole())) {
            if (!loginUser.getUserId().equals(spu.getMerchantId())) {
                throw new BusinessException(403, "只能删除自己的商品");
            }
        }

        spuMapper.deleteById(id);
        // 同时删除关联的SKU
        skuMapper.delete(new LambdaQueryWrapper<Sku>().eq(Sku::getSpuId, id));
    }

    @Override
    public PageResult<ProductVO> pageForShop(ProductPageDTO dto) {
        //分页对象
        Page<Spu> page = new Page<>(dto.getPageNum(), dto.getPageSize());

        //查询条件
        LambdaQueryWrapper<Spu> wrapper = new LambdaQueryWrapper<>();

        // C端只显示上架商品
        wrapper.eq(Spu::getStatus, 1);

        // 只显示所属分类（及所有父分类）均为启用状态的商品
        List<Long> enabledCategoryIds = getEnabledCategoryIds();
        if (enabledCategoryIds.isEmpty()) {
            return new PageResult<>(0L, Collections.emptyList());
        }
        wrapper.in(Spu::getCategoryId, enabledCategoryIds);

        // 关键词搜索
        if(dto.getKeyword() != null && !dto.getKeyword().trim().isEmpty()) {
            wrapper.like(Spu::getName, dto.getKeyword());
        }

        // 分类筛选（在已启用的分类基础上进一步过滤）
        if(dto.getCategoryId() != null) {
            List<Long> categoryIds = categoryService.getDescendantIds(dto.getCategoryId());
            // 取交集：用户选的分类 ∩ 启用的分类
            categoryIds.retainAll(enabledCategoryIds);
            if (categoryIds.isEmpty()) {
                return new PageResult<>(0L, Collections.emptyList());
            }
            wrapper.in(Spu::getCategoryId, categoryIds);
        }

        // 排序（id 作为二级排序保证结果稳定）
        if("sale_desc".equals(dto.getSort())) {
            wrapper.orderByDesc(Spu::getSaleCount).orderByDesc(Spu::getId);
        } else  {
            wrapper.orderByDesc(Spu::getCreateTime).orderByDesc(Spu::getId);
        }

        //查询
        Page<Spu> spuPage = spuMapper.selectPage(page, wrapper);

        // 转为C端VO
        List<ProductVO> records = spuPage.getRecords().stream().map(spu ->{
            ProductVO vo = new ProductVO();
            vo.setId(spu.getId());
            vo.setName(spu.getName());
            vo.setCategoryId(spu.getCategoryId());
            vo.setBrand(spu.getBrand());
            vo.setMainImage(spu.getMainImage());
            vo.setSaleCount(spu.getSaleCount());
            vo.setCreateTime(spu.getCreateTime());

            // 查分类名
            Category category = categoryMapper.selectById(spu.getCategoryId());
            if(category != null) {
                vo.setCategoryName(category.getName());
            }

            // 查最低价
            LambdaQueryWrapper<Sku> skuWrapper = new LambdaQueryWrapper<>();
            skuWrapper.eq(Sku::getSpuId, spu.getId());
            skuWrapper.orderByAsc(Sku::getPrice);
            skuWrapper.last("LIMIT 1");
            Sku cheapestSku = skuMapper.selectOne(skuWrapper);
            if(cheapestSku != null) {
                vo.setMinPrice(cheapestSku.getPrice());
            }

            return vo;
        }).collect(Collectors.toList());

        return new PageResult<>(spuPage.getTotal(), records);
    }

    @Override
    public ProductDetailVO detailForShop(Long id) {

        Spu spu = spuMapper.selectById(id);
        if(spu == null || spu.getStatus() != 1) {
            throw new BusinessException(404, "商品不存在或已下架");
        }

        // 检查所属分类是否已启用
        Category spuCategory = categoryMapper.selectById(spu.getCategoryId());
        if (spuCategory == null || !getEnabledCategoryIds().contains(spu.getCategoryId())) {
            throw new BusinessException(404, "商品不存在或已下架");
        }

        ProductDetailVO vo = new ProductDetailVO();
        vo.setId(spu.getId());
        vo.setName(spu.getName());
        vo.setCategoryId(spu.getCategoryId());
        vo.setBrand(spu.getBrand());
        vo.setDescription(spu.getDescription());
        vo.setMainImage(spu.getMainImage());
        vo.setSaleCount(spu.getSaleCount());
        vo.setCreateTime(spu.getCreateTime());

        // 分类名称
        Category category = categoryMapper.selectById(spu.getCategoryId());
        if(category != null) {
            vo.setCategoryName(category.getName());
        }

        // 轮播图 JSON -> List
        vo.setImages(parseImages(spu.getImages()));

        // SKU 列表
        List<Sku> skus = skuMapper.selectList(
                new LambdaQueryWrapper<Sku>().eq(Sku::getSpuId, id)
        );

        List<ProductDetailVO.SkuVO> skuVOs = skus.stream().map(sku -> {
            ProductDetailVO.SkuVO skuVO = new ProductDetailVO.SkuVO();
            skuVO.setId(sku.getId());
            skuVO.setSkuName(sku.getSkuName());
            skuVO.setSpecInfo(sku.getSpecInfo());
            skuVO.setPrice(sku.getPrice());
            skuVO.setOriginalPrice(sku.getOriginalPrice());
            skuVO.setStock(sku.getStock());
            skuVO.setImage(sku.getImage());
            return skuVO;
        }).collect(Collectors.toList());
        vo.setSkus(skuVOs);

        return vo;
    }

    /**
     * 获取所有"有效启用"的分类ID
     * 有效启用 = 自身 status=1 且所有父分类 status=1
     */
    private List<Long> getEnabledCategoryIds() {
        List<Category> all = categoryMapper.selectList(null);
        // 构建 parentId → children 映射，方便快速查找
        java.util.Map<Long, Category> map = new java.util.HashMap<>();
        for (Category c : all) {
            map.put(c.getId(), c);
        }
        // 只保留"自身及所有祖先都启用"的分类
        List<Long> enabled = new java.util.ArrayList<>();
        for (Category c : all) {
            if (isChainEnabled(c, map)) {
                enabled.add(c.getId());
            }
        }
        return enabled;
    }

    /** 递归检查从当前分类到根的所有节点是否都启用 */
    private boolean isChainEnabled(Category c, java.util.Map<Long, Category> map) {
        if (c.getStatus() == null || c.getStatus() != 1) {
            return false;
        }
        if (c.getParentId() == null || c.getParentId() == 0L) {
            return true; // 已到根节点，且自身已通过检查
        }
        Category parent = map.get(c.getParentId());
        if (parent == null) {
            return true; // 父分类不存在，视同根节点
        }
        return isChainEnabled(parent, map);
    }

}
