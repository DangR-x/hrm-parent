package com.highnes.attractinvestment.service;

import com.highnes.attractinvestment.domain.SysRoleRequest;
import com.highnes.attractinvestment.entity.Role;

import java.io.Serializable;
import java.util.List;

/**
 * @author DangR-X
 * @version 1.0
 * @date 2020/6/30 22:27
 * @Description
 * 角色
 *
 */
public interface IRoleService {

    /**
     *  通过userID获取用户权限和角色信息
     */
    Role findRolePermissionByUserId(String userId);

    void saveRoleInfo(SysRoleRequest sysRoleRequest);

    int insert(Role role);

    void deleteById(Serializable id);

    void update(Role role);

    List<Role> selectAll();
}
