package com.highnes.attractinvestment.entity;


/**
 * 角色和菜单关联对象 sys_role_menu
 * 
 * @author ranlj
 * @date 2020-05-18
 */
public class SysRoleMenu extends BaseEntity<SysRoleMenu> {

    /**
     * 角色ID
     */
    private String roleId;

    /**
     * 菜单ID
     */
    private String menuId;

    /**
     * crud权限
     */
    private String rights;

    /**
     * 菜单名称
     */
    private String menuName;

    /**
     * 菜单路径
     */
    private String menuUrl;

    /**
     * 菜单的父级元素
     */
    private String parentId;

    public SysRoleMenu(){
        super();
    }

    public SysRoleMenu(String id){
        super(id);
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getMenuId() {
        return menuId;
    }

    public void setRights(String rights) {
        this.rights = rights;
    }

    public String getRights() {
        return rights;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }
}
