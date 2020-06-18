package com.highnes.attractinvestment.controller.params;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author Rain
 * @date 2020/5/19
 * @description
 */
@ApiModel(description = "项目画像")
public class ImagesRequest {
    @ApiModelProperty(name = "status", example = "类型", position = 1)
    private String status;

    @ApiModelProperty(name = "uploadFlag", example = "是否录入固定资产投资库", position = 2)
    private String uploadFlag;

    @ApiModelProperty(name = "uploadCode", example = "固投库项目代码", position = 3)
    private String uploadCode;

    @ApiModelProperty(name = "signingFlag", example = "是否参与集中签约", position = 4)
    private String signingFlag;

    @ApiModelProperty(name = "signingDate", example = "集中签约时间", position = 5)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date signingDate;

    @ApiModelProperty(name = "openFlag", example = "是否参加集中开工0-否，1-是", position = 6)
    private String openFlag;

    @ApiModelProperty(name = "openDate", example = "集中开工时间，yyyy-MM-dd HH:mm:ss", position = 7)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date openDate;

    /**
     * 类型
     */
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 是否录入固定资产投资库
     */
    public String getUploadFlag() {
        return uploadFlag;
    }

    public void setUploadFlag(String uploadFlag) {
        this.uploadFlag = uploadFlag;
    }

    /**
     * 固投库项目代码
     */
    public String getUploadCode() {
        return uploadCode;
    }

    public void setUploadCode(String uploadCode) {
        this.uploadCode = uploadCode;
    }

    /**
     * 是否参与集中签约
     */
    public String getSigningFlag() {
        return signingFlag;
    }

    public void setSigningFlag(String signingFlag) {
        this.signingFlag = signingFlag;
    }

    /**
     * 集中签约时间
     */
    public Date getSigningDate() {
        return signingDate;
    }

    public void setSigningDate(Date signingDate) {
        this.signingDate = signingDate;
    }

    /**
     * 是否参加集中开工：0-否，1-是
     */
    public String getOpenFlag() {
        return openFlag;
    }

    public void setOpenFlag(String openFlag) {
        this.openFlag = openFlag;
    }

    /**
     * 集中开工时间
     */
    public Date getOpenDate() {
        return openDate;
    }

    public void setOpenDate(Date openDate) {
        this.openDate = openDate;
    }
}
