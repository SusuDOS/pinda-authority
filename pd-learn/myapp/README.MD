# 使用hello-spring-boot-starter

## 主要功能

- 展示从yml文件中读取到配置属性

- 记录展示属性函数的调用时间

- 运行结果

```bash
请求uri：/hello/say
请求方法名：cn.itcast.controller.HelloController.sayHello
方法描述：sayHello方法
方法执行时间：51ms
请求uri：/hello/say
请求方法名：cn.itcast.controller.HelloController.sayHello
方法描述：sayHello方法
方法执行时间：5ms
请求uri：/hello/say
请求方法名：cn.itcast.controller.HelloController.sayHello
方法描述：sayHello方法
方法执行时间：4ms
```

## 备注

- 已清除部分冗余，使得看起来更加简洁.

- chrome浏览器

```bash
# 认为是插件的问题，后来关掉插件仍然：
请求uri：/hello/say
请求方法名：cn.itcast.controller.HelloController.sayHello
方法描述：sayHello方法
方法执行时间：2ms
2022-09-06 02:49:24.468 ERROR 8000 --- [nio-8090-exec-5] o.a.c.c.C.[.[.[/].[dispatcherServlet]    : Servlet.service() for servlet [dispatcherServlet] in context with path [] threw exception [Request processing failed; nested exception is java.lang.ClassCastException: org.springframework.web.servlet.resource.ResourceHttpRequestHandler cannot be cast to org.springframework.web.method.HandlerMethod] with root cause

java.lang.ClassCastException: org.springframework.web.servlet.resource.ResourceHttpRequestHandler cannot be cast to org.springframework.web.method.HandlerMethod
```

- 火狐浏览器-无任何插件

````
请求uri：/hello/say
请求方法名：cn.itcast.controller.HelloController.sayHello
方法描述：sayHello方法
方法执行时间：6ms
```



