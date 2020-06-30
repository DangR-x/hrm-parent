package com.highnes.attractinvestment.service.impl;

import com.highnes.attractinvestment.entity.Permission;
import com.highnes.attractinvestment.mapper.PermissionMapper;
import com.highnes.attractinvestment.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * @author Rain
 * @date 2020/6/29
 * @description
 */
@Service
@Transactional
public class PermissionServiceImpl implements IPermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public int insert(Permission permission) {
        return permissionMapper.insert(permission);
    }

    @Override
    public void deleteById(Serializable id) {
        permissionMapper.deleteById(id);
    }

    @Override
    public void update(Permission permission) {
        permissionMapper.update(permission);
    }

    @Override
    public List<Permission> selectAll() {
        return permissionMapper.selectAll();
    }

    @Override
    public List<Permission> selectByQuery(Permission permission) {
        return permissionMapper.selectByQuery(permission);
    }
}
