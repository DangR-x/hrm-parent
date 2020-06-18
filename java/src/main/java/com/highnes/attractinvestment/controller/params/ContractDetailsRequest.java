package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author Rain
 * @date 2020/5/25
 * @description
 */
@ApiModel(description = "项目合同详情")
public class ContractDetailsRequest {
    @ApiModelProperty(name = "fileName", example = "文件名称", position = 1)
    private String fileName;
    @ApiModelProperty(name = "filePath", example = "文件路径", position = 2)
    private String filePath;
    @ApiModelProperty(name = "contractItems", example = "合同条款", position = 3)
    private String contractItems;

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

    /**
     * 合同条款
     */
    public String getContractItems() {
        return contractItems;
    }

    public void setContractItems(String contractItems) {
        this.contractItems = contractItems;
    }
}
