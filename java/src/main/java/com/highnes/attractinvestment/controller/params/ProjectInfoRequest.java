package com.highnes.attractinvestment.controller.params;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.highnes.attractinvestment.entity.ProjectImages;
import com.highnes.attractinvestment.entity.ProjectInvestor;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @author Rain
 * @date 2020/5/15
 * @description
 */
@ApiModel(description = "项目信息")
public class ProjectInfoRequest {
    @ApiModelProperty(name = "projectId", example = "项目编码", position = 1)
    private String projectId;
    @ApiModelProperty(name = "title", example = "项目名称", position = 2, required = true)
    private String title;
    @ApiModelProperty(name = "code", example = "项目编号", position = 3)
    private String code;
    @ApiModelProperty(name = "status", example = "状态：1-在谈，2-拟签约，3-已签约", position = 4)
    private String status;
    @ApiModelProperty(name = "urgeFlag", example = "是否督办项目：0-否，1-是", position = 5)
    private String urgeFlag;
    @ApiModelProperty(name = "urgeType", example = "督办类型：1-普通督办，2-重点督办", position = 6)
    private String urgeType;
    @ApiModelProperty(name = "urgeLeader", example = "督办领导", position = 7)
    private String urgeLeader;
    @ApiModelProperty(name = "stepStatus", example = "阶段状态：0-正常，1-暂停，2-重启，3-终止", position = 8)
    private String stepStatus;
    @ApiModelProperty(name = "stepRemark", example = "阶段描述", position = 9)
    private String stepRemark;
    @ApiModelProperty(name = "classifyType", example = "所属行业-门类", position = 10)
    private String classifyType;
    @ApiModelProperty(name = "classifyTypeTwo", example = "所属行业-大类", position = 11)
    private String classifyTypeTwo;
    @ApiModelProperty(name = "industry" , example = "所属产业", position = 31)
    private String industry;
    @ApiModelProperty(name = "sourceType", example = "信息来源", position = 12)
    private String sourceType;
    @ApiModelProperty(name = "sourceTypeTwo", example = "信息来源", position = 13)
    private String sourceTypeTwo;
    @ApiModelProperty(name = "itemType", example = "项目类型", position = 14)
    private String itemType;
    @ApiModelProperty(name = "description", example = "项目简介", position = 15)
    private String description;
    @ApiModelProperty(name = "totalCast", example = "预计投资总额，万元", position = 16)
    private Double totalCast;
    @ApiModelProperty(name = "outputValue", example = "预计年产值，万元", position = 17)
    private Double outputValue;
    @ApiModelProperty(name = "estimatedTax", example = "预计税收，万元", position = 18)
    private Double estimatedTax;
    @ApiModelProperty(name = "totalPeople", example = "预计用工数", position = 19)
    private Integer totalPeople;
    @ApiModelProperty(name = "dealTime", example = "交办时间", position = 20)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date dealTime;
    @ApiModelProperty(name = "openTime", example = "计划开工时间", position = 21)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date openTime;
    @ApiModelProperty(name = "productionTime", example = "计划投产时间", position = 22)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date productionTime;
    @ApiModelProperty(name = "groupId", example = "所属小组", position = 23)
    private String groupId;
    @ApiModelProperty(name = "projectAreaRequestList", value = "空间需求", position = 24)
    private List<ProjectAreaRequest> projectAreaRequestList;
    @ApiModelProperty(name = "projectCompanyRequestList", value = "主要参与单位", position = 25)
    private List<ProjectCompanyRequest> projectCompanyRequestList;
    @ApiModelProperty(name = "projectProspectusRequestList", value = "计划书", position = 26)
    private List<ProjectProspectusRequest> projectProspectusRequestList;
    @ApiModelProperty(name = "companyInfoRequestList", value = "企业信息", position = 27)
    private List<CompanyInfoRequest> companyInfoRequestList;
    @ApiModelProperty(name = "personnelInfoRequestList", value = "人才信息", position = 28)
    private List<PersonnelInfoRequest> personnelInfoRequestList;
    @ApiModelProperty(name = "imagesRequestList", value = "项目画像", position = 29)
    private List<ImagesRequest> imagesRequestList;
    @ApiModelProperty(name = "projectInvestor", value = "投资人", position = 30)
    private List<ProjectInvestor> projectInvestors;

    public List<ProjectInvestor> getProjectInvestors() {
        return projectInvestors;
    }

