package com.bbpp.smartbackend.modules.order.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bbpp.smartbackend.modules.order.entity.Order;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper extends BaseMapper<Order> {
}
