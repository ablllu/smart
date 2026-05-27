package com.bbpp.smartbackend.modules.product.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.modules.product.vo.CategoryVO;
import com.bbpp.smartbackend.modules.product.dto.CategoryCreateDTO;
import com.bbpp.smartbackend.modules.product.dto.CategoryUpdateDTO;
import com.bbpp.smartbackend.modules.product.entity.Category;
import com.bbpp.smartbackend.modules.product.mapper.CategoryMapper;
import com.bbpp.smartbackend.modules.product.service.CategoryService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CategoryServiceImpl implements CategoryService {

    private final CategoryMapper categoryMapper;

    public CategoryServiceImpl(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
    }

    @Override
    public List<CategoryVO> tree() {

        // 查询所有分类
        List<Category> all = categoryMapper.selectList(
                new LambdaQueryWrapper<Category>().orderByAsc(Category::getSortNum)
        );
        //转换为VO
        List<CategoryVO> voList = all.stream().map(this::toVO).collect(Collectors.toList());
        // 构建树
        return buildTree(voList, 0L);
    }

    private List<CategoryVO> buildTree(List<CategoryVO> all, Long parentId) {

        List<CategoryVO> tree = new ArrayList<>();
        for(CategoryVO vo : all) {
            if(vo.getParentId().equals(parentId)) {
                vo.setChildren(buildTree(all, vo.getId()));
                tree.add(vo);
            }
        }
        return tree;
    }

    private CategoryVO toVO(Category category) {
        CategoryVO vo = new CategoryVO();
        vo.setId(category.getId());
        vo.setName(category.getName());
        vo.setParentId(category.getParentId());
        vo.setSortNum(category.getSortNum());
        return vo;
    }

    @Override
    public void create(CategoryCreateDTO dto) {
        Category category = new Category();
        category.setName(dto.getName());
        category.setParentId(dto.getParentId() == null ? 0L : dto.getParentId());
        category.setIcon(dto.getIcon());
        category.setSortNum(dto.getSortNum());
        category.setStatus(dto.getStatus());
        categoryMapper.insert(category);
    }

    @Override
    public void update(Long id, CategoryUpdateDTO dto) {
        Category category = categoryMapper.selectById(id);
        if(category == null) {
            throw new BusinessException(404, "分类不存在");
        }
        if (dto.getName() != null) category.setName(dto.getName());
        if (dto.getParentId() != null) category.setParentId(dto.getParentId());
        if (dto.getIcon() != null) category.setIcon(dto.getIcon());
        if (dto.getSortNum() != null) category.setSortNum(dto.getSortNum());
        if (dto.getStatus() != null) category.setStatus(dto.getStatus());

        categoryMapper.updateById(category);
    }

    @Override
    public void delete(Long id) {
        Category category = categoryMapper.selectById(id);
        if(category == null) {
            throw new BusinessException(404, "分类不存在");
        }
        // 检查是否有子分类
        Long childCount = categoryMapper.selectCount(
                new LambdaQueryWrapper<Category>().eq(Category::getParentId, id)
        );
        if(childCount > 0) {
            throw new BusinessException(400, "请先删除子分类");
        }
        categoryMapper.deleteById(id);
    }

    @Override
    public List<Long> getDescendantIds(Long parentId) {
        // 1.查询所有分类
        List<Category> all = categoryMapper.selectList(null);

        //递归手机目标分类及其所有子孙ID
        List<Long> ids = new ArrayList<>();
        collectDescendants(all, parentId, ids);
        ids.add(parentId); //把自己也加进去
        return ids;
    }

    private void collectDescendants(List<Category> all, Long parentId, List<Long> ids) {
        for(Category c : all) {
            if(c.getParentId().equals(parentId)) {
                ids.add(c.getId());
                collectDescendants(all, c.getId(), ids);
            }
        }
    }
}
