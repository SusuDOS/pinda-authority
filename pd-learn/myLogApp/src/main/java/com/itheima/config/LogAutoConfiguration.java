package com.itheima.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.itheima.pinda.log.event.SysLogListener;
import com.itheima.service.LogService;

/*
 *日志配置类
 */
@Configuration
public class LogAutoConfiguration {
    @Bean
    @ConditionalOnMissingBean
    public SysLogListener sysLogListener(LogService logService) {
        SysLogListener sysLogListener = new SysLogListener((optLogDTO) -> logService.saveLog(optLogDTO));
        return sysLogListener;
    }
}