package com.bbpp.smartbackend.modules.operationlog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.operationlog.dto.OperationLogPageDTO;
import com.bbpp.smartbackend.modules.operationlog.entity.OperationLog;
import com.bbpp.smartbackend.modules.operationlog.mapper.OperationLogMapper;
import com.bbpp.smartbackend.modules.operationlog.service.OperationLogService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class OperationLogServiceImpl implements OperationLogService {

    private final OperationLogMapper operationLogMapper;

    public OperationLogServiceImpl(OperationLogMapper operationLogMapper) {
        this.operationLogMapper = operationLogMapper;
    }

    @Override
    public PageResult<OperationLog> page(OperationLogPageDTO dto) {
        // 1创建分页对象
        Page<OperationLog> page = new Page<>(dto.getPageNum(), dto.getPageSize());


        // 2创建查询条件
        LambdaQueryWrapper<OperationLog> wrapper = new LambdaQueryWrapper<>();

        //用户名模糊匹配
        wrapper.like(
                dto.getUsername() !=  null && !dto.getUsername().trim().isEmpty(),
                OperationLog::getUsername,
                dto.getUsername()
        );

        // 操作类型筛选
        wrapper.like(
                dto.getOperation() != null && !dto.getOperation().trim().isEmpty(),
                OperationLog::getOperation,
                dto.getOperation()
        );

        // 时间范围筛选
        if(dto.getStartTime() !=  null && !dto.getStartTime().trim().isEmpty()) {
            wrapper.ge(OperationLog::getCreateTime, LocalDateTime.parse(dto.getStartTime()));
        }

        if(dto.getEndTime() !=  null && !dto.getEndTime().trim().isEmpty()) {
            wrapper.le(OperationLog::getCreateTime, LocalDateTime.parse(dto.getEndTime()));
        }

        // 按时间倒序
        wrapper.orderByDesc(OperationLog::getCreateTime);

        // 3执行查询
        Page<OperationLog> result = operationLogMapper.selectPage(page, wrapper);

        return new PageResult<>(result.getTotal(), result.getRecords());
    }

}
