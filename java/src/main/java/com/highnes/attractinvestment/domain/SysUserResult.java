package com.highnes.attractinvestment.domain;

import com.highnes.attractinvestment.entity.*;

import java.util.List;
import java.util.Map;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.domain
 * @Author: ranlongjun
 * @CreateTime: 2020-05-18 14:32
 * @Description: 用户列表结果集
 */
public class SysUserResult extends SysUser {

    private List<SysRole> roleList;

    private List<SysDept> deptList;

    private List<SysRoleMenu> menuList;

    public List<SysRole> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<SysRole> roleList) {
        this.roleList = roleList;
    }

    public List<SysDept> getDeptList() {
        return deptList;
    }

    public void setDeptList(List<SysDept> deptList) {
        this.deptList = deptList;
    }

    public List<SysRoleMenu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<SysRoleMenu> menuList) {
        this.menuList = menuList;
    }
}
