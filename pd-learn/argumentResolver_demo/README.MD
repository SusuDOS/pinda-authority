# 参数解析器

## 参数解析器逻辑

```bash
1.定义一个注解CurrentUser,只在参数声明处有效:public String getCurrentUser(@CurrentUser User user)

2.定义一个对象实体，用户类User，保存user信息.

3.控制器类UserController标明注解，标明了注解参数为User标明要用参数解析动态获取User信息
3-1 User信息是用户请求控制器类调用方法，将用户的参数动态解析出来，再进行其他业务操作，比如鉴权.

4.定义参数解析器CurrentUserMethodArgumentResolver实现HandlerMethodArgumentResolver，

5.配置器类ArgumentResolverConfiguration实现WebMvcConfigurer，重写方法。

```