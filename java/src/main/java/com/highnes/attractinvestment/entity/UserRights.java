package com.highnes.attractinvestment.entity;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.entity
 * @Author: ranlongjun
 * @CreateTime: 2020-05-19 09:28
 * @Description: 用户权限
 */
public class UserRights {

    private boolean queryAuth;

    private boolean deleteAuth;

    private boolean updateAuth;

    private boolean addAuth;

    public boolean isQueryAuth() {
        return queryAuth;
    }

    public void setQueryAuth(boolean queryAuth) {
        this.queryAuth = queryAuth;
    }

    public boolean isDeleteAuth() {
        return deleteAuth;
    }

    public void setDeleteAuth(boolean deleteAuth) {
        this.deleteAuth = deleteAuth;
    }

    public boolean isUpdateAuth() {
        return updateAuth;
    }

    public void setUpdateAuth(boolean updateAuth) {
        this.updateAuth = updateAuth;
    }

    public boolean isAddAuth() {
        return addAuth;
    }

    public void setAddAuth(boolean addAuth) {
        this.addAuth = addAuth;
    }
}
