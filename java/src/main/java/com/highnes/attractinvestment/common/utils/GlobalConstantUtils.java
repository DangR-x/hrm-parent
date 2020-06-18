package com.highnes.attractinvestment.common.utils;

/**
 * @author Rain
 * @date 2020/3/18
 * @description
 */
public class GlobalConstantUtils {

    /**
     * 1. ================设计上传状态：1-已上传，2-发起审批，3-审批通过，4-审批拒绝，5-分配人员，6-最终确认，7-审批撤销
     * 21-审查通过，22-审批通过
     */
    public static final String DESIGN_UPLOAD_STATUS_1 = "1";
    public static final String DESIGN_UPLOAD_STATUS_2 = "2";
    public static final String DESIGN_UPLOAD_STATUS_21 = "21";
    public static final String DESIGN_UPLOAD_STATUS_22 = "22";
    public static final String DESIGN_UPLOAD_STATUS_3 = "3";
    public static final String DESIGN_UPLOAD_STATUS_4 = "4";
    public static final String DESIGN_UPLOAD_STATUS_5 = "5";
    public static final String DESIGN_UPLOAD_STATUS_6 = "6";
    public static final String DESIGN_UPLOAD_STATUS_7 = "7";

    /**
     * 2. ================审批状态：0-发起审批，1-审批通过，2-审批拒绝，3-审批撤销，-1-当前状态为不允许审核
     * 01-审查通过，02-审批通过
     */
    public static final String DESIGN_ACT_STATUS_b1 = "-1";
    public static final String DESIGN_ACT_STATUS_0 = "0";
    public static final String DESIGN_ACT_STATUS_01 = "01";
    public static final String DESIGN_ACT_STATUS_02 = "02";
    public static final String DESIGN_ACT_STATUS_1 = "1";
    public static final String DESIGN_ACT_STATUS_2 = "2";
    public static final String DESIGN_ACT_STATUS_3 = "3";

    /**
     * 2.1 ================审批类型：1-审查人，2-审批人
     */
    public static final String DESIGN_ACT_USER_TYPE_1 = "1";
    public static final String DESIGN_ACT_USER_TYPE_2 = "2";

    /**
     * 3. ================是或否标识，1-是，0-否
     */
    public static final String YES = "1";
    public static final String NO = "0";

    /**
     * 4. ================是否有效标识：1-正常（有效），2-失效
     */
    public static final String EFFECTIVE = "1";
    public static final String INVALID = "2";

    /**
     * 5. 上传爆破设计生成方式：1-完整设计， 2-系统编辑
     */
    public static final String DESIGN_GENERATION_MODEL_1 = "1";
    public static final String DESIGN_GENERATION_MODEL_2 = "2";

    /**
     * 6. 数据字典字典类型：1-设计上传模板，2-数据导出模板，3-通用模板
     */
    public static final String DATA_DICT_TYPE_1 = "1";
    public static final String DATA_DICT_TYPE_2 = "2";
    public static final String DATA_DICT_TYPE_3 = "3";

    /**
     * 通知消息类型：1-审查通知，2-施工通知，3-评价通知，4-审核撤销通知
     */
    public static final String NOTIFICATION_MESSAGE_TYPE_1 = "1";
    public static final String NOTIFICATION_MESSAGE_TYPE_2 = "2";
    public static final String NOTIFICATION_MESSAGE_TYPE_3 = "3";
    public static final String NOTIFICATION_MESSAGE_TYPE_4 = "4";

    /**
     * 系统操作日志类型：1-正常，2-异常
     */
    public static final String SYS_LOG_TYPE_1 = "1";
    public static final String SYS_LOG_TYPE_2 = "2";

    /**
     * 两种下载的模板，1-铁矿，2-煤矿，3-铁矿模板2
     */
    public static final String DOWNLOAD_TEMPLATE_1 = "1";
    public static final String DOWNLOAD_TEMPLATE_2 = "2";
    public static final String DOWNLOAD_TEMPLATE_3 = "3";
    /**
     * 判断是否double类型数据
     */
    public static final String DOUBLE_PATTERN = "-?[0-9]+\\.?[0-9]*";

}