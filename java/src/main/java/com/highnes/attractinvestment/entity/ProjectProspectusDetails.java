package com.highnes.attractinvestment.entity;


/**
 * 项目计划书对象 project_prospectus_details
 * 
 * @author fluy
 * @date 2020-05-15
 */
public class ProjectProspectusDetails extends BaseEntity<ProjectProspectusDetails> {

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


    public ProjectProspectusDetails(){
        super();
    }

    public ProjectProspectusDetails(String id){
        super(id);
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
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


}
