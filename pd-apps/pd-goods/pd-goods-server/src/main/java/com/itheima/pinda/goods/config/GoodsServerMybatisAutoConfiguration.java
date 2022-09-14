package com.itheima.pinda.goods.config;

import org.springframework.context.annotation.Configuration;

import com.itheima.pinda.database.datasource.BaseMybatisConfiguration;
import com.itheima.pinda.database.properties.DatabaseProperties;

import lombok.extern.slf4j.Slf4j;

/**
 * 配置一些拦截器
 */
@Configuration
@Slf4j

public class GoodsServerMybatisAutoConfiguration extends BaseMybatisConfiguration {
    public GoodsServerMybatisAutoConfiguration(DatabaseProperties databaseProperties) {
        super(databaseProperties);
    }
}