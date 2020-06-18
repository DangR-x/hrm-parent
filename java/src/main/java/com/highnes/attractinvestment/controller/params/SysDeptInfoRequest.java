package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.controller.params
 * @Author: ranlongjun
 * @CreateTime: 2020-05-20 09:42
 * @Description: 单位管理
 */

@ApiModel(description = "单位信息")
public class SysDeptInfoRequest {

    @ApiModelProperty(name = "parentId", example = "父部门id")
    private String parentId;

    @ApiModelProperty(name = "ancestors", example = "祖级列表")
    private String ancestors;

    @ApiModelProperty(name = "deptName", example = "部门名称")
    private String deptName;

    @ApiModelProperty(name = "orderNum", example = "显示顺序")
    private String orderNum;

    @ApiModelProperty(name = "deptLevel", example = "部门level")
    private String deptLevel;

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getAncestors() {
        return ancestors;
    }

    public void setAncestors(String ancestors) {
        this.ancestors = ancestors;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getDeptLevel() {
        return deptLevel;
    }

    public void setDeptLevel(String deptLevel) {
        this.deptLevel = deptLevel;
    }
}
