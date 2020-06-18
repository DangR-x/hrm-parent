package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * @author Rain
 * @date 2020/5/25
 * @description
 */
@ApiModel(description = "流程审批")
public class ProcessRequest {
    @ApiModelProperty(name = "processId", example = "流程编码", position = 0)
    private String processId;
    @ApiModelProperty(name = "type", example = "流程类型：1-部门审批，2-成员审批", position = 1)
    private String type;

    @ApiModelProperty(name = "status", example = "状态：1-暂停，2-重启，3-终止", position = 2)
    private String status;

    @ApiModelProperty(name = "deptId", example = "部门编码", position = 3)
    private String deptId;
    @ApiModelProperty(name = "processDetailsRequestList", value = "成员审批", position = 4)
    private List<ProcessDetailsRequest> processDetailsRequestList;

    /**
     * 流程类型：1-部门审批，2-成员审批
     */
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
     * 部门编码
     */
    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public List<ProcessDetailsRequest> getProcessDetailsRequestList() {
        return processDetailsRequestList;
    }

    public void setProcessDetailsRequestList(List<ProcessDetailsRequest> processDetailsRequestList) {
        this.processDetailsRequestList = processDetailsRequestList;
    }

    public String getProcessId() {
        return processId;
    }

    public void setProcessId(String processId) {
        this.processId = processId;
    }
}
