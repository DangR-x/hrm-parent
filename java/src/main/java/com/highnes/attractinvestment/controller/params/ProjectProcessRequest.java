package com.highnes.attractinvestment.controller.params;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author Rain
 * @date 2020/5/25
 * @description
 */
@ApiModel(description = "项目审批")
public class ProjectProcessRequest {
    @ApiModelProperty(name = "projectId", example = "项目编码", position = 1)
    private String projectId;

    @ApiModelProperty(name = "status", example = "状态：1-暂停，2-重启，3-终止", position = 2)
    private String status;

    @ApiModelProperty(name = "reason", example = "原因", position = 3)
    private String reason;

    @ApiModelProperty(name = "rebootDate", example = "预计重启时间，yyyy-MM-dd HH:mm:ss", position = 4)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date rebootDate;
    @ApiModelProperty(name = "step", example = "审批阶段：1-审批通过，2-审批拒绝", position = 5)
    private String step;

    /**
     * 项目编码
     */
    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    /**
     * 状态：1-暂停，2-重启，3-终止
     */
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 原因
     */
    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    /**
     * 预计重启时间
     */
    public Date getRebootDate() {
        return rebootDate;
    }

    public void setRebootDate(Date rebootDate) {
        this.rebootDate = rebootDate;
    }

    public String getStep() {
        return step;
    }

    public void setStep(String step) {
        this.step = step;
    }
}
