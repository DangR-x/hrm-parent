package com.highnes.attractinvestment.controller.params;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author Rain
 * @date 2020/5/19
 * @description
 */
@ApiModel(description = "项目进展维护")
public class DealDetailsRequest {

    @ApiModelProperty(name = "detailsId", example = "进展编码")
    private String detailsId;
    @ApiModelProperty(name = "projectName", example = "项目名称")
    private String projectName;

    @ApiModelProperty(name = "projectId", example = "项目编码")
    private String projectId;

    @ApiModelProperty(name = "dealUserName", example = "跟进人")
    private String dealUserName;

    @ApiModelProperty(name = "dealCreateDate", example = "跟进时间, yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date dealCreateDate;

    @ApiModelProperty(name = "dealType", example = "对接方式")
    private String dealType;

    @ApiModelProperty(name = "companyUserName", example = "企业联系人")
    private String companyUserName;

    @ApiModelProperty(name = "companyUserPost", example = "联系人职务")
    private String companyUserPost;

    @ApiModelProperty(name = "projectDebriefing", example = "项目进展")
    private String projectDebriefing;

    @ApiModelProperty(name = "projectIssues", example = "当前存在的问题")
    private String projectIssues;

    @ApiModelProperty(name = "projectFollowUp", example = "后续推进安排")
    private String projectFollowUp;

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
     * 项目编码
     */
    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    /**
     * 跟进人
     */
    public String getDealUserName() {
        return dealUserName;
    }

    public void setDealUserName(String dealUserName) {
        this.dealUserName = dealUserName;
    }

    /**
     * 跟进时间
     */
    public Date getDealCreateDate() {
        return dealCreateDate;
    }

    public void setDealCreateDate(Date dealCreateDate) {
        this.dealCreateDate = dealCreateDate;
    }

    /**
     * 对接方式
     */
    public String getDealType() {
        return dealType;
    }

    public void setDealType(String dealType) {
        this.dealType = dealType;
    }

    /**
     * 企业联系人
     */
    public String getCompanyUserName() {
        return companyUserName;
    }

    public void setCompanyUserName(String companyUserName) {
        this.companyUserName = companyUserName;
    }

    /**
     * 联系人职务
     */
    public String getCompanyUserPost() {
        return companyUserPost;
    }

    public void setCompanyUserPost(String companyUserPost) {
        this.companyUserPost = companyUserPost;
    }

    /**
     * 项目进展
     */
    public String getProjectDebriefing() {
        return projectDebriefing;
    }

    public void setProjectDebriefing(String projectDebriefing) {
        this.projectDebriefing = projectDebriefing;
    }

    /**
     * 当前存在的问题
     */
    public String getProjectIssues() {
        return projectIssues;
    }

    public void setProjectIssues(String projectIssues) {
        this.projectIssues = projectIssues;
    }

    /**
     * 后续推进安排
     */
    public String getProjectFollowUp() {
        return projectFollowUp;
    }

    public void setProjectFollowUp(String projectFollowUp) {
        this.projectFollowUp = projectFollowUp;
    }

    public String getDetailsId() {
        return detailsId;
    }

    public void setDetailsId(String detailsId) {
        this.detailsId = detailsId;
    }
}
