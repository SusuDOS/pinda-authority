# 两级huancun

- Apache线程缓存

- redis缓存

```bash
默认使用的是对象序列化存到rendis，在redis的专讲解篇中可以使用自定义的序列化方式去序列化，这样可以在redis中直接查看，object的序列化方式对查看不友好.
```
- 经过尝试，并且查看j2cache序列化和反序列的几种方式实现源码，确定传入到redis的一定是byte[]，在redis的GUI下并不能直观的看到原数据。有一定程度的篡改乱码。

- 可以在application.yml文件中修改序列化方式，但是发现序列化会带有全路径名，极其浪费redis内存。若考虑内存也许可以考虑先手动序列化为String，再用j2cache的序列化方式。