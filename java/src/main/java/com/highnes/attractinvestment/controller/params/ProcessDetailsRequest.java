package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author Rain
 * @date 2020/5/25
 * @description
 */
@ApiModel(description = "审批流程-成员审批详情")
public class ProcessDetailsRequest {

    @ApiModelProperty(name = "userId", example = "用户编码", position = 1)
    private String userId;

    @ApiModelProperty(name = "userName", example = "用户姓名", position = 2)
    private String userName;

    @ApiModelProperty(name = "sort", example = "排序", position = 3)
    private Integer sort;

    /**
     * 用户编码
     */
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * 用户姓名
     */
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 排序
     */
    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
}
