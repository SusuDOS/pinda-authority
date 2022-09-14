package cn.itcast.entity;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Person implements Serializable {
    private String name;
    private int age;
}
