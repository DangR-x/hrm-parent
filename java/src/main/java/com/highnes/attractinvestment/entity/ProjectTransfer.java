package com.highnes.attractinvestment.entity;

import java.util.Date;

/**
 * 转办移交记录对象 project_transfer
 * 
 * @author fuly
 * @date 2020-06-02
 */
public class ProjectTransfer extends BaseEntity<ProjectTransfer> {

    /**
     * 项目编码
     */
    private String projectId;

    /**
     * 项目名称
     */
    private String projectName;

    /**
     * 转办人所属小组
     */
    private String fromGroupId;

    /**
     * 转办人编码
     */
    private String fromCreateBy;

    /**
     * 转办人姓名
     */
    private String fromCreateName;

    /**
     * 转办时间
     */
    private Date dealDate;

    /**
     * 移交对象编码
     */
    private String toCreateBy;

    /**
     * 移交对象姓名
     */
    private String toCreateName;

    /**
     * 移交所属小组
     */
    private String toGroupId;


    public ProjectTransfer(){
        super();
    }

    public ProjectTransfer(String id){
        super(id);
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setFromGroupId(String fromGroupId) {
        this.fromGroupId = fromGroupId;
    }

    public String getFromGroupId() {
        return fromGroupId;
    }

    public void setFromCreateBy(String fromCreateBy) {
        this.fromCreateBy = fromCreateBy;
    }

    public String getFromCreateBy() {
        return fromCreateBy;
    }

    public void setFromCreateName(String fromCreateName) {
        this.fromCreateName = fromCreateName;
    }

    public String getFromCreateName() {
        return fromCreateName;
    }

    public void setDealDate(Date dealDate) {
        this.dealDate = dealDate;
    }

    public Date getDealDate() {
        return dealDate;
    }

    public void setToCreateBy(String toCreateBy) {
        this.toCreateBy = toCreateBy;
    }

    public String getToCreateBy() {
        return toCreateBy;
    }

    public void setToCreateName(String toCreateName) {
        this.toCreateName = toCreateName;
    }

    public String getToCreateName() {
        return toCreateName;
    }

    public void setToGroupId(String toGroupId) {
        this.toGroupId = toGroupId;
    }

    public String getToGroupId() {
        return toGroupId;
    }


}
