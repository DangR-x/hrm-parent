package com.highnes.attractinvestment.entity;


/**
 * 项目-接待记录-到访人员对象 project_reception_visit
 * 
 * @author fuly
 * @date 2020-05-21
 */
public class ProjectReceptionVisit extends BaseEntity<ProjectReceptionVisit> {

    /**
     * 接待编码
     */
    private String receptionId;

    /**
     * 姓名
     */
    private String name;

    /**
     * 职务
     */
    private String title;


    public ProjectReceptionVisit(){
        super();
    }

    public ProjectReceptionVisit(String id){
        super(id);
    }

    public void setReceptionId(String receptionId) {
        this.receptionId = receptionId;
    }

    public String getReceptionId() {
        return receptionId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }


}
