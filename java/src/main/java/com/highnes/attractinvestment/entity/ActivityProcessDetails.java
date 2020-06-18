package com.highnes.attractinvestment.entity;


/**
 * 流程审批-成员审批对象 activity_process_details
 * 
 * @author fuly
 * @date 2020-05-25
 */
public class ActivityProcessDetails extends BaseEntity<ActivityProcessDetails> {

    /**
     * 流程编码
     */
    private String processId;

    /**
     * 用户编码
     */
    private String userId;

    /**
     * 用户姓名
     */
    private String userName;

    /**
     * 排序
     */
    private Integer sort;


    public ActivityProcessDetails(){
        super();
    }

    public ActivityProcessDetails(String id){
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


}
