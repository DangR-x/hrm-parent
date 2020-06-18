package com.highnes.attractinvestment.controller.params;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @author Rain
 * @date 2020/5/20
 * @description
 */
@ApiModel(description = "项目-考察信息")
public class InvestigateRequest {
    @ApiModelProperty(name = "investigateId", example = "考察编码", position = 1)
    private String investigateId;

    @ApiModelProperty(name = "projectId", example = "项目编码", position = 2)
    private String projectId;
    @ApiModelProperty(name = "projectName", example = "项目名称", position = 2)
    private String projectName;

    @ApiModelProperty(name = "investigateStartTime", example = "考察开始时间, yyyy-MM-dd HH:mm:ss", position = 3)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date investigateStartTime;

    @ApiModelProperty(name = "investigateEndTime", example = "考察结束时间, yyyy-MM-dd HH:mm:ss", position = 4)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date investigateEndTime;

    @ApiModelProperty(name = "mainLeader", example = "主要领导", position = 5)
    private String mainLeader;

    @ApiModelProperty(name = "otherLeader", example = "陪同领导", position = 6)
    private String otherLeader;

    @ApiModelProperty(name = "investigatePlane", example = "考察方案", position = 7, hidden = true)
    private String investigatePlane;
    @ApiModelProperty(name = "investigateDetailsRequestList", value = "考察-陪同人员", position = 8)
    private List<InvestigateDetailsRequest> investigateDetailsRequestList;
    @ApiModelProperty(name = "remarks", example = "备注", position = 9)
    private String remarks;
    @ApiModelProperty(name = "investigateFileRequestList", value = "考察方案", position = 9)
    private List<InvestigateFileRequest> investigateFileRequestList;
    @ApiModelProperty(name = "travelDate", example = "出行日期,yyyy-MM-dd HH:mm:ss", position = 10)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date travelDate;
    @ApiModelProperty(name = "travelDate", example = "出行日期,yyyy-MM-dd HH:mm:ss", position = 10)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date returnTripDate;
    @ApiModelProperty(name = "address", example = "考察地点", position = 11)
    private String address;
    @ApiModelProperty(name = "travel", example = "出行时长", position = 12)
    private String travel;

    /**
     * 考察开始时间
     */
    public Date getInvestigateStartTime() {
        return investigateStartTime;
    }

    public void setInvestigateStartTime(Date investigateStartTime) {
        this.investigateStartTime = investigateStartTime;
    }

    /**
     * 考察结束时间
     */
    public Date getInvestigateEndTime() {
        return investigateEndTime;
    }

    public void setInvestigateEndTime(Date investigateEndTime) {
        this.investigateEndTime = investigateEndTime;
    }

    /**
     * 主要领导
     */
    public String getMainLeader() {
        return mainLeader;
    }

    public void setMainLeader(String mainLeader) {
        this.mainLeader = mainLeader;
    }

    /**
     * 陪同领导
     */
    public String getOtherLeader() {
        return otherLeader;
    }

    public void setOtherLeader(String otherLeader) {
        this.otherLeader = otherLeader;
    }

    /**
     * 考察方案
     */
    public String getInvestigatePlane() {
        return investigatePlane;
    }

    public void setInvestigatePlane(String investigatePlane) {
        this.investigatePlane = investigatePlane;
    }

    public List<InvestigateDetailsRequest> getInvestigateDetailsRequestList() {
        return investigateDetailsRequestList;
    }

    public void setInvestigateDetailsRequestList(List<InvestigateDetailsRequest> investigateDetailsRequestList) {
        this.investigateDetailsRequestList = investigateDetailsRequestList;
    }

    /**
     * 考察编码
     */
    public String getInvestigateId() {
        return investigateId;
    }

    public void setInvestigateId(String investigateId) {
        this.investigateId = investigateId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public List<InvestigateFileRequest> getInvestigateFileRequestList() {
        return investigateFileRequestList;
    }

    public void setInvestigateFileRequestList(List<InvestigateFileRequest> investigateFileRequestList) {
        this.investigateFileRequestList = investigateFileRequestList;
    }

    /**
     * 出行日期
     */
    public Date getTravelDate() {
        return travelDate;
    }

    public void setTravelDate(Date travelDate) {
        this.travelDate = travelDate;
    }

    /**
     * 回程日期
     */
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTravel() {
        return travel;
    }

    public void setTravel(String travel) {
        this.travel = travel;
    }
}
