package com.bbpp.smartbackend.common.audit;


import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface AuditLogAnnotation {

    String module();

    String operation();
}
