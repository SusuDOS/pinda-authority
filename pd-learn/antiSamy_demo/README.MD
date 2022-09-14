# XSS跨站防御

跨站脚本攻击缩写为XSS。XSS是指恶意攻击者往Web页面里插入恶意Script代码，当用户浏览该页时，嵌入其中Web里面的Script代码会被执行，从而达到恶意攻击用户的目的。有点类似于sql注入。

简单的说就是对前端传过来的数据进行校验，防止传过来的是可执行的代码。

## 使用

- 导包

- 配置

```bash
# 策略或者叫做处理方式
# 策略文件/resources/antisamy-test.xml，文件内容可以从antisamy的jar包中获取。
```

## 运行逻辑

- XssRequestWrapper从antisamy-test.yml读取配置文件处理规则.

- XSSFilter将处理逻辑规则传到过滤器中.

- AntiSamyConfiguration配置过滤的路径并且注册XSSFilter到bean容器.

## 演示

路径:http://localhost:9000

过滤掉 /<script>99</script>,可以将name设置为该值。





