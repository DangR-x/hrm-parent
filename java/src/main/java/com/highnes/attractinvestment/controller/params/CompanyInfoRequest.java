package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author Rain
 * @date 2020/5/19
 * @description
 */
@ApiModel(description = "项目-公司信息")
public class CompanyInfoRequest {
    @ApiModelProperty(name = "companyName", example = "企业名称", position = 1)
    private String companyName;

    @ApiModelProperty(name = "companyCode", example = "社会统一信用代码", position = 2)
    private String companyCode;

    @ApiModelProperty(name = "classifyType", example = "所属行业-门类", position = 3)
    private String classifyType;

    @ApiModelProperty(name = "classifyTypeTwo", example = "所属行业-大类", position = 4)
    private String classifyTypeTwo;

    @ApiModelProperty(name = "registerAddress", example = "企业注册地", position = 5)
    private String registerAddress;

    @ApiModelProperty(name = "companyDescription", example = "企业简介", position = 6)
    private String companyDescription;

    @ApiModelProperty(name = "lastTotalIncome", example = "上年度收入，万元", position = 7)
    private Double lastTotalIncome;

    @ApiModelProperty(name = "lastPayTaxes", example = "上年度纳税，万元", position = 8)
    private Double lastPayTaxes;

    @ApiModelProperty(name = "totalPeople", example = "员工数量", position = 9)
    private Integer totalPeople;

    @ApiModelProperty(name = "companySource", example = "企业来源", position = 10)
    private String companySource;

    @ApiModelProperty(name = "companyLegalPerson", example = "企业法人", position = 11)
    private String companyLegalPerson;

    @ApiModelProperty(name = "companyMobile", example = "法人电话", position = 12)
    private String companyMobile;

    @ApiModelProperty(name = "companyLicense", example = "工商执照", position = 13)
    private String companyLicense;

    /**
     * 企业名称
     */
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    /**
     * 社会统一信用代码
     */
    public String getCompanyCode() {
        return companyCode;
    }

    public void setCompanyCode(String companyCode) {
        this.companyCode = companyCode;
    }

    /**
     * 所属行业-门类
     */
    public String getClassifyType() {
        return classifyType;
    }

    public void setClassifyType(String classifyType) {
        this.classifyType = classifyType;
    }

    /**
     * 所属行业-大类
     */
    public String getClassifyTypeTwo() {
        return classifyTypeTwo;
    }

    public void setClassifyTypeTwo(String classifyTypeTwo) {
        this.classifyTypeTwo = classifyTypeTwo;
    }

    /**
     * 企业注册地
     */
    public String getRegisterAddress() {
        return registerAddress;
    }

    public void setRegisterAddress(String registerAddress) {
        this.registerAddress = registerAddress;
    }

    /**
     * 企业简介
     */
    public String getCompanyDescription() {
        return companyDescription;
    }

    public void setCompanyDescription(String companyDescription) {
        this.companyDescription = companyDescription;
    }

    /**
     * 上年度收入
     */
    public Double getLastTotalIncome() {
        return lastTotalIncome;
    }

    public void setLastTotalIncome(Double lastTotalIncome) {
        this.lastTotalIncome = lastTotalIncome;
    }

    /**
     * 上年度纳税
     */
    public Double getLastPayTaxes() {
        return lastPayTaxes;
    }

    public void setLastPayTaxes(Double lastPayTaxes) {
        this.lastPayTaxes = lastPayTaxes;
    }

    /**
     * 员工数量
     */
    public Integer getTotalPeople() {
        return totalPeople;
    }

    public void setTotalPeople(Integer totalPeople) {
        this.totalPeople = totalPeople;
    }

    /**
     * 企业来源
     */
    public String getCompanySource() {
        return companySource;
    }

    public void setCompanySource(String companySource) {
        this.companySource = companySource;
    }

    /**
     * 企业法人
     */
    public String getCompanyLegalPerson() {
        return companyLegalPerson;
    }

    public void setCompanyLegalPerson(String companyLegalPerson) {
        this.companyLegalPerson = companyLegalPerson;
    }

    /**
     * 法人电话
     */
    public String getCompanyMobile() {
        return companyMobile;
    }

    public void setCompanyMobile(String companyMobile) {
        this.companyMobile = companyMobile;
    }

    /**
     * 工商执照
     */
    public String getCompanyLicense() {
        return companyLicense;
    }

    public void setCompanyLicense(String companyLicense) {
        this.companyLicense = companyLicense;
    }
}
