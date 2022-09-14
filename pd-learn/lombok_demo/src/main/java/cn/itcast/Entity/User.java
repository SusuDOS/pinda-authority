package cn.itcast.Entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// @Data生成setter/getter、equals、canEqual、hashCode、toString方法;
// 如为final属性，则不会为该属性生成setter方法;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int id;
    private String name;
    private int age;
}
