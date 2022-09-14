package com.itheima.test;

import com.github.dozermapper.core.Mapper;
import com.itheima.DozerApp;
import com.itheima.dto.UserDTO;
import com.itheima.entity.UserEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = DozerApp.class)
public class DozerTest {
    @Autowired
    // 使用Mapper对象可以完成两个对象之间属性复制
    private Mapper mapper;

    @Test
    public void testDozer1() {
        UserDTO userDTO = new UserDTO();
        userDTO.setUserId(99);
        userDTO.setUserName("itcast");
        userDTO.setUserAge(20);
        userDTO.setAddress("bj");
        userDTO.setBirthday("2010-11-10");

        UserEntity user = mapper.map(userDTO, UserEntity.class);
        System.out.println(user);
    }

    @Test
    public void testDozer2() {
        UserDTO userDTO = new UserDTO();
        userDTO.setUserId(99);
        userDTO.setUserName("itcast");
        userDTO.setUserAge(20);
        userDTO.setAddress("bj");
        userDTO.setBirthday("2010-11-10");

        UserEntity user = new UserEntity();
        user.setId("200");
        System.out.println(user);
        mapper.map(userDTO, user);
        System.out.println(user);
    }

    @Test
    public void testDozer3() {
        UserDTO userDTO = new UserDTO();
        userDTO.setUserId(98);
        userDTO.setUserName("itcast");
        userDTO.setUserAge(20);
        userDTO.setAddress("bj");

        UserEntity user = new UserEntity();
        System.out.println(user);
        mapper.map(userDTO, user, "user");
        System.out.println(user);
    }
}
