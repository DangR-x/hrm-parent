package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author Rain
 * @date 2020/5/26
 * @description
 */
@ApiModel(description = "考察方案")
public class InvestigateFileRequest {
    @ApiModelProperty(name = "fileName", example = "文件名称", position = 1)
    private String fileName;

    @ApiModelProperty(name = "filePath", example = "文件路径", position = 2)
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
