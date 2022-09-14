package com.itheima;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MySwaggerApplication {
    public static void main(String[] args) {
        SpringApplication.run(MySwaggerApplication.class, args);
        System.out.println("访问地址:http://localhost:8080/doc.html");
    }
}