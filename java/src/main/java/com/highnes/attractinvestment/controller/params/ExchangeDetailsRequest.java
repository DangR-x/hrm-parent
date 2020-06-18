package com.highnes.attractinvestment.controller.params;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author Rain
 * @date 2020/6/4
 * @description
 */
@ApiModel(description = "项目-政策兑现详情")
public class ExchangeDetailsRequest {

    @ApiModelProperty(name = "projectId", example = "所属项目", position = 1)
    private String projectId;
    @ApiModelProperty(name = "exchangeId", example = "兑现编码", position = 1)
    private String exchangeId;

    @ApiModelProperty(name = "contractCode", example = "合同编号", position = 2)
    private String contractCode;

    @ApiModelProperty(name = "contractItems", example = "合同条款内容", position = 3)
    private String contractItems;

    @ApiModelProperty(name = "preExchangeFlag", example = "是否满足兑现条款：0-否，1-是", position = 4)
    private String preExchangeFlag;

    @ApiModelProperty(name = "exchangedFlag", example = "政策是否已兑现：0-否，1-是", position = 5)
    private String exchangedFlag;

    @ApiModelProperty(name = "exchangeItems", example = "兑现内容", position = 6)
    private String exchangeItems;

    @ApiModelProperty(name = "exchangeDate", example = "兑现时间，yyyy-MM-dd HH:mm:ss", position = 7)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date exchangeDate;

    @ApiModelProperty(name = "exchangeUserId", example = "政策兑现人编码", position = 8)
    private String exchangeUserId;

    @ApiModelProperty(name = "exchangeUserName", example = "政策兑现人", position = 9)
    private String exchangeUserName;

    /**
     * 所属项目
     */
    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    /**
     * 合同编号
     */
    public String getContractCode() {
        return contractCode;
    }

    public void setContractCode(String contractCode) {
        this.contractCode = contractCode;
    }

    /**
     * 合同条款内容
     */
    public String getContractItems() {
        return contractItems;
    }

    public void setContractItems(String contractItems) {
        this.contractItems = contractItems;
    }

    /**
     * 是否满足兑现条款
     */
    public String getPreExchangeFlag() {
        return preExchangeFlag;
    }

    public void setPreExchangeFlag(String preExchangeFlag) {
        this.preExchangeFlag = preExchangeFlag;
    }

    /**
     * 政策是否已兑现
     */
    public String getExchangedFlag() {
        return exchangedFlag;
    }

    public void setExchangedFlag(String exchangedFlag) {
        this.exchangedFlag = exchangedFlag;
    }

    /**
     * 兑现内容
     */
    public String getExchangeItems() {
        return exchangeItems;
    }

    public void setExchangeItems(String exchangeItems) {
        this.exchangeItems = exchangeItems;
    }

    /**
     * 兑现时间
     */
    public Date getExchangeDate() {
        return exchangeDate;
    }

    public void setExchangeDate(Date exchangeDate) {
        this.exchangeDate = exchangeDate;
    }

    /**
     * 政策兑现人编码
     */
    public String getExchangeUserId() {
        return exchangeUserId;
    }

    public void setExchangeUserId(String exchangeUserId) {
        this.exchangeUserId = exchangeUserId;
    }

    /**
     * 政策兑现人
     */
    public String getExchangeUserName() {
        return exchangeUserName;
    }

    public void setExchangeUserName(String exchangeUserName) {
        this.exchangeUserName = exchangeUserName;
    }

    public String getExchangeId() {
        return exchangeId;
    }

    public void setExchangeId(String exchangeId) {
        this.exchangeId = exchangeId;
    }
}
