package cn.itcast.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cn.itcast.annotation.CurrentUser;
import cn.itcast.entity.User;

@RestController
@RequestMapping(value = "/user")
public class UserController {
    // 获取当前系统登录用户
    @GetMapping("/getCurrentUser")
    public String getCurrentUser(@CurrentUser User user) {
        String name = user.getUsername();
        System.out.println("UserController getCurrentUser方法...");
        return user.toString();
    }
}