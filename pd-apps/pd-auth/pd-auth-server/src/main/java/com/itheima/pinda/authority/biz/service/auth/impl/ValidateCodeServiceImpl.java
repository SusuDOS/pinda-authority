package com.itheima.pinda.authority.biz.service.auth.impl;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import com.itheima.pinda.authority.biz.service.auth.ValidateCodeService;
import com.itheima.pinda.common.constant.CacheKey;
import com.itheima.pinda.exception.BizException;
import com.wf.captcha.ArithmeticCaptcha;
import com.wf.captcha.ChineseCaptcha;
import com.wf.captcha.GifCaptcha;
import com.wf.captcha.SpecCaptcha;
import com.wf.captcha.base.Captcha;

import net.oschina.j2cache.CacheChannel;
import net.oschina.j2cache.CacheObject;

/**
 * 验证码服务
 */
@Service
public class ValidateCodeServiceImpl implements ValidateCodeService {
    @Autowired
    private CacheChannel cache;

    @Override
    public void create(String key, HttpServletResponse response) throws IOException {
        if (StringUtils.isBlank(key)) {
            throw BizException.validFail("验证码key不能为空");
        }
        // setHeader(response, "arithmetic");
        /*
         * 关于设置缓存
         * HTTP 1.1 允许的值 = PUBLIC | PRIVATE | NO-CACHE | NO-STORE.
         * 
         * Public - 可以缓存在公共共享缓存中。
         * Private - 只能缓存在私有缓存中。
         * No-Cache - 可能不被缓存。
         * No-Store - 可以缓存但不存档。
         * 
         * 指令 CACHE-CONTROL:NO-CACHE 表示不应使用缓存信息，而应将请求转发到源服务器。该指令与 PRAGMA:NO-CACHE
         * 具有相同的语义。
         * 
         * 当一个无缓存请求被发送到一个未知的 HTTP/1.1 兼容的服务器时，客户端应该包括 PRAGMA: NO-CACHE 和 CACHE-CONTROL:
         * NO-CACHE。另请参阅到期。
         * 
         * 注意：在 HTTP 中指定缓存命令可能比在 META 语句中更好，在 META 语句中它们可以影响更多的浏览器，但代理和其他可能缓存信息的中介。
         */

        //  简单点说就是设置浏览器缓存的,不缓存在浏览器中.

        response.setContentType(MediaType.IMAGE_PNG_VALUE);
        response.setHeader(HttpHeaders.PRAGMA, "No-cache");
        response.setHeader(HttpHeaders.CACHE_CONTROL, "No-cache");

        /*
         * 设置过期时间为:5000毫秒
         * resp.setDateHeader("", 5000);
         */
        response.setDateHeader(HttpHeaders.EXPIRES, 0L);

        Captcha captcha = new ArithmeticCaptcha(115, 42);
        captcha.setCharType(2);

        // hutools也有类似的工具箱，不过没有找到转为小写的函数;
        // String有个函数可以转为小写，不知道是否存在线程安全问题;
        // 这里调用的是Apache的转小写函数;
        // str.toString().toLowerCase();
        // 讲解的是说从如下路径中获取区域的值，但是跟踪代码似乎不是这样
        // /pinda-authority/pd-apps/pd-auth/pd-auth-server/src/main/resources/j2cache/caffeine.properties
        // 两处对应的字符串值相同即可

        cache.set(CacheKey.CAPTCHA, key, StringUtils.lowerCase(captcha.text()));
        // 应该是直接返回一个输出流，控制器写明了流的类型.
        // 个人认为应该有一个Result作为前后端协议.
        captcha.out(response.getOutputStream());
    }

    @Override
    public boolean check(String key, String value) {
        if (StringUtils.isBlank(value)) {
            throw BizException.validFail("请输入验证码");
        }
        CacheObject cacheObject = cache.get(CacheKey.CAPTCHA, key);
        if (cacheObject.getValue() == null) {
            throw BizException.validFail("验证码已过期");
        }
        if (!StringUtils.equalsIgnoreCase(value, String.valueOf(cacheObject.getValue()))) {
            throw BizException.validFail("验证码不正确");
        }
        // 验证通过，立即从缓存中删除验证码
        cache.evict(CacheKey.CAPTCHA, key);
        return true;
    }

    private Captcha createCaptcha(String type) {
        Captcha captcha = null;
        if (StringUtils.equalsIgnoreCase(type, "gif")) {
            captcha = new GifCaptcha(115, 42, 4);
        } else if (StringUtils.equalsIgnoreCase(type, "png")) {
            captcha = new SpecCaptcha(115, 42, 4);
        } else if (StringUtils.equalsIgnoreCase(type, "arithmetic")) {
            captcha = new ArithmeticCaptcha(115, 42);
        } else if (StringUtils.equalsIgnoreCase(type, "chinese")) {
            captcha = new ChineseCaptcha(115, 42);
        }
        captcha.setCharType(2);
        return captcha;
    }

    private void setHeader(HttpServletResponse response, String type) {
        if (StringUtils.equalsIgnoreCase(type, "gif")) {
            response.setContentType(MediaType.IMAGE_GIF_VALUE);
        } else {
            response.setContentType(MediaType.IMAGE_PNG_VALUE);
        }
        response.setHeader(HttpHeaders.PRAGMA, "No-cache");
        response.setHeader(HttpHeaders.CACHE_CONTROL, "No-cache");
        response.setDateHeader(HttpHeaders.EXPIRES, 0L);
    }
}
