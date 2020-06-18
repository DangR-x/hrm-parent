package com.highnes.attractinvestment.entity;

import java.util.Date;
import java.util.List;

/**
 * 流程设置对象 activity_process
 * 
 * @author fuly
 * @date 2020-05-25
 */
public class ActivityProcess extends BaseEntity<ActivityProcess> {

    /**
     * 流程类型：1-部门审批，2-成员审批
     */
    private String type;

    /**
     * 状态：1-暂停，2-重启，3-终止
     */
    private String status;

    /**
     * 部门编码
     */
    private String deptId;
    /**
     * 人员审批
     */
    private List<ActivityProcessDetails> activityProcessDetailsList;


    public ActivityProcess(){
        super();
    }

    public ActivityProcess(String id){
        super(id);
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

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getDeptId() {
        return deptId;
    }


    public List<ActivityProcessDetails> getActivityProcessDetailsList() {
        return activityProcessDetailsList;
    }

    public void setActivityProcessDetailsList(List<ActivityProcessDetails> activityProcessDetailsList) {
        this.activityProcessDetailsList = activityProcessDetailsList;
    }
}
