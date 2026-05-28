package com.bbpp.smartbackend.framework.aspect;

import com.bbpp.smartbackend.common.auth.LoginUser;
import com.bbpp.smartbackend.common.auth.UserContext;
import com.bbpp.smartbackend.common.log.OperationLogAnnotation;
import com.bbpp.smartbackend.modules.operationlog.entity.OperationLog;
import com.bbpp.smartbackend.modules.operationlog.mapper.OperationLogMapper;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;


@Aspect
@Component
public class OperationLogAspect {

    private final OperationLogMapper operationLogMapper;

    private final HttpServletRequest request;

    public OperationLogAspect(OperationLogMapper operationLogMapper, HttpServletRequest request) {
        this.operationLogMapper = operationLogMapper;
        this.request = request;
    }

    @AfterReturning("@annotation(operationLog)")
    public void saveLog(JoinPoint joinPoint, OperationLogAnnotation operationLog) {

        LoginUser loginUser = UserContext.get();

        if(loginUser == null) return;

        OperationLog log = new OperationLog();

        log.setUserId(loginUser.getUserId());

        log.setUsername(loginUser.getUsername());

        log.setOperation(operationLog.value());

        log.setMethod(request.getMethod());

        log.setPath(request.getRequestURI());

        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.isEmpty()) {
            ip = request.getHeader("X-Real-IP");
        }
        if (ip == null || ip.isEmpty()) {
            ip = request.getRemoteAddr();
        }
        if (ip != null && ip.contains(",")) {
            ip = ip.split(",")[0].trim();
        }
        log.setIp(ip);

        operationLogMapper.insert(log);
    }
}
