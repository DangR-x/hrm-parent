package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * @author Rain
 * @date 2020/5/19
 * @description
 */
@ApiModel(description = "项目-人才信息")
public class PersonnelInfoRequest {
    @ApiModelProperty(name = "name", example = "姓名", position = 1)
    private String name;

    @ApiModelProperty(name = "post", example = "职务", position = 2)
    private String post;

    @ApiModelProperty(name = "title", example = "职称", position = 3)
    private String title;

    @ApiModelProperty(name = "highHonor", example = "高级荣誉", position = 4)
    private String highHonor;
    @ApiModelProperty(name = "remarks", example = "备注", position = 5)
    private String remarks;
    @ApiModelProperty(name = "personnelResumeRequestList", value = "简历", position = 6)
    private List<PersonnelResumeRequest> personnelResumeRequestList;
    /**
     * 姓名
     */
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * 职务
     */
    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    /**
     * 职称
     */
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 高级荣誉
     */
    public String getHighHonor() {
        return highHonor;
    }

    public void setHighHonor(String highHonor) {
        this.highHonor = highHonor;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public List<PersonnelResumeRequest> getPersonnelResumeRequestList() {
        return personnelResumeRequestList;
    }

    public void setPersonnelResumeRequestList(List<PersonnelResumeRequest> personnelResumeRequestList) {
        this.personnelResumeRequestList = personnelResumeRequestList;
    }
}
