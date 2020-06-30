package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.Role;

/**
 * @author Rain
 * @date 2020/6/30
 * @description
 */
public interface RoleMapper {

    /**
     *  通过userID获取用户权限和角色信息
     */
    Role findRolePermissionByUserId(String userId);
}
