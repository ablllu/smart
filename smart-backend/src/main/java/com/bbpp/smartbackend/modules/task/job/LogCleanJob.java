package com.bbpp.smartbackend.modules.task.job;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.bbpp.smartbackend.modules.operationlog.entity.OperationLog;
import com.bbpp.smartbackend.modules.operationlog.mapper.OperationLogMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Slf4j
@Component
public class LogCleanJob {

    private final OperationLogMapper operationLogMapper;

    public LogCleanJob(OperationLogMapper operationLogMapper) {
        this.operationLogMapper = operationLogMapper;
    }


    /**
     * 每天凌晨2点执行
     */
    @Scheduled(cron = "0 0 2 * * ?")
    public void cleanLogs() {
        log.info("开始清理日志");

        operationLogMapper.delete(
                new QueryWrapper<OperationLog>().lt("create_time", LocalDateTime.now().minusDays(30))
        );

        log.info("清理日志完成");
    }
}
