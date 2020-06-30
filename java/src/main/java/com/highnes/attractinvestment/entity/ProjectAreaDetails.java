package com.highnes.attractinvestment.entity;


/**
 * 空间需求对象 project_area_details
 * 
 * @author fluy
 * @date 2020-05-15
 */
public class ProjectAreaDetails extends BaseEntity<ProjectAreaDetails> {

    /**
     * 所属项目
     */
    private String projectId;

    /**
     * 空间类型
     */
    private String areaType;

    /**
     * 空间数量
     */
    private String areaCount;

    /**
     * 占地多少
     */
    private String contain;


    public ProjectAreaDetails(){
        super();
    }

    public ProjectAreaDetails(String id){
        super(id);
    }

    public String getContain() {
        return contain;
    }

    public void setContain(String contain) {
        this.contain = contain;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setAreaType(String areaType) {
        this.areaType = areaType;
    }

    public String getAreaType() {
        return areaType;
    }

    public void setAreaCount(String areaCount) {
        this.areaCount = areaCount;
    }

    public String getAreaCount() {
        return areaCount;
    }


}
