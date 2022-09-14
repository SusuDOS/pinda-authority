# 检验前端传来的数据

## 注解很多

- 三个注解说明
```bash
@NotNull 不能为null。
@NotBlank 不能为空格和空串。
@NotEmpty 不能为空字符串
```

## 运行逻辑

- Controller作为进入口对数据进行校验

- 自定义注解，使用该注解则使用快速失败.

- 白页与快速失败进入Controller处理

```bash
# 创建全局异常处理处理白网页:ValidatorConfiguration
# 创建ValidatorConfiguration类,指定校验时使用快速失败返回模式.
# EnableFormValidator注解的类启用快速返回，也就是只要有一不匹配则直接验证数据不合要求不再继续执行.
```