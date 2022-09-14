package cn.itcast.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {
    // 演示异常使用
    @GetMapping("/get")
    public String get() {
        int i = 1 / 0;
        return "success";
    }
}