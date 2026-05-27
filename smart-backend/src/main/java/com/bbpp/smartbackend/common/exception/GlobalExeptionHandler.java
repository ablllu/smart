package com.bbpp.smartbackend.common.exception;


import com.bbpp.smartbackend.common.result.Result;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice //拦截所有RestController中的异常
public class GlobalExeptionHandler {
    //============1.处理所有位置异常==============
    @ExceptionHandler(Exception.class)
    public Result<?> handleException(Exception e) {
        e.printStackTrace(); //开发阶段先打印日志

        return Result.error(500, "系统异常" + e.getMessage());
    }

    //============2.处理运行时异常==============
    @ExceptionHandler(RuntimeException.class)
    public Result<?> handleRuntimeException(RuntimeException e) {
        e.printStackTrace();

        return Result.error(500, e.getMessage());
    }

    //============3.处理参数校验异常==============
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result<?> handleValidationException(MethodArgumentNotValidException e) {

        String msg = e.getBindingResult()
                .getFieldErrors()
                .get(0)
                .getDefaultMessage();

        return Result.error(400, msg);
    }

    //============4.处理业务异常==============
    @ExceptionHandler(BusinessException.class)
    public Result<?> handleBusinessException(BusinessException e) {
        return Result.error(e.getCode(), e.getMessage());
    }
}
