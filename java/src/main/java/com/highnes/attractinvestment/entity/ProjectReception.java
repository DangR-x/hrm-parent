package com.highnes.attractinvestment.entity;

import java.util.Date;
import java.util.List;

/**
 * 项目-接待信息对象 project_reception
 * 
 * @author fuly
 * @date 2020-05-21
 */
public class ProjectReception extends BaseEntity<ProjectReception> {
    /**
     * 所属项目
     */
    private String projectId;
    /**
     * 项目名称
     */
    private String projectName;

    /**
     * 接待日期
     */
    private Date receptionDate;

    /**
     * 主要领导
     */
    private String mainLeader;

    /**
     * 陪同领导
     */
    private String otherLeader;
    /**
     * 到访人员
     */
    private List<ProjectReceptionVisit> projectReceptionVisitList;
    /**
     * 陪同人员
     */
    private List<ProjectReceptionDetails> projectReceptionDetailsList;
    /**
     * 接待方案
     */
    private List<ProjectReceptionFile> projectReceptionFileList;
    private ProjectInfo projectInfo;


    public ProjectReception(){
        super();
    }

    public ProjectReception(String id){
        super(id);
    }

    public void setReceptionDate(Date receptionDate) {
        this.receptionDate = receptionDate;
    }

    public Date getReceptionDate() {
        return receptionDate;
    }

    public void setMainLeader(String mainLeader) {
        this.mainLeader = mainLeader;
    }

    public String getMainLeader() {
        return mainLeader;
    }

    public void setOtherLeader(String otherLeader) {
        this.otherLeader = otherLeader;
    }

    public String getOtherLeader() {
        return otherLeader;
    }


    public List<ProjectReceptionVisit> getProjectReceptionVisitList() {
        return projectReceptionVisitList;
    }

    public void setProjectReceptionVisitList(List<ProjectReceptionVisit> projectReceptionVisitList) {
        this.projectReceptionVisitList = projectReceptionVisitList;
    }

    public List<ProjectReceptionDetails> getProjectReceptionDetailsList() {
        return projectReceptionDetailsList;
    }

    public void setProjectReceptionDetailsList(List<ProjectReceptionDetails> projectReceptionDetailsList) {
        this.projectReceptionDetailsList = projectReceptionDetailsList;
    }

    public List<ProjectReceptionFile> getProjectReceptionFileList() {
        return projectReceptionFileList;
    }

    public void setProjectReceptionFileList(List<ProjectReceptionFile> projectReceptionFileList) {
        this.projectReceptionFileList = projectReceptionFileList;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public ProjectInfo getProjectInfo() {
        return projectInfo;
    }

    public void setProjectInfo(ProjectInfo projectInfo) {
        this.projectInfo = projectInfo;
    }
}
