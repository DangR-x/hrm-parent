package com.highnes.attractinvestment.entity;

import java.util.Date;

/**
 * 政策兑现对象 cash_policy
 * 
 * @author ranlj
 * @date 2020-05-26
 */
public class CashPolicy extends BaseEntity<CashPolicy> {

    /**
     * 合同ID
     */
    private String constructId;

    /**
     * 合同内容
     */
    private String constructText;

    /**
     * 是否兑现条款  0为兑现 1为不兑现
     */
    private String cashTerms;

    /**
     * 是否兑现政策  0为兑现 1为不兑现
     */
    private String cashPolicy;

    /**
     * 兑现内容
     */
    private String cashText;

    /**
     * 兑现时间
     */
    private Date cashDate;

    /**
     * 兑现人
     */
    private String cashBy;

    /**
     * 创建时间
     */
    private Date createTime;


    public CashPolicy(){
        super();
    }

    public CashPolicy(String id){
        super(id);
    }

    public void setConstructId(String constructId) {
        this.constructId = constructId;
    }

    public String getConstructId() {
        return constructId;
    }

    public void setConstructText(String constructText) {
        this.constructText = constructText;
    }

    public String getConstructText() {
        return constructText;
    }

    public void setCashTerms(String cashTerms) {
        this.cashTerms = cashTerms;
    }

    public String getCashTerms() {
        return cashTerms;
    }

    public void setCashPolicy(String cashPolicy) {
        this.cashPolicy = cashPolicy;
    }

    public String getCashPolicy() {
        return cashPolicy;
    }

    public void setCashText(String cashText) {
        this.cashText = cashText;
    }

    public String getCashText() {
        return cashText;
    }

    public void setCashDate(Date cashDate) {
        this.cashDate = cashDate;
    }

    public Date getCashDate() {
        return cashDate;
    }

    public void setCashBy(String cashBy) {
        this.cashBy = cashBy;
    }

    public String getCashBy() {
        return cashBy;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCreateTime() {
        return createTime;
    }


}
