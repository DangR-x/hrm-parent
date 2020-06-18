package com.highnes.attractinvestment.entity;


/**
 * 项目-接待-陪同人员对象 project_reception_details
 * 
 * @author fuly
 * @date 2020-05-21
 */
public class ProjectReceptionDetails extends BaseEntity<ProjectReceptionDetails> {

    /**
     * 接待编码
     */
    private String receptionId;

    /**
     * 部门
     */
    private String dept;

    /**
     * 姓名
     */
    private String name;


    public ProjectReceptionDetails(){
        super();
    }

    public ProjectReceptionDetails(String id){
        super(id);
    }

    public void setReceptionId(String receptionId) {
        this.receptionId = receptionId;
    }

    public String getReceptionId() {
        return receptionId;
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
