package com.highnes.attractinvestment.entity;

import java.util.Date;
import java.util.List;

/**
 * 项目审批流程对象 project_process
 * 
 * @author fuly
 * @date 2020-05-25
 */
public class ProjectProcess extends BaseEntity<ProjectProcess> {

    /**
     * 项目编码
     */
    private String projectId;

    /**
     * 项目阶段：0-待审批，1-审批通过，2-审批拒绝
     */
    private String step;

    /**
     * 审批类型：1-部门审批，2-成员审批
     */
    private String type;

    /**
     * 状态：1-暂停，2-重启，3-终止
     */
    private String status;

    /**
     * 原因
     */
    private String reason;

    /**
     * 预计重启时间
     */
    private Date rebootDate;

    /**
     * 部门编码
     */
    private String deptId;
    /**
     * 成员审批
     */
    private List<ProjectProcessDetails> projectProcessDetailsList;


    public ProjectProcess(){
        super();
    }

    public ProjectProcess(String id){
        super(id);
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setStep(String step) {
        this.step = step;
    }

    public String getStep() {
        return step;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getReason() {
        return reason;
    }

    public void setRebootDate(Date rebootDate) {
        this.rebootDate = rebootDate;
    }

    public Date getRebootDate() {
        return rebootDate;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getDeptId() {
        return deptId;
    }


    public List<ProjectProcessDetails> getProjectProcessDetailsList() {
        return projectProcessDetailsList;
    }

    public void setProjectProcessDetailsList(List<ProjectProcessDetails> projectProcessDetailsList) {
        this.projectProcessDetailsList = projectProcessDetailsList;
    }
}
