# 对象转换工具Dozer
```bash
Dozer是Java Bean到Java Bean映射器，它以递归方式将数据从一个对象复制到另一个对象。 dozer是用来对两个对象之间属性转换的工具，有了这个工具之后，我们将一个对象的所有属性值转给另一个对象时，就不需要再去写重复的调用set和get方法了
```
- 数据类型可以不同，比如UserDTO.id为int，UserEntity为String可以正常运行.

## 一些问题

- pd-tools-dozer

```bash
没感受出做成工具依赖的意义，我没有感受出对dozer做了任何性质的开发。比如在使用用例myDozerApp中演示中，使用了dozerUtils.map(userDTO, UserEntity.class)。
在源代码中直接调用的是com.github.dozermapper.core.Mapper,为什么不直接调用？

我认为:dozerUtils.map(userDTO, UserEntity.class)严格意义上说只能算一个使用demo而不能算一个开发tools，与dozer_demo的唯一区别是一个用泛型而另外一个并不是。

总结:别他妈的恶心你爹了,你到底开发了什么?你造一个类,类中直接调dozermapper.core.Mapper,还不如我直接用。

```




  
，因为本身的dozer调用已经很
