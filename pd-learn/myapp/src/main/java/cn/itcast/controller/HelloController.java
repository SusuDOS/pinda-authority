package cn.itcast.controller;

import cn.itcast.config.HelloProperties;
import cn.itcast.log.MyLog;
import cn.itcast.service.HelloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class HelloController {
    // HelloService在我们自定义的starter中已经完成了自动配置，所以此处可以直接注入
    @Autowired
    private HelloService helloService;

    //查看属性演示
    @Autowired
    private HelloProperties helloProperties;

    @MyLog(desc = "sayHello方法") // 日志记录注解
    @GetMapping("/say")
    public String sayHello() {
        System.out.println(helloProperties.toString());
        return helloService.sayHello();
    }
}