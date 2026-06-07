package com.bbpp.smartbackend.modules.order.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bbpp.smartbackend.modules.order.entity.Cart;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartMapper extends BaseMapper<Cart>     {
}
