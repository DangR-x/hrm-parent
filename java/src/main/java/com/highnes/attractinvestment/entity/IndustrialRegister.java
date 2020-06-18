package com.highnes.attractinvestment.entity;

import java.util.Date;

/**
 * 工商注册对象 industrial_register
 * 
 * @author ranlj
 * @date 2020-05-21
 */
public class IndustrialRegister extends BaseEntity<IndustrialRegister> {

    /**
     * 企业名称
     */
    private String companyName;

    /**
     * 信用代码
     */
    private String creditCode;

    /**
     * 所属行业
     */
    private String tradeName;

    /**
     * 行业ID
     */
    private String tradeId;

    /**
     * 注册资本
     */
    private String registerCapital;

    /**
     * 企业注册地
     */
    private String companyLocation;

    /**
     * 企业法人
     */
    private String juridicalPerson;

    /**
     * 所属项目
     */
    private String projectId;

    /**
     * 所属项目名称
     */
    private String projectName;

    /**
     * 法人电话
     */
    private String juridicalPhone;


    public IndustrialRegister(){
        super();
    }

    public IndustrialRegister(String id){
        super(id);
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCreditCode(String creditCode) {
        this.creditCode = creditCode;
    }

    public String getCreditCode() {
        return creditCode;
    }

    public void setTradeName(String tradeName) {
        this.tradeName = tradeName;
    }

    public String getTradeName() {
        return tradeName;
    }

    public void setTradeId(String tradeId) {
        this.tradeId = tradeId;
    }

    public String getTradeId() {
        return tradeId;
    }

    public void setRegisterCapital(String registerCapital) {
        this.registerCapital = registerCapital;
    }

    public String getRegisterCapital() {
        return registerCapital;
    }

    public void setCompanyLocation(String companyLocation) {
        this.companyLocation = companyLocation;
    }

    public String getCompanyLocation() {
        return companyLocation;
    }

    public void setJuridicalPerson(String juridicalPerson) {
        this.juridicalPerson = juridicalPerson;
    }

    public String getJuridicalPerson() {
        return juridicalPerson;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setJuridicalPhone(String juridicalPhone) {
        this.juridicalPhone = juridicalPhone;
    }

    public String getJuridicalPhone() {
        return juridicalPhone;
    }


}
