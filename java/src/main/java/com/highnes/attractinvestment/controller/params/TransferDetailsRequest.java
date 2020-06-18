package com.highnes.attractinvestment.controller.params;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author Rain
 * @date 2020/6/2
 * @description
 */
@ApiModel(description = "移交信息")
public class TransferDetailsRequest {
    @ApiModelProperty(name = "projectId", example = "项目编码", position = 1)
    private String projectId;

    @ApiModelProperty(name = "projectName", example = "项目名称", position = 2)
    private String projectName;

    @ApiModelProperty(name = "fromGroupId", example = "转办人所属小组", position = 3)
    private String fromGroupId;

    @ApiModelProperty(name = "fromCreateBy", example = "转办人编码", position = 4)
    private String fromCreateBy;

    @ApiModelProperty(name = "fromCreateName", example = "转办人姓名", position = 5)
    private String fromCreateName;

    @ApiModelProperty(name = "dealDate", example = "转办时间,yyyy-MM-dd HH:mm:ss", position = 6)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date dealDate;

    @ApiModelProperty(name = "toCreateBy", example = "移交对象编码", position = 7)
    private String toCreateBy;

    @ApiModelProperty(name = "toCreateName", example = "移交对象姓名", position = 8)
    private String toCreateName;

    @ApiModelProperty(name = "toGroupId", example = "移交所属小组", position = 9)
    private String toGroupId;

    /**
     * 项目编码
     */
    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    /**
     * 项目名称
     */
    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    /**
     * 转办人所属小组
     */
    public String getFromGroupId() {
        return fromGroupId;
    }

    public void setFromGroupId(String fromGroupId) {
        this.fromGroupId = fromGroupId;
    }

    /**
     * 转办人编码
     */
    public String getFromCreateBy() {
        return fromCreateBy;
    }

    public void setFromCreateBy(String fromCreateBy) {
        this.fromCreateBy = fromCreateBy;
    }

    /**
     * 转办人姓名
     */
    public String getFromCreateName() {
        return fromCreateName;
    }

    public void setFromCreateName(String fromCreateName) {
        this.fromCreateName = fromCreateName;
    }

    /**
     * 转办时间
     */
    public Date getDealDate() {
        return dealDate;
    }

    public void setDealDate(Date dealDate) {
        this.dealDate = dealDate;
    }

    /**
     * 移交对象编码
     */
    public String getToCreateBy() {
        return toCreateBy;
    }

    public void setToCreateBy(String toCreateBy) {
        this.toCreateBy = toCreateBy;
    }

    /**
     * 移交对象姓名
     */
    public String getToCreateName() {
        return toCreateName;
    }

    public void setToCreateName(String toCreateName) {
        this.toCreateName = toCreateName;
    }

    /**
     * 移交所属小组
     */
    public String getToGroupId() {
        return toGroupId;
    }

    public void setToGroupId(String toGroupId) {
        this.toGroupId = toGroupId;
    }
}
