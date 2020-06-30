package com.highnes.attractinvestment.config;

import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.highnes.attractinvestment.common.cache.JedisUtils;
import com.highnes.attractinvestment.entity.Permission;
import com.highnes.attractinvestment.mapper.PermissionMapper;
import org.hibernate.annotations.Cache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author Rain
 * @date 2020/6/30
 * @description
 */
@Component
@Order(3)
public class UrlConfig {

    @Autowired
    private PermissionMapper permissionMapper;


    private final String permissionkey = "PERMISSIONS";

    @Bean
    public void initjedis(){
        JedisUtils.delObject(permissionkey);
        List<Permission> permissions = permissionMapper.selectAll();
        String s = JSON.toJSONString(permissions);
        JedisUtils.set(permissionkey,s,0);

    }

}
