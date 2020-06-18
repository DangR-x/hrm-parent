package com.highnes.attractinvestment.domain;

import java.io.Serializable;

/**
 * @BelongsProject: EasyPower
 * @BelongsPackage: com.highnes.easypower.domain
 * @Author: ranlongjun
 * @CreateTime: 2020-03-04 15:13
 * @Description: 返回结果消息对象
 */
public class ResultMessage implements Serializable {

    /**
     * 返回编码
     */
    private String code;
    /**
     * 状态true,false
     */
    private boolean status;
    /**
     * 状态说明，成功或失败原因
     */
    private String msg;
    /**
     * 返回结果对象，根据不同接口返回相关结果信息
     */
    private Object content;

    public ResultMessage(){

    }

    public static ResultMessage success(){
        ResultMessage resultMessage = new ResultMessage();
        resultMessage.setCode("0");
        resultMessage.setStatus(true);
        resultMessage.setMsg("请求成功");
        return resultMessage;
    }

    public static ResultMessage success(Object o){
        ResultMessage resultMessage = new ResultMessage();
        resultMessage.setCode("0");
        resultMessage.setStatus(true);
        resultMessage.setMsg("请求成功");
        resultMessage.setContent(o);
        return resultMessage;
    }

    public static ResultMessage success(String msg){
        ResultMessage resultMessage = new ResultMessage();
        resultMessage.setCode("0");
        resultMessage.setStatus(true);
        resultMessage.setMsg(msg);
        return resultMessage;
    }

    public static ResultMessage fail(String msg){
        ResultMessage resultMessage = new ResultMessage();
        resultMessage.setCode("1");
        resultMessage.setStatus(false);
        resultMessage.setMsg(msg);
        return resultMessage;
    }

    public static ResultMessage error(String msg){
        return error(msg, null);
    }

    public static ResultMessage error(String msg, Object content){
        ResultMessage resultMessage = new ResultMessage();
        resultMessage.setCode("-1");
        resultMessage.setStatus(false);
        resultMessage.setMsg(msg);
        resultMessage.setContent(content);
        return resultMessage;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getContent() {
        return content;
    }

    public void setContent(Object content) {
        this.content = content;
    }
}
