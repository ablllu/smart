package com.bbpp.smartbackend.common.idempotent;

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Idempotent {

    long timeout() default 5;
}
