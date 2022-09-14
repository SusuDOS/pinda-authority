package cn.itcast;

import cn.itcast.Entity.User;

public class TestLombok {
    public static void main(String[] args) {
        //无参构造方法
        User user1 = new User();

        /*
         setter方法
        */
        user1.setId(1);
        user1.setName("itcast");
        user1.setAge(18);

        /*
         getter方法
        */
        int id = user1.getId();
        String name = user1.getName();
        int age = user1.getAge();

        //带有所有参数的构造方法
        User user2 = new User(2, "itheima", 20);

        //建造者模式
        User user3 = User.builder().id(3).name("boxuegu").age(22).build();

        /*
         toString方法
        */
        System.out.println(user1.toString());
        System.out.println(user2.toString());
        System.out.println(user3.toString());
    }
}