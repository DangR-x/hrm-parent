package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.Permission;
import com.highnes.attractinvestment.entity.RolePermission;

import java.io.Serializable;
import java.util.List;

/**
 * @author Rain
 * @date 2020/6/29
 * @description
 */
public interface RolePermissionMapper {

    int insert(RolePermission rolePermission);

    void deleteById(Serializable id);

    void update(RolePermission rolePermission);

    List<RolePermission> selectAll();

    List<RolePermission> selectByQuery(RolePermission rolePermission);

}
