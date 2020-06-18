package com.highnes.attractinvestment.common.utils;

import com.highnes.attractinvestment.common.cache.JedisUtils;
import com.highnes.attractinvestment.domain.SysUserResult;
import com.highnes.attractinvestment.entity.SysUser;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Rain
 * @date 2020/4/27
 * @description
 */
public class LoginUtils {

    /**
     * 记录登录信息
     * @param sysUserResult
     */
    public static String login(SysUserResult sysUserResult){
        String token = StringUtils.uuid();
        String key = "loginUser_"+token;
        int cacheSeconds = 24*60*60;
        // 设置token
        JedisUtils.setObject(key, sysUserResult, cacheSeconds);
        return token;
    }

    /**
     * 更新登录信息
     * @param sysUserResult
     */
    public static void updateLogin(SysUserResult sysUserResult){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String token = request.getHeader("token");
        String key = "loginUser_"+token;
        int cacheSeconds = 24*60*60;
        JedisUtils.setObject(key, sysUserResult, cacheSeconds);
    }

    /**
     * 退出登录
     */
    public static void logout(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String token = request.getHeader("token");
        String key = "loginUser_"+token;
        JedisUtils.delObject(key);
    }

    /**
     * 获取登录信息
     * @return
     */
    public static SysUserResult getLogin(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String token = request.getHeader("token");
        if ("".equals(token) && token == null){
            return null;
        }
        String key = "loginUser_"+token;
        SysUserResult sysUserResult = (SysUserResult) JedisUtils.getObject(key);
        return sysUserResult;
    }
}
