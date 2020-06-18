package com.highnes.attractinvestment.entity;

import java.util.Date;

/**
 * 项目审批详情对象 project_process_details
 * 
 * @author fuly
 * @date 2020-05-25
 */
public class ProjectProcessDetails extends BaseEntity<ProjectProcessDetails> {

    /**
     * 审批编码
     */
    private String processId;

    /**
     * 编码
     */
    private String userId;

    /**
     * 姓名
     */
    private String userName;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 项目阶段：-1-未到审批，0-待审批，1-审批通过，2-审批拒绝
     */
    private String step;
    /**
     * 备注
     */
    private String reason;


    public ProjectProcessDetails(){
        super();
    }

    public ProjectProcessDetails(String id){
        super(id);
    }

    public void setProcessId(String processId) {
        this.processId = processId;
    }

    public String getProcessId() {
        return processId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getSort() {
        return sort;
    }

    public void setStep(String step) {
        this.step = step;
    }

    public String getStep() {
        return step;
    }


    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}
