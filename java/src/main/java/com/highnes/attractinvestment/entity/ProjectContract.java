package com.highnes.attractinvestment.entity;


import java.util.List;

/**
 * 项目合同信息对象 project_contract
 * 
 * @author fuly
 * @date 2020-05-25
 */
public class ProjectContract extends BaseEntity<ProjectContract> {
    /**
     * 是否敲定协议
     */
    private String signFlag;
    /**
     * 是否司法审核通过
     */
    private String legFlag;
    /**
     * 是否常务会议决策
     */
    private String meetingFlag;
    /**
     * 是否常务会议决策
     */
    private String meetingTwoFlag;

    /**
     * 状态：1-敲定协议， 2-司法审核通过，3-常务会议决策，4-常委会议决策
     */
    private String status;

    /**
     * 常务会代码
     */
    private String meetingCode;

    /**
     * 常委会代码
     */
    private String meetingCodeTwo;

    /**
     * 合同条款
     */
    private String contractItems;
    /**
     * 项目编码
     */
    private String projectId;
    /**
     * 合同详情
     */
    private List<ProjectContractDetails> projectContractDetailsList;


    public ProjectContract(){
        super();
    }

    public ProjectContract(String id){
        super(id);
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setMeetingCode(String meetingCode) {
        this.meetingCode = meetingCode;
    }

    public String getMeetingCode() {
        return meetingCode;
    }

    public void setMeetingCodeTwo(String meetingCodeTwo) {
        this.meetingCodeTwo = meetingCodeTwo;
    }

    public String getMeetingCodeTwo() {
        return meetingCodeTwo;
    }

    public void setContractItems(String contractItems) {
        this.contractItems = contractItems;
    }

    public String getContractItems() {
        return contractItems;
    }


    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public List<ProjectContractDetails> getProjectContractDetailsList() {
        return projectContractDetailsList;
    }

    public void setProjectContractDetailsList(List<ProjectContractDetails> projectContractDetailsList) {
        this.projectContractDetailsList = projectContractDetailsList;
    }

    public String getSignFlag() {
        return signFlag;
    }

    public void setSignFlag(String signFlag) {
        this.signFlag = signFlag;
    }

    public String getLegFlag() {
        return legFlag;
    }

    public void setLegFlag(String legFlag) {
        this.legFlag = legFlag;
    }

    public String getMeetingFlag() {
        return meetingFlag;
    }

    public void setMeetingFlag(String meetingFlag) {
        this.meetingFlag = meetingFlag;
    }

    public String getMeetingTwoFlag() {
        return meetingTwoFlag;
    }

    public void setMeetingTwoFlag(String meetingTwoFlag) {
        this.meetingTwoFlag = meetingTwoFlag;
    }
}
