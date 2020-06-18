package com.highnes.attractinvestment.entity;


/**
 * 主要参与单位对象 project_company_details
 * 
 * @author fluy
 * @date 2020-05-15
 */
public class ProjectCompanyDetails extends BaseEntity<ProjectCompanyDetails> {

    /**
     * 所属单位
     */
    private String projectId;

    /**
     * 参与单位
     */
    private String company;


    public ProjectCompanyDetails(){
        super();
    }

    public ProjectCompanyDetails(String id){
        super(id);
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getCompany() {
        return company;
    }


}
