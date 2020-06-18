package com.highnes.attractinvestment.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import org.aspectj.apache.bcel.classfile.Code;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 项目信息对象 project_info
 * 
 * @author fluy:
 * @date 2020-05-15
 */
public class ProjectInfo extends BaseEntity<ProjectInfo> {

    /**
     * 项目名称
     */
    @Excel(name = "title")
    private String title;
    /**
     * 项目编号
     */
    @Excel(name = "code")
    private String code;
    /**
     * 状态：1-在谈，2-拟签约，3-已签约
     */
    @Excel(name = "staus")
    private String status;
    /**
     * 是否督办项目：1-是，0-否
     */
    @Excel(name = "urge_flag")
    private String urgeFlag;
    /**
     * 督办类型：1-普通督办，2-重点督办
     */
    @Excel(name = "urge_type")
    private String urgeType;
    /**
     * 督办领导
     */
    @Excel(name = "urge_leader")
    private String urgeLeader;
    /**
     * 阶段状态：0-正常，1-暂停，2-重启，3-终止
     */
    @Excel(name = "step_status")
    private String stepStatus;
    /**
     * 阶段描述
     */
    private String stepRemark;

    /**
     * 所属行业
     */
    @Excel(name = "classify_type")
    private String classifyType;
    @Excel(name = "classify_type_two")
    private String classifyTypeTwo;

    /**
     * 所属产业
     */
    @Excel(name = "industry")
    private String industry;

    /**
     * 信息来源
     */
    @Excel(name = "source_type")
    private String sourceType;
    @Excel(name = "source_type_two")
    private String sourceTypeTwo;

    /**
     * 项目类型
     */
    @Excel(name = "item_type")
    private String itemType;

    /**
     * 项目简介
     */
    @Excel(name = "description")
    private String description;

    /**
     * 预计投资总额
     */
    //@Excel(name = "total_cast")
    private Double totalCast;

    /**
     * 预计年产值
     */
    //@Excel(name = "output_value")
    private Double outputValue;

    /**
     * 预计税收
     */
    //@Excel(name = "estimated_tax")
    private Double estimatedTax;

    /**
     * 预计用工数
     */
    //@Excel(name = "total_people")
    private Integer totalPeople;

    /**
     * 交办时间
     */
    //@Excel(name = "deal_time")
    private Date dealTime;

    /**
     * 计划开工时间
     */
    //@Excel(name = "open_time")
    private Date openTime;

    /**
     * 计划投产时间
     */
    //@Excel(name = "production_time")
    private Date productionTime;

    /**
     * 所属小组
     */
    @Excel(name = "group_id")
    private String groupId;
    /**
     * 空间需求
     */

    private List<ProjectAreaDetails> projectAreaDetailsList;
    /**
     * 主要参与单位
     */
    private List<ProjectCompanyDetails> projectCompanyDetailsList;
    /**
     * 项目计划书
     */
    private List<ProjectProspectusDetails> projectProspectusDetailsList;
    /**
     * 企业信息
     */
    private List<ProjectCompanyInfo> projectCompanyInfoList;

    /**
     * 投资人信息
     */
    private List<ProjectInvestor> projectInvestors;


    /**
     * 人才信息
     */
    private List<ProjectPersonnelInfo>projectPersonnelInfoList;
    /**
     * 项目画像
     */
    private List<ProjectImages> projectImagesList;
    private Map<String, Object> paras;
    /**
     * 是否投促管理：0-否，1-是
     */
    private String transferFlag;


    public ProjectInfo(){
        super();
    }

    public ProjectInfo(String id){
        super(id);
    }

    public List<ProjectInvestor> getProjectInvestors() {
        return projectInvestors;
    }

    public void setProjectInvestors(List<ProjectInvestor> projectInvestors) {
        this.projectInvestors = projectInvestors;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setClassifyType(String classifyType) {
        this.classifyType = classifyType;
    }

    public String getClassifyType() {
        return classifyType;
    }

    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }

    public String getSourceType() {
        return sourceType;
    }

    public void setItemType(String itemType) {
        this.itemType = itemType;
    }

