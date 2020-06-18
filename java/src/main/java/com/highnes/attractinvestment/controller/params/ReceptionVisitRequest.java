package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author Rain
 * @date 2020/5/21
 * @description
 */
@ApiModel(description = "接待详情-到访人员")
public class ReceptionVisitRequest {
    @ApiModelProperty(name = "name", example = "姓名")
    private String name;

    @ApiModelProperty(name = "title", example = "职务")
    private String title;

    /**
     * 姓名
     */
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * 职务
     */
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
