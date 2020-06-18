package com.highnes.attractinvestment.entity;


/**
 * 用户和角色关联对象 sys_user_role
 * 
 * @author ranlj
 * @date 2020-05-18
 */
public class SysUserRole extends BaseEntity<SysUserRole> {

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 角色ID
     */
    private String roleId;


    public SysUserRole(){
        super();
    }

    public SysUserRole(String id){
        super(id);
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleId() {
        return roleId;
    }


}
