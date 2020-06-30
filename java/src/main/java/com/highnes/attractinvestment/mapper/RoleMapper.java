package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.Role;
import com.highnes.attractinvestment.entity.RolePermission;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

/**
 * @author Rain
 * @date 2020/6/30
 * @description
 */
@Component
public interface RoleMapper {

    /**
     *  通过userID获取用户权限和角色信息
     */
    Role findRolePermissionByUserId(String userId);

    int insert(Role role);

    void deleteById(Serializable id);

    void update(Role role);

    List<Role> selectAll();

}