    public void setProjectInvestors(List<ProjectInvestor> projectInvestors) {
        this.projectInvestors = projectInvestors;
    }

    /**
     * 所属产业
     * @return
     */
    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    /**
     * 项目名称
     */
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 所属行业
     */
    public String getClassifyType() {
        return classifyType;
    }

    public void setClassifyType(String classifyType) {
        this.classifyType = classifyType;
    }

    /**
     * 信息来源
     */
    public String getSourceType() {
        return sourceType;
    }

    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }

    /**
     * 项目类型
     */
    public String getItemType() {
        return itemType;
    }

    public void setItemType(String itemType) {
        this.itemType = itemType;
    }

    /**
     * 项目简介
     */
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * 预计投资总额
     */
    public Double getTotalCast() {
        return totalCast;
    }

    public void setTotalCast(Double totalCast) {
        this.totalCast = totalCast;
    }

    /**
     * 预计年产值
     */
    public Double getOutputValue() {
        return outputValue;
    }

    public void setOutputValue(Double outputValue) {
        this.outputValue = outputValue;
    }

    /**
     * 预计税收
     */
    public Double getEstimatedTax() {
        return estimatedTax;
    }

    public void setEstimatedTax(Double estimatedTax) {
        this.estimatedTax = estimatedTax;
    }

    /**
     * 预计用工数
     */
    public Integer getTotalPeople() {
        return totalPeople;
    }

    public void setTotalPeople(Integer totalPeople) {
        this.totalPeople = totalPeople;
    }

    /**
     * 交办时间
     */
    public Date getDealTime() {
        return dealTime;
    }

    public void setDealTime(Date dealTime) {
        this.dealTime = dealTime;
    }

    /**
     * 计划开工时间
     */
    public Date getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Date openTime) {
        this.openTime = openTime;
    }

    /**
     * 计划投产时间
     */
    public Date getProductionTime() {
        return productionTime;
    }

    public void setProductionTime(Date productionTime) {
        this.productionTime = productionTime;
    }

    /**
     * 所属小组
     */
    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public List<ProjectAreaRequest> getProjectAreaRequestList() {
        return projectAreaRequestList;
    }

    public void setProjectAreaRequestList(List<ProjectAreaRequest> projectAreaRequestList) {
        this.projectAreaRequestList = projectAreaRequestList;
    }

    public List<ProjectCompanyRequest> getProjectCompanyRequestList() {
        return projectCompanyRequestList;
    }

    public void setProjectCompanyRequestList(List<ProjectCompanyRequest> projectCompanyRequestList) {
        this.projectCompanyRequestList = projectCompanyRequestList;
    }

    public List<ProjectProspectusRequest> getProjectProspectusRequestList() {
        return projectProspectusRequestList;
    }

    public void setProjectProspectusRequestList(List<ProjectProspectusRequest> projectProspectusRequestList) {
        this.projectProspectusRequestList = projectProspectusRequestList;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
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

    public List<CompanyInfoRequest> getCompanyInfoRequestList() {
        return companyInfoRequestList;
    }

    public void setCompanyInfoRequestList(List<CompanyInfoRequest> companyInfoRequestList) {
        this.companyInfoRequestList = companyInfoRequestList;
    }

    public List<PersonnelInfoRequest> getPersonnelInfoRequestList() {
        return personnelInfoRequestList;
    }

    public void setPersonnelInfoRequestList(List<PersonnelInfoRequest> personnelInfoRequestList) {
        this.personnelInfoRequestList = personnelInfoRequestList;
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

    public List<ImagesRequest> getImagesRequestList() {
        return imagesRequestList;
    }

    public void setImagesRequestList(List<ImagesRequest> imagesRequestList) {
        this.imagesRequestList = imagesRequestList;
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

    /**
     * 督办领导
     */
    public String getUrgeLeader() {
        return urgeLeader;
    }

    public void setUrgeLeader(String urgeLeader) {
        this.urgeLeader = urgeLeader;
    }

    /**
     * 阶段状态：1-暂停，2-重启，3-终止
     */
    public String getStepStatus() {
        return stepStatus;
    }

    public void setStepStatus(String stepStatus) {
        this.stepStatus = stepStatus;
    }

    /**
     * 阶段描述
     */
    public String getStepRemark() {
        return stepRemark;
    }

    public void setStepRemark(String stepRemark) {
        this.stepRemark = stepRemark;
    }
}
