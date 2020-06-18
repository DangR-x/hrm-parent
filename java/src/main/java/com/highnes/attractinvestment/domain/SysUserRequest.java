package com.highnes.attractinvestment.domain;

import com.highnes.attractinvestment.entity.BaseEntity;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.domain
 * @Author: ranlongjun
 * @CreateTime: 2020-05-18 17:42
 * @Description: 用户请求
 */
public class SysUserRequest extends BaseEntity<SysUserRequest> {

    private String deptId;

    private String postId;

    private String roleId;

    private String userName;

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postName) {
        this.postId = postName;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
