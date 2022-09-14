# 事件日志保存

事件日志保存到数据库，此处仅为演示，并没有真实打的写入到数据库中，开启异步有两处需要开启，关闭则注释掉监听中的注解即可。

## 代码的基本逻辑

```bash
1.定义事件保存对象 `OptLogDTO`

2.定义日志事件对象 `SysLogEvent extends ApplicationEvent`

3.定义事件监听对象 `SysLogListener`监听`SysLogEvent.class`
监听到后的处理逻辑: 保存到数据库

4.定义控制器类 `UserController`
4-1 构造操作日志信息
OptLogDTO logInfo = new OptLogDTO();
logInfo.setRequestIp("127.0.0.1");
logInfo.setUserName("admin");
logInfo.setType("OPT");
logInfo.setDescription("查询用户信息");

4-2构造事件对象
ApplicationEvent event = new SysLogEvent(logInfo);

4-3发布日志事件
applicationContext.publishEvent(event);

5.定义主函数并启动
```

