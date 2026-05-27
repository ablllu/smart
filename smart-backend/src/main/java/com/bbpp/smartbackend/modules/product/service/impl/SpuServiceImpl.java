package com.bbpp.smartbackend.modules.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.product.dto.SpuCreateDTO;
import com.bbpp.smartbackend.modules.product.dto.SpuUpdateDTO;
import com.bbpp.smartbackend.modules.product.service.CategoryService;
import com.bbpp.smartbackend.modules.product.vo.SpuDetailVO;
import com.bbpp.smartbackend.modules.product.vo.SpuVO;
import com.bbpp.smartbackend.modules.product.dto.SpuPageDTO;
import com.bbpp.smartbackend.modules.product.entity.Category;
import com.bbpp.smartbackend.modules.product.entity.Sku;
import com.bbpp.smartbackend.modules.product.entity.Spu;
import com.bbpp.smartbackend.modules.product.mapper.CategoryMapper;
import com.bbpp.smartbackend.modules.product.mapper.SkuMapper;
import com.bbpp.smartbackend.modules.product.mapper.SpuMapper;
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

    public SpuServiceImpl(SpuMapper spuMapper, SkuMapper skuMapper, CategoryMapper categoryMapper, CategoryService categoryService) {
        this.spuMapper = spuMapper;
        this.skuMapper = skuMapper;
        this.categoryMapper = categoryMapper;
        this.categoryService = categoryService;
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

        spuMapper.deleteById(id);
        // 同时删除关联的SKU
        skuMapper.delete(new LambdaQueryWrapper<Sku>().eq(Sku::getSpuId, id));
    }

}
