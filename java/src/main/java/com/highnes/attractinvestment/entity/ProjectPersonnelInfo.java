package com.highnes.attractinvestment.entity;


import java.util.List;

/**
 * 项目-人才信息对象 project_personnel_info
 * 
 * @author fluy
 * @date 2020-05-19
 */
public class ProjectPersonnelInfo extends BaseEntity<ProjectPersonnelInfo> {

    /**
     * 项目编码
     */
    private String projectId;

    /**
     * 姓名
     */
    private String name;

    /**
     * 职务
     */
    private String post;

    /**
     * 职称
     */
    private String title;

    /**
     * 高级荣誉
     */
    private String highHonor;
    private List<ProjectPersonnelResume> projectPersonnelResumeList;


    public ProjectPersonnelInfo(){
        super();
    }

    public ProjectPersonnelInfo(String id){
        super(id);
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getPost() {
        return post;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setHighHonor(String highHonor) {
        this.highHonor = highHonor;
    }

    public String getHighHonor() {
        return highHonor;
    }


    /**
     * 简历
     */
    public List<ProjectPersonnelResume> getProjectPersonnelResumeList() {
        return projectPersonnelResumeList;
    }

    public void setProjectPersonnelResumeList(List<ProjectPersonnelResume> projectPersonnelResumeList) {
        this.projectPersonnelResumeList = projectPersonnelResumeList;
    }
}
