package com.bbpp.smartbackend.modules.operationlog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bbpp.smartbackend.modules.operationlog.entity.OperationLog;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface OperationLogMapper extends BaseMapper<OperationLog> {
}
