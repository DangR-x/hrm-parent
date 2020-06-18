package com.highnes.attractinvestment.domain;

import com.highnes.attractinvestment.entity.SysMenu;
import com.highnes.attractinvestment.entity.SysRole;
import com.highnes.attractinvestment.entity.SysRoleMenu;

import java.util.List;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.domain
 * @Author: ranlongjun
 * @CreateTime: 2020-05-21 11:08
 * @Description: 角色信息
 */
public class SysRoleRequest extends SysRole {

    /**
     * 删除多个角色
     */
    private String roleIds;

    /**
     * 部门名称
     */
    private String deptName;

    /**
     * 角色总数
     */
    private String roleNum;

    /**
     * 角色菜单权限
     */
    private List<SysRoleMenu> menuList;

    public List<SysRoleMenu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<SysRoleMenu> menuList) {
        this.menuList = menuList;
    }

    public String getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getRoleNum() {
        return roleNum;
    }

    public void setRoleNum(String roleNum) {
        this.roleNum = roleNum;
    }
}
