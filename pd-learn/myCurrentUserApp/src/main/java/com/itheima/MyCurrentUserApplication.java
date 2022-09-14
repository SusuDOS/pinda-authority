package com.itheima;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.itheima.pinda.user.annotation.EnableLoginArgResolver;

@SpringBootApplication
@EnableLoginArgResolver // 开启自动登录用户对象注入,非starter都需要！
public class MyCurrentUserApplication {
    public static void main(String[] args) {
        SpringApplication.run(MyCurrentUserApplication.class, args);
    }
}