package cn.itcast.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.itcast.entity.Person;
import net.oschina.j2cache.CacheChannel;
import net.oschina.j2cache.CacheObject;

/**
 * 使用j2catch提供的CacheChannel对象操作缓存数据
 */
@RestController
@RequestMapping("/cache")
public class UserController {
    private String key = "myKey";
    private String region = "rx";
    @Autowired
    private CacheChannel cacheChannel;

    @GetMapping("/getInfos")
    public List<String> getInfos() {
        // 从缓存中获取数据，需要指定区域region和key
        CacheObject cacheObject = cacheChannel.get(region, key);
        if (cacheObject.getValue() == null) {
            // 缓存中没有找到，查询数据库获得
            List<String> data = new ArrayList<String>();
            data.add("info1");
            data.add("info2");
            // 放入缓存
            cacheChannel.set(region, key, data);
            return data;
        }
        return (List<String>) cacheObject.getValue();
    }

    // 清理指定缓存
    @GetMapping("/evict")
    public String evict() {
        cacheChannel.evict(region, key);
        return "evict success";
    }

    // 清理指定区域中的所有缓存
    @GetMapping("/clear")
    public String clear() {
        cacheChannel.clear(region);
        return "clear success";
    }

    // 检查指定的缓存数据是否存在
    @GetMapping("/exists")
    public boolean exists() {
        boolean exists = cacheChannel.exists(region, key);
        return exists;
    }

    // 检查指定的缓存数据是从哪一级缓存获取到的
    @GetMapping("/check")
    public String check() {
        int level = cacheChannel.check(region, key);
        return "level:" + level;
    }

    // 利用框架获得一个较为干净的数据
    @GetMapping("/json")
    public Person JsonPerson() {
        String rx = "test";
        String Jsonkey = "KeyValue";
        Person user = new Person("tome", 5);
        cacheChannel.set(rx, Jsonkey, user);
        return user;
    }

    // 自定义序列化写入数据
    // 对象转为字符串，字符串再写入redis貌似仍未能很好解决易读性和节约内存的目的.
    private static final ObjectMapper mapper = new ObjectMapper();
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @GetMapping("/pure")
    public String JsonPersonPure() throws JsonProcessingException {
        Person user = new Person("tome", 10);
        String jsonData = mapper.writeValueAsString(user);
        stringRedisTemplate.opsForValue().set("Test:user:1", jsonData);
        return jsonData;

        // String jsonUser = stringRedisTemplate.opsForValue().get("Test:user:1");
        // User jsonToUser = mapper.readValue(jsonUser, User.class);
    }
}
