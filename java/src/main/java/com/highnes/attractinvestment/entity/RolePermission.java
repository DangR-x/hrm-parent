package com.highnes.attractinvestment.entity;

import java.io.Serializable;

/**
 * @author Rain
 * @date 2020/6/29
 * @description
 * 角色权限
 */
public class RolePermission implements Serializable {

    private Long id;
    private Long roleId;
    private Long permissionId;

    public RolePermission() {
    }

    public RolePermission(Long id, Long roleId, Long permissionId) {
        this.id = id;
        this.roleId = roleId;
        this.permissionId = permissionId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Long permissionId) {
        this.permissionId = permissionId;
    }

    @Override
    public String toString() {
        return "RolePermission{" +
                "id=" + id +
                ", roleId=" + roleId +
                ", permissionId=" + permissionId +
                '}';
    }
}
