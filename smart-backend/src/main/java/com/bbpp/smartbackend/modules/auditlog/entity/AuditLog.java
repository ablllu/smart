package com.bbpp.smartbackend.modules.auditlog.entity;


import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@TableName("sys_audit_log")
@Data
public class AuditLog {

    private Long id;

    private Long userId;

    private String username;

    private String moduleName;

    private String operationType;

    private Long businessId;

    private String oldData;

    private String newData;

    private LocalDateTime createTime;
}