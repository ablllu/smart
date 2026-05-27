package com.bbpp.smartbackend.modules.product.service;

import com.bbpp.smartbackend.modules.product.vo.CategoryVO;
import com.bbpp.smartbackend.modules.product.dto.CategoryCreateDTO;
import com.bbpp.smartbackend.modules.product.dto.CategoryUpdateDTO;

import java.util.List;

public interface CategoryService {

    // 获取分类树
    List<CategoryVO> tree();

    // 新增
    void create(CategoryCreateDTO dto);

    // 修改
    void update(Long id, CategoryUpdateDTO dto);

    // 删除
    void delete(Long id);
}
