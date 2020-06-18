package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * @author Rain
 * @date 2020/5/25
 * @description
 */
@ApiModel(description = "项目合同")
public class ContractRequest {
    @ApiModelProperty(name = "status", example = "状态：1-敲定协议， 2-司法审核通过，3-常务会议决策，4-常委会议决策", position = 2)
    private String status;

    @ApiModelProperty(name = "meetingCode", example = "常务会代码", position = 3)
    private String meetingCode;

    @ApiModelProperty(name = "meetingCodeTwo", example = "常委会代码", position = 4)
    private String meetingCodeTwo;

    @ApiModelProperty(name = "contractItems", example = "合同条款", position = 5, hidden = true)
    private String contractItems;
    @ApiModelProperty(name = "projectId", example = "项目编码", position = 1)
    private String projectId;
    @ApiModelProperty(name = "contractId", example = "合同编码", position = 1)
    private String contractId;
    @ApiModelProperty(name = "contractDetailsRequestList", value = "合同详情", position = 6)
    private List<ContractDetailsRequest> contractDetailsRequestList;
    @ApiModelProperty(name = "signFlag", example = "是否敲定协议:0-否，1-是", position = 2)
    private String signFlag;
    @ApiModelProperty(name = "legFlag", example = "是否司法审核通过:0-否，1-是", position = 2)
    private String legFlag;
    @ApiModelProperty(name = "meetingFlag", example = "是否常务会议决策:0-否，1-是", position = 2)
    private String meetingFlag;
    @ApiModelProperty(name = "meetingTwoFlag", example = "是否常委会议决策:0-否，1-是", position = 4)
    private String meetingTwoFlag;

    /**
     * 状态：1-敲定协议， 2-司法审核通过，3-常务会议决策，4-常委会议决策
     */
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 常务会代码
     */
    public String getMeetingCode() {
        return meetingCode;
    }

    public void setMeetingCode(String meetingCode) {
        this.meetingCode = meetingCode;
    }

    /**
     * 常委会代码
     */
    public String getMeetingCodeTwo() {
        return meetingCodeTwo;
    }

    public void setMeetingCodeTwo(String meetingCodeTwo) {
        this.meetingCodeTwo = meetingCodeTwo;
    }

    /**
     * 合同条款
     */
    public String getContractItems() {
        return contractItems;
    }

    public void setContractItems(String contractItems) {
        this.contractItems = contractItems;
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

    public String getContractId() {
        return contractId;
    }

    public void setContractId(String contractId) {
        this.contractId = contractId;
    }

    public List<ContractDetailsRequest> getContractDetailsRequestList() {
        return contractDetailsRequestList;
    }

    public void setContractDetailsRequestList(List<ContractDetailsRequest> contractDetailsRequestList) {
        this.contractDetailsRequestList = contractDetailsRequestList;
    }

    /**
     * 是否敲定协议
     */
    public String getSignFlag() {
        return signFlag;
    }

    public void setSignFlag(String signFlag) {
        this.signFlag = signFlag;
    }

    /**
     * 是否司法审核通过
     */
    public String getLegFlag() {
        return legFlag;
    }

    public void setLegFlag(String legFlag) {
        this.legFlag = legFlag;
    }

    /**
     * 是否常务会议决策
     */
    public String getMeetingFlag() {
        return meetingFlag;
    }

    public void setMeetingFlag(String meetingFlag) {
        this.meetingFlag = meetingFlag;
    }

    /**
     * 是否常务会议决策
     */
    public String getMeetingTwoFlag() {
        return meetingTwoFlag;
    }

    public void setMeetingTwoFlag(String meetingTwoFlag) {
        this.meetingTwoFlag = meetingTwoFlag;
    }
}
