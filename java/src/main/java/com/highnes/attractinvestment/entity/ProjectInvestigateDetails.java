package com.highnes.attractinvestment.entity;


/**
 * 考察陪同人员对象 project_investigate_details
 * 
 * @author fuly
 * @date 2020-05-20
 */
public class ProjectInvestigateDetails extends BaseEntity<ProjectInvestigateDetails> {

    /**
     * 考察编码
     */
    private String investigateId;

    /**
     * 所属部门
     */
    private String dept;

    /**
     * 姓名
     */
    private String name;


    public ProjectInvestigateDetails(){
        super();
    }

    public ProjectInvestigateDetails(String id){
        super(id);
    }

    public void setInvestigateId(String investigateId) {
        this.investigateId = investigateId;
    }

    public String getInvestigateId() {
        return investigateId;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getDept() {
        return dept;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }


}
