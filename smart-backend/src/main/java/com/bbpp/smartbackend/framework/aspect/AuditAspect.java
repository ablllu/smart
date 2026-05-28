package com.bbpp.smartbackend.framework.aspect;



import com.bbpp.smartbackend.common.audit.AuditLogAnnotation;
import com.bbpp.smartbackend.common.auth.LoginUser;
import com.bbpp.smartbackend.common.auth.UserContext;
import com.bbpp.smartbackend.modules.auditlog.entity.AuditLog;
import com.bbpp.smartbackend.modules.auditlog.mapper.AuditLogMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;

@Aspect
@Component
public class AuditAspect {

    private final AuditLogMapper auditLogMapper;

    private final ObjectMapper objectMapper;

    private final ApplicationContext applicationContext;

    public AuditAspect(AuditLogMapper auditLogMapper, ObjectMapper objectMapper, ApplicationContext applicationContext) {
        this.auditLogMapper = auditLogMapper;
        this.objectMapper = objectMapper;
        this.applicationContext = applicationContext;
    }

    @Around(value = "@annotation(auditLog)")
    public Object saveAuditLog(ProceedingJoinPoint joinPoint, AuditLogAnnotation auditLog) throws Throwable {

        // ============1.先提取businessId 和 oldData=============
        Long businessId = null;
        String oldData = null;
        try {
            MethodSignature signature = (MethodSignature) joinPoint.getSignature();
            Method method = signature.getMethod();
            Object[] args = joinPoint.getArgs();
            Parameter[] parameters = method.getParameters();

            // 遍历所有参数，找 @PathVariable 并且是数字类型
            for (int i = 0; i < parameters.length; i++) {
                PathVariable pathVariable = parameters[i].getAnnotation(PathVariable.class);
                if (pathVariable != null) {
                    Object arg = args[i];
                    // 兼容 Long / Integer / String 转数字
                    if (arg instanceof Number) {
                        businessId = ((Number) arg).longValue();
                        break;
                    } else if (arg instanceof String) {
                        try {
                            businessId = Long.parseLong(arg.toString());
                            break;
                        } catch (Exception ignored) {}
                    }
                }
            }
        } catch (Exception e) {
            // 防止反射异常导致整个日志记录失败
            businessId = null;
        }


        // ============2.提取旧数据=============
        if (businessId != null && auditLog.entityClass() != Void.class) {
            try {
                // 根据实体类名找对应的 Mapper bean，如 Spu → spuMapper
                String entityName = auditLog.entityClass().getSimpleName();
                String mapperName = Character.toLowerCase(entityName.charAt(0))
                        + entityName.substring(1) + "Mapper";
                Object mapper = applicationContext.getBean(mapperName);
                // 反射调用 mapper.selectById(businessId)
                Method selectById = mapper.getClass().getMethod("selectById", java.io.Serializable.class);
                Object oldEntity = selectById.invoke(mapper, businessId);
                if (oldEntity != null) {
                    oldData = objectMapper.writeValueAsString(oldEntity);
                }
            } catch (Exception e) {
                // 找不到 mapper 或查询失败，oldData 留空
            }
        }

        // ============3.执行目标方法=============
        Object result = joinPoint.proceed();

        // ===========4.保存审计日志=============
        try {

            LoginUser loginUser = UserContext.get();

            if(loginUser == null){
                return result;
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
            // 设置业务ID
            log.setBusinessId(businessId);
            // 旧数据
            log.setOldData(oldData);
            // 新数据
            String newData = objectMapper.writeValueAsString(joinPoint.getArgs());
            log.setNewData(newData);
            auditLogMapper.insert(log);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
