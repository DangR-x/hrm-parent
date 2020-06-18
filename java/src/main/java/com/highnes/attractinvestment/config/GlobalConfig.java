package com.highnes.attractinvestment.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author Rain
 * @date 2020/5/20
 * @description
 */
@Component
public class GlobalConfig {
    /**
     * 默认数据条数
     */
    public static String pageSize;
    /**
     * 文件上传地址
     */
    public static String uploadFilePath;
    public static final String SUCCESS = "0";
    public static final String FAIL = "1";
    public static final String YES = "1";
    public static final String NO = "0";
    /**
     * 督办类型：1-普通督办，2-重点督办
     */
    public static final String URGE_TYPE_1 = "1";
    public static final String URGE_TYPE_2 = "2";
    /**
     * 审批类型：1-部门审批，2-成员审批
     */
    public static final String ACTIVITY_TYPE_1 = "1";
    public static final String ACTIVITY_TYPE_2 = "2";

    /**
     * 项目阶段：0-待审批，1-审批通过，2-审批拒绝，-1-未到审批
     */
    public static final String PROCESS_STEP_B1 = "-1";
    public static final String PROCESS_STEP_0 = "0";
    public static final String PROCESS_STEP_1 = "1";
    public static final String PROCESS_STEP_2 = "2";

    /**
     * 状态：1-暂停，2-重启，3-终止
     */
    public static final String PROCESS_STATUS_1 = "1";
    public static final String PROCESS_STATUS_2 = "2";
    public static final String PROCESS_STATUS_3 = "3";


    public static String getPageSize() {
        return pageSize;
    }

    public static String getUploadFilePath() {
        return uploadFilePath;
    }

    @Value("${file.uploadPath}")
    public void setUploadFilePath(String uploadFilePath) {
        System.out.println(uploadFilePath);
        GlobalConfig.uploadFilePath = uploadFilePath;
    }

    @Value("${page-size}")
    public void setPageSize(String pageSize) {
        System.out.println(pageSize);
        GlobalConfig.pageSize = pageSize;
    }
}
