## 功能

演示一个自定义starter需要的基本组件！

使用演示为：`myapp` !

主要实现两个演示：

- 从配置文件中读取配置信息
- 统计方法的运行时间

```bash
 警告: 注解在Visual Code下不生效像被注释掉了一样，IDEA下正常work。
```

## 自定义starter调用过程如下

### 配置文件中读取配置信息注入到对象

- 定义属性类`HelloProperties`。

- `HelloServiceAutoConfiguration`将属性配置类封装在自己类中，再利用`spring.factories`注入到spring容器中。

- 封装一个类到另外一个类中可以使用属性，通过构造器传入;若类被@Bean注解，则可以通过@Autoware注入到属性。

- 也可以使用@Bean注解一个方法，则通过方法直接单例模式造一个对象并注入到容器中。

### 拦截器统计方法调用执行时间

- 定义一个注解类`MyLog`。定义一个拦截器`MyLogInterceptor`，对方法执行重写三个方法: 限定方法中使用注解@MyLog则记录调用时间.

- 将`MyLogInterceptor`拦截器添加到拦截器中.
  
- `MyLogAutoConfiguration`配置到`META-INF`下的`spring.factories`自动加载中.

