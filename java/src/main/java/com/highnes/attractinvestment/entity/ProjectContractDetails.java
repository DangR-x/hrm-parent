package com.highnes.attractinvestment.entity;


/**
 * 项目合同文件对象 project_contract_details
 * 
 * @author fuly
 * @date 2020-05-25
 */
public class ProjectContractDetails extends BaseEntity<ProjectContractDetails> {

    /**
     * 合同编码
     */
    private String contractId;
    /**
     * 项目编码
     */
    private String projectId;

    /**
     * 文件名称
     */
    private String fileName;

    /**
     * 文件路径
     */
    private String filePath;
    /**
     * 合同条款
     */
    private String contractItems;


    public ProjectContractDetails(){
        super();
    }

    public ProjectContractDetails(String id){
        super(id);
    }

    public void setContractId(String contractId) {
        this.contractId = contractId;
    }

    public String getContractId() {
        return contractId;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFilePath() {
        return filePath;
    }


    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getContractItems() {
        return contractItems;
    }

    public void setContractItems(String contractItems) {
        this.contractItems = contractItems;
    }
}
