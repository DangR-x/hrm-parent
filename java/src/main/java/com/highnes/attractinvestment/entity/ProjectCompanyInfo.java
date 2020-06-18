package com.highnes.attractinvestment.entity;


/**
 * 项目-公司信息对象 project_company_info
 * 
 * @author fluy
 * @date 2020-05-19
 */
public class ProjectCompanyInfo extends BaseEntity<ProjectCompanyInfo> {

    /**
     * $column.columnComment
     */
    private String projectId;

    /**
     * 企业名称
     */
    private String companyName;

    /**
     * 社会统一信用代码
     */
    private String companyCode;

    /**
     * 所属行业-门类
     */
    private String classifyType;

    /**
     * 所属行业-大类
     */
    private String classifyTypeTwo;

    /**
     * 企业注册地
     */
    private String registerAddress;

    /**
     * 企业简介
     */
    private String companyDescription;

    /**
     * 上年度收入
     */
    private Double lastTotalIncome;

    /**
     * 上年度纳税
     */
    private Double lastPayTaxes;

    /**
     * 员工数量
     */
    private Integer totalPeople;

    /**
     * 企业来源
     */
    private String companySource;

    /**
     * 企业法人
     */
    private String companyLegalPerson;

    /**
     * 法人电话
     */
    private String companyMobile;

    /**
     * 工商执照
     */
    private String companyLicense;


    public ProjectCompanyInfo(){
        super();
    }

    public ProjectCompanyInfo(String id){
        super(id);
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyCode(String companyCode) {
        this.companyCode = companyCode;
    }

    public String getCompanyCode() {
        return companyCode;
    }

    public void setClassifyType(String classifyType) {
        this.classifyType = classifyType;
    }

    public String getClassifyType() {
        return classifyType;
    }

    public void setClassifyTypeTwo(String classifyTypeTwo) {
        this.classifyTypeTwo = classifyTypeTwo;
    }

    public String getClassifyTypeTwo() {
        return classifyTypeTwo;
    }

    public void setRegisterAddress(String registerAddress) {
        this.registerAddress = registerAddress;
    }

    public String getRegisterAddress() {
        return registerAddress;
    }

    public void setCompanyDescription(String companyDescription) {
        this.companyDescription = companyDescription;
    }

    public String getCompanyDescription() {
        return companyDescription;
    }

    public void setLastTotalIncome(Double lastTotalIncome) {
        this.lastTotalIncome = lastTotalIncome;
    }

    public Double getLastTotalIncome() {
        return lastTotalIncome;
    }

    public void setLastPayTaxes(Double lastPayTaxes) {
        this.lastPayTaxes = lastPayTaxes;
    }

    public Double getLastPayTaxes() {
        return lastPayTaxes;
    }

    public void setTotalPeople(Integer totalPeople) {
        this.totalPeople = totalPeople;
    }

    public Integer getTotalPeople() {
        return totalPeople;
    }

    public void setCompanySource(String companySource) {
        this.companySource = companySource;
    }

    public String getCompanySource() {
        return companySource;
    }

    public void setCompanyLegalPerson(String companyLegalPerson) {
        this.companyLegalPerson = companyLegalPerson;
    }

    public String getCompanyLegalPerson() {
        return companyLegalPerson;
    }

    public void setCompanyMobile(String companyMobile) {
        this.companyMobile = companyMobile;
    }

    public String getCompanyMobile() {
        return companyMobile;
    }

    public void setCompanyLicense(String companyLicense) {
        this.companyLicense = companyLicense;
    }

    public String getCompanyLicense() {
        return companyLicense;
    }


}
