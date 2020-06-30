package com.highnes.attractinvestment.service.impl;

import com.highnes.attractinvestment.domain.SysRoleRequest;
import com.highnes.attractinvestment.entity.Role;
import com.highnes.attractinvestment.mapper.RoleMapper;
import com.highnes.attractinvestment.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * @author DangR-X
 * @version 1.0
 * @date 2020/6/30 22:28
 * @Description
 */
@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private RoleMapper roleMapper;

    /**
     *  通过userID获取用户权限和角色信息
     */
    @Override
    public Role findRolePermissionByUserId(String userId) {
        return roleMapper.findRolePermissionByUserId(userId);
    }

    @Override
    public void saveRoleInfo(SysRoleRequest sysRoleRequest) {
        sysRoleRequest.getRole();
    }

    @Override
    public int insert(Role role) {
        return roleMapper.insert(role);
    }

    @Override
    public void deleteById(Serializable id) {
        roleMapper.deleteById(id);
    }

    @Override
    public void update(Role role) {
        roleMapper.update(role);
    }

    @Override
    public List<Role> selectAll() {
        return roleMapper.selectAll();
    }


}
