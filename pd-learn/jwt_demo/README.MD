# oken Auth

- HTTP Basic Auth 是一种简单的登录认证方式，Web浏览器或其他客户端程序在请求时提供用户名和密码。比如，user:passwd拼成字符串经过base64生成base64编码文件。但是由于可逆所以本质上也相当于明文传输密码，不安全。

- Cookie-session 认证机制是通过浏览器带上来Cookie对象来与服务器端的session对象匹配来实现状态管理。首次登陆生成Cookie，关闭浏览器就删除Cookie。

- OAuth，功能上与Redis的验证码登陆类似，验证码确定后，生成uuid，用户通过uuid登陆，不使用用户名和密码登陆。

- Token Auth，API可以采用标准化的 JSON Web Token (JWT)。

```bash
第一部分:base64({"alg": "HS256","typ": "JWT"})
第二部分:(默认可供选择)
iss：发行人
exp：到期时间
sub：主题
aud：用户
nbf：在此之前不可用
iat：发布时间
jti：JWT ID用于标识该JWT
第三部分:HMACSHA256(base64UrlEncode(header) + "." + base64UrlEncode(payload),secret)

最后三个部分拼接为字符串，各部分由.连接。
```

- 具体可以通过查看代码情况。