package com.bbpp.smartbackend.modules.auditlog.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.auditlog.dto.AuditLogPageDTO;
import com.bbpp.smartbackend.modules.auditlog.entity.AuditLog;
import com.bbpp.smartbackend.modules.auditlog.mapper.AuditLogMapper;
import com.bbpp.smartbackend.modules.auditlog.service.AuditLogService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class AuditLogServiceImpl implements AuditLogService {

    private final AuditLogMapper auditLogMapper;

    public AuditLogServiceImpl(AuditLogMapper auditLogMapper) {
        this.auditLogMapper = auditLogMapper;
    }

    @Override
    public PageResult<AuditLog> page(AuditLogPageDTO dto) {

        // 1.创建分页对象
        Page<AuditLog> page = new Page<> (dto.getPageNum(), dto.getPageSize());

        //2.创建查询条件
        LambdaQueryWrapper<AuditLog> wrapper = new LambdaQueryWrapper<>();

        wrapper.like(
                dto.getUsername() != null && !dto.getUsername().trim().isEmpty(),
                AuditLog::getUsername,
                dto.getUsername()
        );

        wrapper.like(
                dto.getModuleName() != null && !dto.getModuleName().trim().isEmpty(),
                AuditLog::getModuleName,
                dto.getModuleName()
        );

        wrapper.like(
                dto.getOperationType() != null && !dto.getOperationType().trim().isEmpty(),
                AuditLog::getOperationType,
                dto.getOperationType()
        );

        if(dto.getStartTime() !=  null && !dto.getStartTime().trim().isEmpty()) {
            wrapper.ge(AuditLog::getCreateTime, LocalDateTime.parse(dto.getStartTime()));
        }
        if(dto.getEndTime() !=  null && !dto.getEndTime().trim().isEmpty()) {
            wrapper.le(AuditLog::getCreateTime, LocalDateTime.parse(dto.getEndTime()));
        }

        wrapper.orderByDesc(AuditLog::getCreateTime);

        //3..执行查询
        Page<AuditLog> result = auditLogMapper.selectPage(page, wrapper);

        return new PageResult<>(result.getTotal(), result.getRecords());
    }
}
