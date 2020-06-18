package com.highnes.attractinvestment.entity;


/**
 * 项目考察信息-考察方案对象 project_investigate_file
 * 
 * @author fuly
 * @date 2020-05-26
 */
public class ProjectInvestigateFile extends BaseEntity<ProjectInvestigateFile> {

    /**
     * 考察编码
     */
    private String investigateId;

    /**
     * 文件名称
     */
    private String fileName;

    /**
     * 文件路径
     */
    private String filePath;


    public ProjectInvestigateFile(){
        super();
    }

    public ProjectInvestigateFile(String id){
        super(id);
    }

    public void setInvestigateId(String investigateId) {
        this.investigateId = investigateId;
    }

    public String getInvestigateId() {
        return investigateId;
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
