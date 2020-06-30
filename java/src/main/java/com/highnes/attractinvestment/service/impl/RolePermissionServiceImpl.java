package com.highnes.attractinvestment.service.impl;

import com.highnes.attractinvestment.entity.RolePermission;
import com.highnes.attractinvestment.mapper.RolePermissionMapper;
import com.highnes.attractinvestment.service.IRolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * @author Rain
 * @date 2020/6/29
 * @description
 */
@Service
public class RolePermissionServiceImpl implements IRolePermissionService {

    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    @Override
    public int insert(RolePermission rolePermission) {
        return rolePermissionMapper.insert(rolePermission);
    }

    @Override
    public void deleteById(Serializable id) {
        rolePermissionMapper.deleteById(id);
    }

    @Override
    public void update(RolePermission rolePermission) {
        rolePermissionMapper.update(rolePermission);
    }

    @Override
    public List<RolePermission> selectAll() {
        return rolePermissionMapper.selectAll();
    }

    @Override
    public List<RolePermission> selectByQuery(RolePermission rolePermission) {
        return rolePermissionMapper.selectByQuery(rolePermission);
    }
}
