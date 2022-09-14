package cn.itcast.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.pinda.common.handler.DefaultGlobalExceptionHandler;

/**
 * 全局异常处理器
 */
@ControllerAdvice
@ResponseBody
public class MyExcetionHandler extends DefaultGlobalExceptionHandler {
    // 若使用自己做的异常处理，取消继承，解开注解即可!
    // 异常处理方法，当系统发生异常时执行此方法

    /*
     * @ExceptionHandler(Exception.class)
     * public String exceptionHandler(Exception ex) {
     * ex.printStackTrace();
     * return "系统异常";
     * }
     */

}