    public String getItemType() {
        return itemType;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setTotalCast(Double totalCast) {
        this.totalCast = totalCast;
    }

    public Double getTotalCast() {
        return totalCast;
    }

    public void setOutputValue(Double outputValue) {
        this.outputValue = outputValue;
    }

    public Double getOutputValue() {
        return outputValue;
    }

    public void setEstimatedTax(Double estimatedTax) {
        this.estimatedTax = estimatedTax;
    }

    public Double getEstimatedTax() {
        return estimatedTax;
    }

    public void setTotalPeople(Integer totalPeople) {
        this.totalPeople = totalPeople;
    }

    public Integer getTotalPeople() {
        return totalPeople;
    }

    public void setDealTime(Date dealTime) {
        this.dealTime = dealTime;
    }

    public Date getDealTime() {
        return dealTime;
    }

    public void setOpenTime(Date openTime) {
        this.openTime = openTime;
    }

    public Date getOpenTime() {
        return openTime;
    }

    public void setProductionTime(Date productionTime) {
        this.productionTime = productionTime;
    }

    public Date getProductionTime() {
        return productionTime;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public String getGroupId() {
        return groupId;
    }


    public List<ProjectAreaDetails> getProjectAreaDetailsList() {
        return projectAreaDetailsList;
    }

    public void setProjectAreaDetailsList(List<ProjectAreaDetails> projectAreaDetailsList) {
        this.projectAreaDetailsList = projectAreaDetailsList;
    }

    public List<ProjectCompanyDetails> getProjectCompanyDetailsList() {
        return projectCompanyDetailsList;
    }

    public void setProjectCompanyDetailsList(List<ProjectCompanyDetails> projectCompanyDetailsList) {
        this.projectCompanyDetailsList = projectCompanyDetailsList;
    }

    public List<ProjectProspectusDetails> getProjectProspectusDetailsList() {
        return projectProspectusDetailsList;
    }

    public void setProjectProspectusDetailsList(List<ProjectProspectusDetails> projectProspectusDetailsList) {
        this.projectProspectusDetailsList = projectProspectusDetailsList;
    }

    public String getClassifyTypeTwo() {
        return classifyTypeTwo;
    }

    public void setClassifyTypeTwo(String classifyTypeTwo) {
        this.classifyTypeTwo = classifyTypeTwo;
    }

    public String getSourceTypeTwo() {
        return sourceTypeTwo;
    }

    public void setSourceTypeTwo(String sourceTypeTwo) {
        this.sourceTypeTwo = sourceTypeTwo;
    }

    public List<ProjectCompanyInfo> getProjectCompanyInfoList() {
        return projectCompanyInfoList;
    }

    public void setProjectCompanyInfoList(List<ProjectCompanyInfo> projectCompanyInfoList) {
        this.projectCompanyInfoList = projectCompanyInfoList;
    }

    public List<ProjectPersonnelInfo> getProjectPersonnelInfoList() {
        return projectPersonnelInfoList;
    }

    public void setProjectPersonnelInfoList(List<ProjectPersonnelInfo> projectPersonnelInfoList) {
        this.projectPersonnelInfoList = projectPersonnelInfoList;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<ProjectImages> getProjectImagesList() {
        return projectImagesList;
    }

    public void setProjectImagesList(List<ProjectImages> projectImagesList) {
        this.projectImagesList = projectImagesList;
    }

    public String getUrgeFlag() {
        return urgeFlag;
    }

    public void setUrgeFlag(String urgeFlag) {
        this.urgeFlag = urgeFlag;
    }

    public String getUrgeType() {
        return urgeType;
    }

    public void setUrgeType(String urgeType) {
        this.urgeType = urgeType;
    }

    public String getStepStatus() {
        return stepStatus;
    }

    public void setStepStatus(String stepStatus) {
        this.stepStatus = stepStatus;
    }

    public String getStepRemark() {
        return stepRemark;
    }

    public void setStepRemark(String stepRemark) {
        this.stepRemark = stepRemark;
    }

    public String getUrgeLeader() {
        return urgeLeader;
    }

    public void setUrgeLeader(String urgeLeader) {
        this.urgeLeader = urgeLeader;
    }

    public Map<String, Object> getParas() {
        return paras;
    }

    public void setParas(Map<String, Object> paras) {
        this.paras = paras;
    }

    public String getTransferFlag() {
        return transferFlag;
    }

    public void setTransferFlag(String transferFlag) {
        this.transferFlag = transferFlag;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }
}
