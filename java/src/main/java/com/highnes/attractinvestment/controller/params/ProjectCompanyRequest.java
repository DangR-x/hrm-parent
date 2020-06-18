package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author Rain
 * @date 2020/5/15
 * @description
 */
@ApiModel(description = "项目-主要参与单位")
public class ProjectCompanyRequest {
    @ApiModelProperty(name = "company", example = "单位名称")
    private String company;

    /**
     * 参与单位
     */
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
}
