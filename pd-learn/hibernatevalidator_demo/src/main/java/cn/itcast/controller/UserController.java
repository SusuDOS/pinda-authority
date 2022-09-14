package cn.itcast.controller;

import javax.validation.constraints.NotNull;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cn.itcast.entity.Person;
import cn.itcast.entity.User;

@RestController
@RequestMapping("/user")
@Validated //开启hibernate-validator校验
public class UserController {
    // 简单类型的校验:普通请求方式.
    @RequestMapping("/delete")
    public String delete(@NotNull(message = "用户id不能为空") Integer id) {
        System.out.println("delete...");
        return "delete success";
    }

    // 对象属性校验
    // http://localhost:9100/user/save?id=1&username=uibibifadf&age=21&email=wdhoho090@gmail.com
    @RequestMapping("/save")
    public String save(@Validated User user) {
        System.out.println("save...");
        System.out.println(user);
        return "save success";
    }

    // 对象传入遵从Restful:网页并不能友好提示验证失败原因信息.
    @PostMapping("/save")
    public String saveJson(@RequestBody @Validated User user) {
        System.out.println("save...");
        System.out.println(user);
        return "save success";
    }

    // 演示1
    @RequestMapping("/object")
    public String JsonObject(Person person) {
        System.out.println(person);
        return "OK!";
    }

    // 演示2
    @PostMapping("/object2")
    public String JsonObject2(@RequestBody Person person) {
        System.out.println(person);
        return "OK2!";
    }
}
