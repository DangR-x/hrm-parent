package com.highnes.attractinvestment.entity;

import java.util.Date;

/**
 * 项目-政策兑现对象 project_exchange
 * 
 * @author fuly
 * @date 2020-06-04
 */
public class ProjectExchange extends BaseEntity<ProjectExchange> {

    /**
     * 所属项目
     */
    private String projectId;

    /**
     * 合同编号
     */
    private String contractCode;

    /**
     * 合同条款内容
     */
    private String contractItems;

    /**
     * 是否满足兑现条款
     */
    private String preExchangeFlag;

    /**
     * 政策是否已兑现
     */
    private String exchangedFlag;

    /**
     * 兑现内容
     */
    private String exchangeItems;

    /**
     * 兑现时间
     */
    private Date exchangeDate;

    /**
     * 政策兑现人编码
     */
    private String exchangeUserId;

    /**
     * 政策兑现人
     */
    private String exchangeUserName;


    public ProjectExchange(){
        super();
    }

    public ProjectExchange(String id){
        super(id);
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setContractCode(String contractCode) {
        this.contractCode = contractCode;
    }

    public String getContractCode() {
        return contractCode;
    }

    public void setContractItems(String contractItems) {
        this.contractItems = contractItems;
    }

    public String getContractItems() {
        return contractItems;
    }

    public void setPreExchangeFlag(String preExchangeFlag) {
        this.preExchangeFlag = preExchangeFlag;
    }

    public String getPreExchangeFlag() {
        return preExchangeFlag;
    }

    public void setExchangedFlag(String exchangedFlag) {
        this.exchangedFlag = exchangedFlag;
    }

    public String getExchangedFlag() {
        return exchangedFlag;
    }

    public void setExchangeItems(String exchangeItems) {
        this.exchangeItems = exchangeItems;
    }

    public String getExchangeItems() {
        return exchangeItems;
    }

    public void setExchangeDate(Date exchangeDate) {
        this.exchangeDate = exchangeDate;
    }

    public Date getExchangeDate() {
        return exchangeDate;
    }

    public void setExchangeUserId(String exchangeUserId) {
        this.exchangeUserId = exchangeUserId;
    }

    public String getExchangeUserId() {
        return exchangeUserId;
    }

    public void setExchangeUserName(String exchangeUserName) {
        this.exchangeUserName = exchangeUserName;
    }

    public String getExchangeUserName() {
        return exchangeUserName;
    }


}
