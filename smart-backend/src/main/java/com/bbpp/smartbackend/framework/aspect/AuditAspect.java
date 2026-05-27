package com.bbpp.smartbackend.framework.aspect;



import com.bbpp.smartbackend.common.audit.AuditLogAnnotation;
import com.bbpp.smartbackend.common.auth.LoginUser;
import com.bbpp.smartbackend.common.auth.UserContext;
import com.bbpp.smartbackend.modules.auditlog.entity.AuditLog;
import com.bbpp.smartbackend.modules.auditlog.mapper.AuditLogMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AuditAspect {

    private final AuditLogMapper auditLogMapper;

    private final ObjectMapper objectMapper;

    public AuditAspect(AuditLogMapper auditLogMapper, ObjectMapper objectMapper) {
        this.auditLogMapper = auditLogMapper;
        this.objectMapper = objectMapper;
    }

    @AfterReturning(value = "@annotation(auditLog)", returning = "result")
    public void saveAuditLog(JoinPoint joinPoint, AuditLogAnnotation auditLog, Object result) {

        try {

            LoginUser loginUser = UserContext.get();

            if(loginUser == null){
                return;
            }

            AuditLog log = new AuditLog();

            log.setUserId(
                    loginUser.getUserId()
            );

            log.setUsername(
                    loginUser.getUsername()
            );

            log.setModuleName(
                    auditLog.module()
            );

            log.setOperationType(
                    auditLog.operation()
            );

            // 新数据
            String newData = objectMapper.writeValueAsString(joinPoint.getArgs());

            log.setNewData(newData);

            auditLogMapper.insert(log);

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
