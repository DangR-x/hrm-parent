package com.highnes.attractinvestment.entity;


/**
 * 项目-接待详情-接待方案对象 project_reception_file
 * 
 * @author fuly
 * @date 2020-05-21
 */
public class ProjectReceptionFile extends BaseEntity<ProjectReceptionFile> {

    /**
     * 接待编码
     */
    private String receptionId;

    /**
     * 文件名称
     */
    private String fileName;

    /**
     * 文件路径
     */
    private String filePath;


    public ProjectReceptionFile(){
        super();
    }

    public ProjectReceptionFile(String id){
        super(id);
    }

    public void setReceptionId(String receptionId) {
        this.receptionId = receptionId;
    }

    public String getReceptionId() {
        return receptionId;
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
