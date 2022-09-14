package com.itheima.pinda.auth.server.configuration;

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

import com.itheima.pinda.auth.server.properties.AuthServerProperties;
import com.itheima.pinda.auth.server.utils.JwtTokenServerUtils;

/**
 * 认证服务端配置
 *
 */
@EnableConfigurationProperties(value = {
        AuthServerProperties.class,
})
public class AuthServerConfiguration {
    @Bean
    public JwtTokenServerUtils getJwtTokenServerUtils(AuthServerProperties authServerProperties) {
        return new JwtTokenServerUtils(authServerProperties);
    }
}
