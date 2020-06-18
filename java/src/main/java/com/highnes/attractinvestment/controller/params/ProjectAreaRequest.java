package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author Rain
 * @date 2020/5/15
 * @description
 */
@ApiModel(description = "项目-空间需求")
public class ProjectAreaRequest {
    @ApiModelProperty(name = "areaType", example = "空间类型")
    private String areaType;
    @ApiModelProperty(name = "areaCount", example = "空间数量")
    private String areaCount;

    /**
     * 空间类型
     */
    public String getAreaType() {
        return areaType;
    }

    public void setAreaType(String areaType) {
        this.areaType = areaType;
    }

    /**
     * 空间数量
     */
    public String getAreaCount() {
        return areaCount;
    }

    public void setAreaCount(String areaCount) {
        this.areaCount = areaCount;
    }
}
