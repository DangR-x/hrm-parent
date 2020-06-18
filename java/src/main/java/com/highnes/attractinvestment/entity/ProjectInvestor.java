package com.highnes.attractinvestment.entity;

import io.swagger.annotations.ApiModelProperty;

/**
 * @author Rain
 * @date 2020/6/17
 * @description
 */
public class ProjectInvestor {

    private Long id;
    /**
     * 透支人姓名
     */
    @ApiModelProperty(name = "investorname", example = "投资人姓名", position = 1)
    private String investorname;
    /**
     * 证件类型
     */
    @ApiModelProperty(name = "documenttype", example = "证件类型 1 - 身份证 ，2 - 驾驶证 3 - 护照", position = 2)
    private Integer documenttype;
    /**
     * 证件号码
     */
    @ApiModelProperty(name = "documentnumber", example = "证件号码", position = 3)
    private String documentnumber;
    /**
     * 电话号码
     */
    @ApiModelProperty(name = "telephone", example = "电话号码", position = 4)
    private String telephone;
    /**
     * 投资人注册地
     */
    @ApiModelProperty(name = "investoraddress", example = "投资人注册地", position = 5)
    private String investoraddress;

    private String projectId;

    public ProjectInvestor() {
    }

    public ProjectInvestor(Long id, String investorname, Integer documenttype, String documentnumber, String telephone, String investoraddress, String projectId) {
        this.id = id;
        this.investorname = investorname;
        this.documenttype = documenttype;
        this.documentnumber = documentnumber;
        this.telephone = telephone;
        this.investoraddress = investoraddress;
        this.projectId = projectId;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getInvestorname() {
        return investorname;
    }

    public void setInvestorname(String investorname) {
        this.investorname = investorname;
    }

    public Integer getDocumenttype() {
        return documenttype;
    }

    public void setDocumenttype(Integer documenttype) {
        this.documenttype = documenttype;
    }

    public String getDocumentnumber() {
        return documentnumber;
    }

    public void setDocumentnumber(String documentnumber) {
        this.documentnumber = documentnumber;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getInvestoraddress() {
        return investoraddress;
    }

    public void setInvestoraddress(String investoraddress) {
        this.investoraddress = investoraddress;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    @Override
    public String toString() {
        return "ProjectInvestor{" +
                "id=" + id +
                ", investorname='" + investorname + '\'' +
                ", documenttype=" + documenttype +
                ", documentnumber='" + documentnumber + '\'' +
                ", telephone='" + telephone + '\'' +
                ", investoraddress='" + investoraddress + '\'' +
                ", projectId='" + projectId + '\'' +
                '}';
    }
}
