package com.bbpp.smartbackend.modules.auditlog.service;

import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.auditlog.dto.AuditLogPageDTO;
import com.bbpp.smartbackend.modules.auditlog.entity.AuditLog;

public interface AuditLogService {
    PageResult<AuditLog> page(AuditLogPageDTO dto);
}
