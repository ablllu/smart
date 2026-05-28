package com.bbpp.smartbackend.modules.auditlog.entity;

/**
 * 字段
 * 说明
 * id 主键ID
 * user_id 操作用户ID
 * username 用户名
 * module_name 模块名称
 * operation_type 操作类型
 * business_id 业务ID
 * old_data 旧数据（JSON格式）
 * new_data 新数据（JSON格式）
 * create_time 创建时间
 */

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