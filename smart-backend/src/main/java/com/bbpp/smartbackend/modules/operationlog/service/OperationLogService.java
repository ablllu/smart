package com.bbpp.smartbackend.modules.operationlog.service;

import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.operationlog.dto.OperationLogPageDTO;
import com.bbpp.smartbackend.modules.operationlog.entity.OperationLog;

public interface OperationLogService {
    PageResult<OperationLog> page(OperationLogPageDTO dto);
}
