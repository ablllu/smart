package com.bbpp.smartbackend.modules.auditlog.dto;

import lombok.Data;

@Data
public class AuditLogPageDTO {
    private Integer pageNum = 1;
    private Integer pageSize = 10;
    private String username;
    private String moduleName;
    private String operationType;
    private String startTime;
    private String endTime;
}
