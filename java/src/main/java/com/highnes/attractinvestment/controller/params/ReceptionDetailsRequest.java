package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author Rain
 * @date 2020/5/21
 * @description
 */
@ApiModel(description = "接待详情-陪同人员")
public class ReceptionDetailsRequest {
    @ApiModelProperty(name = "dept", example = "部门")
    private String dept;

    @ApiModelProperty(name = "name", example = "姓名")
    private String name;

    /**
     * 部门
     */
    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    /**
     * 姓名
     */
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
