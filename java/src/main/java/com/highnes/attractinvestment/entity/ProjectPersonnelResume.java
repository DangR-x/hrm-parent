package com.highnes.attractinvestment.entity;


/**
 * 项目-人才信息-简历对象 project_personnel_resume
 * 
 * @author fluy
 * @date 2020-05-19
 */
public class ProjectPersonnelResume extends BaseEntity<ProjectPersonnelResume> {

    /**
     * 人才编码
     */
    private String personnelId;

    /**
     * 文件名称
     */
    private String fileName;

    /**
     * 文件路径
     */
    private String filePath;


    public ProjectPersonnelResume(){
        super();
    }

    public ProjectPersonnelResume(String id){
        super(id);
    }

    public void setPersonnelId(String personnelId) {
        this.personnelId = personnelId;
    }

    public String getPersonnelId() {
        return personnelId;
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
