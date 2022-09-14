package cn.itcast.config;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import cn.itcast.resolver.CurrentUserMethodArgumentResolver;

// 就只是一个参数解析器的配置类
@Configuration
public class ArgumentResolverConfiguration implements WebMvcConfigurer {
    public CurrentUserMethodArgumentResolver getCurrentUserMethodArgumentResolver() {
        return new CurrentUserMethodArgumentResolver();
    }

    @Override
    // 注册自定义参数解析器
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(getCurrentUserMethodArgumentResolver());
    }
}