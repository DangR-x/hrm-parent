package com.highnes.attractinvestment.entity;

import java.util.Date;

/**
 * 项目进展维护对象 project_deal_details
 * 
 * @author fuly
 * @date 2020-05-19
 */
public class ProjectDealDetails extends BaseEntity<ProjectDealDetails> {

    /**
     * 项目名称
     */
    private String projectName;

    /**
     * 项目编码
     */
    private String projectId;

    /**
     * 跟进人
     */
    private String dealUserName;

    /**
     * 跟进时间
     */
    private Date dealCreateDate;

    /**
     * 对接方式
     */
    private String dealType;

    /**
     * 企业联系人
     */
    private String companyUserName;

    /**
     * 联系人职务
     */
    private String companyUserPost;

    /**
     * 项目进展
     */
    private String projectDebriefing;

    /**
     * 当前存在的问题
     */
    private String projectIssues;

    /**
     * 后续推进安排
     */
    private String projectFollowUp;


    public ProjectDealDetails(){
        super();
    }

    public ProjectDealDetails(String id){
        super(id);
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setDealUserName(String dealUserName) {
        this.dealUserName = dealUserName;
    }

    public String getDealUserName() {
        return dealUserName;
    }

    public void setDealCreateDate(Date dealCreateDate) {
        this.dealCreateDate = dealCreateDate;
    }

    public Date getDealCreateDate() {
        return dealCreateDate;
    }

    public void setDealType(String dealType) {
        this.dealType = dealType;
    }

    public String getDealType() {
        return dealType;
    }

    public void setCompanyUserName(String companyUserName) {
        this.companyUserName = companyUserName;
    }

    public String getCompanyUserName() {
        return companyUserName;
    }

    public void setCompanyUserPost(String companyUserPost) {
        this.companyUserPost = companyUserPost;
    }

    public String getCompanyUserPost() {
        return companyUserPost;
    }

    public void setProjectDebriefing(String projectDebriefing) {
        this.projectDebriefing = projectDebriefing;
    }

    public String getProjectDebriefing() {
        return projectDebriefing;
    }

    public void setProjectIssues(String projectIssues) {
        this.projectIssues = projectIssues;
    }

    public String getProjectIssues() {
        return projectIssues;
    }

    public void setProjectFollowUp(String projectFollowUp) {
        this.projectFollowUp = projectFollowUp;
    }

    public String getProjectFollowUp() {
        return projectFollowUp;
    }


}
