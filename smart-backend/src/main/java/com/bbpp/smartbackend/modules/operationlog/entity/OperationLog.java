package com.bbpp.smartbackend.modules.operationlog.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("sys_operation_log")
public class OperationLog {

    private Long id;

    private Long userId;

    private String username;

    private String operation;

    private String method;

    private String path;

    private String ip;

    private LocalDateTime createTime;
}
