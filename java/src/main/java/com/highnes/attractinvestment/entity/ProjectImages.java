package com.highnes.attractinvestment.entity;

import java.util.Date;

/**
 * 项目画像对象 project_images
 * 
 * @author fuly
 * @date 2020-05-19
 */
public class ProjectImages extends BaseEntity<ProjectImages> {

    /**
     * 所属项目
     */
    private String projectId;

    /**
     * 类型
     */
    private String status;

    /**
     * 是否录入固定资产投资库
     */
    private String uploadFlag;

    /**
     * 固投库项目代码
     */
    private String uploadCode;

    /**
     * 是否参与集中签约
     */
    private String signingFlag;

    /**
     * 集中签约时间
     */
    private Date signingDate;

    /**
     * 是否参加集中开工：0-否，1-是
     */
    private String openFlag;

    /**
     * 集中开工时间
     */
    private Date openDate;


    public ProjectImages(){
        super();
    }

    public ProjectImages(String id){
        super(id);
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setUploadFlag(String uploadFlag) {
        this.uploadFlag = uploadFlag;
    }

    public String getUploadFlag() {
        return uploadFlag;
    }

    public void setUploadCode(String uploadCode) {
        this.uploadCode = uploadCode;
    }

    public String getUploadCode() {
        return uploadCode;
    }

    public void setSigningFlag(String signingFlag) {
        this.signingFlag = signingFlag;
    }

    public String getSigningFlag() {
        return signingFlag;
    }

    public void setSigningDate(Date signingDate) {
        this.signingDate = signingDate;
    }

    public Date getSigningDate() {
        return signingDate;
    }

    public void setOpenFlag(String openFlag) {
        this.openFlag = openFlag;
    }

    public String getOpenFlag() {
        return openFlag;
    }

    public void setOpenDate(Date openDate) {
        this.openDate = openDate;
    }

    public Date getOpenDate() {
        return openDate;
    }


}
