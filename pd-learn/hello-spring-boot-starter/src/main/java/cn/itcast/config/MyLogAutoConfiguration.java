package cn.itcast.config;

import cn.itcast.log.MyLogInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 配置类，用于自动配置拦截器、参数解析器等web组件.
 * 拦截器必须实现这个WebMvcConfigurer。
 */

@Configuration
public class MyLogAutoConfiguration implements WebMvcConfigurer {
    // 注册自定义日志拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new MyLogInterceptor()).addPathPatterns("/**");
    }
}