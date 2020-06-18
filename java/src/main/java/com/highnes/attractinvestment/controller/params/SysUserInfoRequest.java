package com.highnes.attractinvestment.controller.params;

import com.highnes.attractinvestment.entity.SysRole;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.controller.params
 * @Author: ranlongjun
 * @CreateTime: 2020-05-19 11:42
 * @Description: 用户请求
 */
@ApiModel(description = "人员信息")
public class SysUserInfoRequest {

    @ApiModelProperty(name = "loginName", example = "登录账号")
    private String loginName;

    @ApiModelProperty(name = "userName", example = "用户昵称")
    private String userName;

    @ApiModelProperty(name = "email", example = "用户邮箱")
    private String email;

    @ApiModelProperty(name = "phonenumber", example = "手机号码")
    private String phonenumber;

    @ApiModelProperty(name = "sex", example = "用户性别（0男 1女 2未知）")
    private String sex;

    @ApiModelProperty(name = "avatar", example = "头像路径")
    private String avatar;

    @ApiModelProperty(name = "password", example = "头像路径")
    private String password;

    @ApiModelProperty(name = "deptId", example = "头像路径")
    private String deptId;


    @ApiModelProperty(name = "roleList", example = "头像路径")
    private List<SysRole> roleList;

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public List<SysRole> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<SysRole> roleList) {
        this.roleList = roleList;
    }
}
