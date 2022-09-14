# 代码逻辑

主要功能就是根据UserInfo生成Token，根据Token得到UserInfo.

## 主体

正常来说，不是starter，要使用需要创建配置类的。

- server为例

```bash
# 0. 创建注解，EnableAuthServer和EnableAuthClient确定是客户端还是服务端.

# 1. 从yml中读取配置参数 AuthServerProperties

# 2. AuthServerConfiguration根据AuthServerProperties创建配置JwtTokenServerUtils对象.

# 3. JwtTokenServerUtils有方法：generateUserToken和getUserInfo.

# 3.1 generateUserToken->JwtHelper.generateUserToken
# 3.2 getUserInfo->JwtHelper.getJwtFromToken

# 4.1 JwtHelper.generateUserToken-self.generateToken
# 4.2 JwtHelper.getJwtFromToken->self.parserToken

# 5. 注意：Token中的token才是真正的生成串.
```