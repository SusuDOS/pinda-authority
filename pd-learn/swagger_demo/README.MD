# 展示使用swagger为代码生成接口文档

## 注解类

```bash
# 实体类
@ApiModel(value = "菜单实体", description = "菜单实体描述")

# 实体参数
@ApiModelProperty(value = "主键")

```

## 控制器类

```bash
# 控制器类
@Api(tags = "用户控制器")

# 控制器类方法
@ApiOperation(value = "查询所有用户", notes = "查询所有用户信息!")

# 控制器类方法参数
@ApiImplicitParams({
        @ApiImplicitParam(name = "pageNum", value = "页码", required = true, type = "Integer"),
        @ApiImplicitParam(name = "pageSize", value = "每页条数", required = true, type = "Integer"),
})
```

## 访问地址

访问路径为:http://localhost:9000/swagger-ui.html