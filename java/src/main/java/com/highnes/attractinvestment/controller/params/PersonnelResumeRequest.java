package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author Rain
 * @date 2020/5/19
 * @description
 */
@ApiModel(description = "项目-人才信息-简历")
public class PersonnelResumeRequest {
    @ApiModelProperty(name = "fileName", example = "文件名称")
    private String fileName;

    @ApiModelProperty(name = "filePath", example = "文件路径")
    private String filePath;

    /**
     * 文件名称
     */
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    /**
     * 文件路径
     */
    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
