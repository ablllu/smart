package com.bbpp.smartbackend.modules.auditlog.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.bbpp.smartbackend.modules.auditlog.entity.AuditLog;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AuditLogMapper extends BaseMapper<AuditLog> {
}
