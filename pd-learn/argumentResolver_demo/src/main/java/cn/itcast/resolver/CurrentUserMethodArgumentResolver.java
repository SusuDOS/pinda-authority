package cn.itcast.resolver;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import cn.itcast.annotation.CurrentUser;
import cn.itcast.entity.User;

/**
 * 动态为Controller方法注入当前登录用户对象
 */
public class CurrentUserMethodArgumentResolver implements HandlerMethodArgumentResolver {
    /*
     * 判断参数有注解，同时参数类型为User时才解析。其中parameter等价于：
     * public String getCurrentUser(@CurrentUser User user)中，将user封装为parameter数据类型。
     */
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        // 判断当前Controller的方法中参数为User类，且加入了CurrentUser注解.
        if (parameter.getParameterType().equals(User.class) &&
                parameter.hasParameterAnnotation(CurrentUser.class)) {
            return true;
        }
        return false;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
            NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        // 动态获取当前登录用户信息

        // 最终封装成User对象返回即可，这样在Controller的方法形参就可以直接引用到User对象了
        User user = new User(1L, "admin");
        return user;
    }
}
