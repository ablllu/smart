package com.bbpp.smartbackend.modules.operationlog.dto;

import lombok.Data;

@Data
public class OperationLogPageDTO {

    private Integer pageNum = 1;

    private Integer pageSize = 10;

    private String username;

    private String operation;

    private String startTime;

    private String endTime;
}
