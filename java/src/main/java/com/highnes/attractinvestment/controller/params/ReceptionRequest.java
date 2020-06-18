package com.highnes.attractinvestment.controller.params;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @author Rain
 * @date 2020/5/21
 * @description
 */
@ApiModel(description = "接待详情")
public class ReceptionRequest {
    @ApiModelProperty(name = "projectId", example = "项目编码", position = 1)
    private String projectId;
    @ApiModelProperty(name = "receptionId", example = "接待编码", position = 2)
    private String receptionId;
    @ApiModelProperty(name = "projectName", example = "项目名称", position = 1)
    private String projectName;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(name = "receptionDate", example = "接待日期，yyyy-MM-dd HH:mm:ss", position = 3)
    private Date receptionDate;

    @ApiModelProperty(name = "mainLeader", example = "主要领导", position = 4)
    private String mainLeader;

    @ApiModelProperty(name = "otherLeader", example = "陪同领导", position = 5)
    private String otherLeader;
    @ApiModelProperty(name = "remarks", example = "备注", position = 6)
    private String remarks;
    @ApiModelProperty(name = "receptionVisitRequestList", value = "到访人员", position = 7)
    private List<ReceptionVisitRequest> receptionVisitRequestList;
    @ApiModelProperty(name = "receptionDetailsRequestList", value = "陪同人员", position = 8)
    private List<ReceptionDetailsRequest> receptionDetailsRequestList;
    @ApiModelProperty(name = "receptionFileRequestList", value = "接待方案", position = 9)
    private List<ReceptionFileRequest> receptionFileRequestList;

    /**
     * 接待日期
     */
    public Date getReceptionDate() {
        return receptionDate;
    }

    public void setReceptionDate(Date receptionDate) {
        this.receptionDate = receptionDate;
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

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public List<ReceptionVisitRequest> getReceptionVisitRequestList() {
        return receptionVisitRequestList;
    }

    public void setReceptionVisitRequestList(List<ReceptionVisitRequest> receptionVisitRequestList) {
        this.receptionVisitRequestList = receptionVisitRequestList;
    }

    public List<ReceptionDetailsRequest> getReceptionDetailsRequestList() {
        return receptionDetailsRequestList;
    }

    public void setReceptionDetailsRequestList(List<ReceptionDetailsRequest> receptionDetailsRequestList) {
        this.receptionDetailsRequestList = receptionDetailsRequestList;
    }

    public List<ReceptionFileRequest> getReceptionFileRequestList() {
        return receptionFileRequestList;
    }

    public void setReceptionFileRequestList(List<ReceptionFileRequest> receptionFileRequestList) {
        this.receptionFileRequestList = receptionFileRequestList;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getReceptionId() {
        return receptionId;
    }

    public void setReceptionId(String receptionId) {
        this.receptionId = receptionId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }
}
