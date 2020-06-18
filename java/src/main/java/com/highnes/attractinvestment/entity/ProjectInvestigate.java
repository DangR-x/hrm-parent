package com.highnes.attractinvestment.entity;

import java.util.Date;
import java.util.List;

/**
 * 项目-考察信息对象 project_investigate
 * 
 * @author fuly
 * @date 2020-05-20
 */
public class ProjectInvestigate extends BaseEntity<ProjectInvestigate> {

    /**
     * 所属项目
     */
    private String projectId;
    /**
     * 项目名称
     */
    private String projectName;

    /**
     * 考察开始时间
     */
    private Date investigateStartTime;

    /**
     * 考察结束时间
     */
    private Date investigateEndTime;

    /**
     * 主要人员
     */
    private String mainLeader;

    /**
     * 陪同领导
     */
    private String otherLeader;

    /**
     * 考察方案
     */
    private String investigatePlane;
    /**
     * 出行日期
     */
    private Date travelDate;
    /**
     * 回程日期
     */
    private Date returnTripDate;
    private ProjectInfo projectInfo;

    private List<ProjectInvestigateDetails> projectInvestigateDetailsList;
    /**
     * 考察方案
     */
    private List<ProjectInvestigateFile> projectInvestigateFileList;
    /**
     * 出行时长
     */
    private String travel;
    /**
     * 考察地点
     */
    private String address;


    public ProjectInvestigate(){
        super();
    }

    public ProjectInvestigate(String id){
        super(id);
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setInvestigateStartTime(Date investigateStartTime) {
        this.investigateStartTime = investigateStartTime;
    }

    public Date getInvestigateStartTime() {
        return investigateStartTime;
    }

    public void setInvestigateEndTime(Date investigateEndTime) {
        this.investigateEndTime = investigateEndTime;
    }

    public Date getInvestigateEndTime() {
        return investigateEndTime;
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

    public void setInvestigatePlane(String investigatePlane) {
        this.investigatePlane = investigatePlane;
    }

    public String getInvestigatePlane() {
        return investigatePlane;
    }


    /**
     * 陪同人员
     */
    public List<ProjectInvestigateDetails> getProjectInvestigateDetailsList() {
        return projectInvestigateDetailsList;
    }

    public void setProjectInvestigateDetailsList(List<ProjectInvestigateDetails> projectInvestigateDetailsList) {
        this.projectInvestigateDetailsList = projectInvestigateDetailsList;
    }

    public List<ProjectInvestigateFile> getProjectInvestigateFileList() {
        return projectInvestigateFileList;
    }

    public void setProjectInvestigateFileList(List<ProjectInvestigateFile> projectInvestigateFileList) {
        this.projectInvestigateFileList = projectInvestigateFileList;
    }

    public Date getTravelDate() {
        return travelDate;
    }

    public void setTravelDate(Date travelDate) {
        this.travelDate = travelDate;
    }

    public Date getReturnTripDate() {
        return returnTripDate;
    }

    public void setReturnTripDate(Date returnTripDate) {
        this.returnTripDate = returnTripDate;
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

    public String getTravel() {
        return travel;
    }

    public void setTravel(String travel) {
        this.travel = travel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
