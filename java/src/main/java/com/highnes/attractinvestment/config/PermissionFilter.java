package com.highnes.attractinvestment.config;

import com.alibaba.fastjson.JSON;
import com.highnes.attractinvestment.common.cache.JedisUtils;
import com.highnes.attractinvestment.domain.SysUserResult;
import com.highnes.attractinvestment.entity.Permission;
import com.highnes.attractinvestment.mapper.PermissionMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author Rain
 * @date 2020/6/29
 * @description
 * 权限认证
 */
@Component
public class PermissionFilter implements Filter {

    private Logger logger = LoggerFactory.getLogger(PermissionFilter.class);

    @Autowired
    private PermissionMapper permissionMapper;


    private final String permissionkey = "PERMISSIONS";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        System.out.println("PermissionFilter过滤器启动！");
    }



    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String requestURI = request.getRequestURI();

        String uri="";

        //从redis取出所有权限判断设置的访问权限是否在内
        String permissionstr = (String)JedisUtils.get(permissionkey);
        if(permissionstr == null && permissionstr.equals("")){
            JedisUtils.delObject(permissionkey);
            List<Permission> permissions = permissionMapper.selectAll();
            String s = JSON.toJSONString(permissions);
            JedisUtils.set(permissionkey,s,0);
        }
        List<Permission> permissionsAll = JSON.parseArray(permissionstr, Permission.class);
        for (Permission permission : permissionsAll) {
            logger.info("permission="+permission);
            if(permission.getUri().equals(requestURI)){
                uri=permission.getUri();

            }
        }
        logger.info("uri=>"+uri);
        if(uri==null || uri.equals("")){
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }

        //判断用户是否登录且取出拥有的权限
        String token = request.getHeader("token");
        String key = "loginUser_"+token;
        SysUserResult sysUserResult = (SysUserResult) JedisUtils.getObject(key);
        if( sysUserResult == null  ){
//            response.setCharacterEncoding("UTF-8");
//            response.setContentType("application/json");
//            response.getWriter().write("您没有登录！");
//            response.getWriter().close();
//            return;
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }
        List<Permission> permissions = sysUserResult.getPermissions();
        if(permissions==null&&permissions.size()<0){
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            response.getWriter().write("登录已过期！");
            response.getWriter().close();
            return;
        }
        //判断是否拥有权限
        for (Permission permission : permissions) {
            logger.info("permission=>"+permission);
            if(permission.getUri().equals(uri)){
                logger.info("permission.getUri()："+permission.getUri());
                filterChain.doFilter(servletRequest,servletResponse);
                return;
            }

        }
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            response.getWriter().write("您没有访问权限！");
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    @Override
    public void destroy() {
        System.out.println("PermissionFilter过滤器销毁！");
    }
}
