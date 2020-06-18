package com.highnes.attractinvestment.controller;

import com.google.common.collect.Lists;
import com.highnes.attractinvestment.annotation.Login;
import com.highnes.attractinvestment.common.utils.LoginUtils;
import com.highnes.attractinvestment.common.utils.StringUtils;
import com.highnes.attractinvestment.config.GlobalConfig;
import com.highnes.attractinvestment.controller.params.ProcessDetailsRequest;
import com.highnes.attractinvestment.controller.params.ProcessRequest;
import com.highnes.attractinvestment.controller.params.ProjectProcessRequest;
import com.highnes.attractinvestment.domain.ResultMessage;
import com.highnes.attractinvestment.entity.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Rain
 * @date 2020/5/25
 * @description
 */
@RestController(value = "api/process")
@Api(tags = "审批流程")
public class ProcessController extends BaseController{

    /**
     * 新增/修改审批流程
     * @param processRequest
     * @return
     */
    @PostMapping(value = "addProcess")
    @ApiOperation(value = "新增/修改审批流程")
    @Login
    public ResultMessage addProcess(@RequestBody ProcessRequest processRequest){
        if (processRequest == null || StringUtils.isBlank(processRequest.getType())){
            return ResultMessage.fail("参数为空");
        }

        ActivityProcess activityProcess = new ActivityProcess();
        if (StringUtils.isNotBlank(processRequest.getProcessId())){
            activityProcess = activityProcessService.get(processRequest.getProcessId());
        }
        activityProcess.setType(processRequest.getType());
        activityProcess.setStatus(processRequest.getStatus());
        activityProcess.setDeptId(processRequest.getDeptId());

        if (processRequest.getProcessDetailsRequestList() != null && processRequest.getProcessDetailsRequestList().size() > 0){
            List<ActivityProcessDetails> activityProcessDetailsList = Lists.newArrayList();
            for (ProcessDetailsRequest processDetailsRequest : processRequest.getProcessDetailsRequestList()) {
                ActivityProcessDetails activityProcessDetails = new ActivityProcessDetails();
                activityProcessDetails.setUserId(processDetailsRequest.getUserId());
                activityProcessDetails.setUserName(processDetailsRequest.getUserName());
                activityProcessDetails.setSort(processDetailsRequest.getSort());
                activityProcessDetailsList.add(activityProcessDetails);
            }
            activityProcess.setActivityProcessDetailsList(activityProcessDetailsList);
        }
        activityProcessService.saveDetails(activityProcess);
        return ResultMessage.success(activityProcess);
    }

    /**
     * 查询流程详情
     * @param type
     * @return
     */
    @GetMapping(value = "queryProcessByType")
    @ApiOperation(value = "查询流程详情")
    @Login
    @ApiImplicitParams({
            @ApiImplicitParam(name = "type", value = "流程类型：1-部门审批，2-成员审批", required =  true, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "status", value = "状态：1-暂停，2-重启，3-终止", required =  true, dataType = "string", paramType = "query")
    })
    public ResultMessage queryProcessByType(String type, String status){
        if (StringUtils.isBlank(status)){
            return ResultMessage.fail("参数为空");
        }
        ActivityProcess activityProcess = new ActivityProcess();
        activityProcess.setType(type);
        activityProcess.setStatus(status);
        List<ActivityProcess> activityProcessList = activityProcessService.findList(activityProcess);
        if (activityProcessList != null && activityProcessList.size() > 0){
            activityProcess = activityProcessList.get(0);
            if (GlobalConfig.ACTIVITY_TYPE_2.equals(activityProcess.getType())){
                activityProcess = activityProcessService.findDetails(activityProcess);
            }
        }
        return ResultMessage.success(activityProcess);
    }

    /**
     * 申请审批
     * @param projectProcessRequest
     * @return
     */
    @PostMapping(value = "addProjectProcess")
    @ApiOperation(value = "申请审批")
    @Login
    public ResultMessage addProjectProcess(@RequestBody ProjectProcessRequest projectProcessRequest){
        if (projectProcessRequest == null || StringUtils.isBlank(projectProcessRequest.getProjectId()) || StringUtils.isBlank(projectProcessRequest.getStatus())){
            return ResultMessage.fail("参数为空");
        }

        // 查询当前流程类型
        ActivityProcess activityProcess = new ActivityProcess();
        activityProcess.setStatus(projectProcessRequest.getStatus());
        List<ActivityProcess> activityProcessList = activityProcessService.findList(activityProcess);
        if (activityProcessList == null || activityProcessList.size() == 0){
            return ResultMessage.fail("未查询到审批流程");
        }

        // 查询审批人员
        activityProcess = activityProcessService.findDetails(activityProcessList.get(0));
        ProjectProcess projectProcess = new ProjectProcess();
        projectProcess.setProjectId(projectProcessRequest.getProjectId());
        // 项目阶段：0-待审批，1-审批通过，2-审批拒绝
        projectProcess.setStep(GlobalConfig.PROCESS_STEP_0);
        // 查询当前项目是否重复申请审批
        List<ProjectProcess> projectProcessList = projectProcessService.findList(projectProcess);
        if (projectProcessList != null && projectProcessList.size() > 0){
            return ResultMessage.fail("重复申请");
        }
        projectProcess.setStatus(projectProcessRequest.getStatus());
        projectProcess.setType(activityProcess.getType());
        projectProcess.setReason(projectProcessRequest.getReason());
        projectProcess.setRebootDate(projectProcessRequest.getRebootDate());
        projectProcess.setDeptId(activityProcess.getDeptId());
        if (activityProcess.getActivityProcessDetailsList() != null && activityProcess.getActivityProcessDetailsList().size() > 0){
            List<ProjectProcessDetails> projectProcessDetailsList = Lists.newArrayList();
            int i = 0;
            for (ActivityProcessDetails activityProcessDetails : activityProcess.getActivityProcessDetailsList()) {
                ProjectProcessDetails projectProcessDetails = new ProjectProcessDetails();
                projectProcessDetails.setUserName(activityProcessDetails.getUserName());
                projectProcessDetails.setUserId(activityProcessDetails.getUserId());
                projectProcessDetails.setSort(activityProcessDetails.getSort());
                if (i == 0){
                    projectProcessDetails.setStep(GlobalConfig.PROCESS_STEP_0);
                }else {
                    projectProcessDetails.setStep(GlobalConfig.PROCESS_STEP_B1);
                }
                projectProcessDetailsList.add(projectProcessDetails);
            }
            projectProcess.setProjectProcessDetailsList(projectProcessDetailsList);
        }
        projectProcessService.saveDetails(projectProcess);

        // 修改项目状态
        ProjectInfo projectInfo = projectInfoService.get(projectProcessRequest.getProjectId());
        if (!GlobalConfig.PROCESS_STATUS_2.equals(projectProcessRequest.getStatus())){
            projectInfo.setStepStatus(projectProcess.getStatus());
        }
        String remark = "";
        switch (projectProcess.getStatus()){
            case GlobalConfig.PROCESS_STATUS_1: remark = "暂停待审批"; break;
            case GlobalConfig.PROCESS_STATUS_2: remark = "重启待审批"; break;
            case GlobalConfig.PROCESS_STATUS_3: remark = "终止待审批"; break;
            default: break;
        }
        projectInfo.setStepRemark(remark);
        projectInfoService.save(projectInfo);
        return ResultMessage.success(projectProcess);
    }

    /**
     * 执行审批
     * @param projectProcessRequest
     * @return
     */
    @PostMapping(value = "execProjectProcess")
    @ApiOperation(value = "执行审批")
    @Login
    public ResultMessage execProjectProcess(@RequestBody ProjectProcessRequest projectProcessRequest){
        if (projectProcessRequest == null || StringUtils.isBlank(projectProcessRequest.getProjectId())){
            return ResultMessage.fail("参数为空");
        }
        ProjectProcess projectProcess = new ProjectProcess();
        projectProcess.setProjectId(projectProcessRequest.getProjectId());
        projectProcess.setStep(GlobalConfig.PROCESS_STEP_0);
        projectProcess.setStatus(projectProcessRequest.getStatus());
        List<ProjectProcess> projectProcessList = projectProcessService.findList(projectProcess);
        if (projectProcessList == null || projectProcessList.size() == 0){
            return ResultMessage.fail("未查询到审批项目");
        }

        projectProcess = projectProcessService.findDetails(projectProcessList.get(0));
        if (!GlobalConfig.PROCESS_STEP_0.equals(projectProcess.getStep())){
            // 部门审批，则查询是否已经审批结束
            return ResultMessage.success("审批完成");
        }
        SysUser sysUser = LoginUtils.getLogin();
        // 审批通过状态
        boolean processFlag = false;
        // 审批拒绝，项目状态回退
        boolean refuse = false;
        if (GlobalConfig.ACTIVITY_TYPE_2.equals(projectProcess.getType())){
            // 成员审批，查询是否到该成员
            // 排序
            int i = 0;
            boolean proFlag = false;
            for (ProjectProcessDetails projectProcessDetails : projectProcess.getProjectProcessDetailsList()) {
                if (sysUser.getUserId().equals(projectProcessDetails.getUserId())){
                    proFlag = true;
                    if (GlobalConfig.PROCESS_STEP_B1.equals(projectProcessDetails.getStep())){
                        return ResultMessage.fail("上一个审批未完成");
                    }else if (GlobalConfig.PROCESS_STEP_0.equals(projectProcessDetails.getStep())){
                        // 执行审批
                        projectProcessDetails.setStep(projectProcessRequest.getStep());
                        projectProcessDetails.setReason(projectProcessRequest.getReason());
                        projectProcessDetailsService.save(projectProcessDetails);

                        // 判断当前状态是否是拒绝，是则直接返回
                        if (GlobalConfig.PROCESS_STEP_2.equals(projectProcessRequest.getStep())){
                            projectProcess.setStep(projectProcessRequest.getStep());
                            projectProcessService.save(projectProcess);
                            refuse = true;
                            // 跳出循环
                            break;
                        }

                        // 判断当前是否还有下一个审批
                        if (i == projectProcess.getProjectProcessDetailsList().size()-1){
                            // 审批通过
                            projectProcess.setStep(projectProcessRequest.getStep());
                            projectProcessService.save(projectProcess);
                            processFlag = true;
                        }else {
                            // 通知下一个人员审批
                            ProjectProcessDetails d = projectProcess.getProjectProcessDetailsList().get(i+1);
                            d.setStep(GlobalConfig.PROCESS_STEP_0);
                            projectProcessDetailsService.save(projectProcessDetails);
                            break;
                        }
                    }else {
                        return ResultMessage.success("审批完成");
                    }
                }
                i++;
            }
            if (!proFlag){
                return ResultMessage.success("没有审批权限");
            }
        }else {
            // 判断当前登录账号是否审批部门
            if (!sysUser.getDeptId().equals(projectProcess.getDeptId())){
                return ResultMessage.success("没有审批权限");
            }

            ProjectProcessDetails projectProcessDetails = new ProjectProcessDetails();
            projectProcessDetails.setReason(projectProcessRequest.getReason());
            projectProcessDetails.setProcessId(projectProcess.getId());
            projectProcessDetails.setStep(projectProcessRequest.getStep());
            projectProcessDetails.setUserId(sysUser.getUserId());
            projectProcessDetails.setUserName(sysUser.getUserName());
            projectProcessDetailsService.save(projectProcessDetails);

            // 更新主流程
            projectProcess.setStep(projectProcessRequest.getStep());
            projectProcessService.save(projectProcess);
            if (GlobalConfig.PROCESS_STEP_1.equals(projectProcessRequest.getStep())){
                // 通过
                processFlag = true;
            }else if (GlobalConfig.PROCESS_STEP_2.equals(projectProcessRequest.getStep())){
                // 拒绝
                refuse = true;
            }
        }

        // 如果只重启项目审批，审批完成后，需要重启项目
        // 1. 重启通过，状态改为0，终止或者暂停拒绝状态改为0
        String remark = "";
        String status = "";
        switch (projectProcess.getStatus()){
            case GlobalConfig.PROCESS_STATUS_1:
                if (refuse){
                    // 拒绝
                    remark = "暂停已拒绝";
                    status = "0";
                }else if (processFlag){
                    // 通过
                    remark = "暂停已通过";
                    status = projectProcess.getStatus();
                }
                break;
            case GlobalConfig.PROCESS_STATUS_2:
                if (refuse){
                    // 拒绝
                    remark = "重启已拒绝";
                    status = projectProcess.getStatus();
                }else if (processFlag){
                    // 通过
                    remark = "重启已通过";
                    status = "0";
                }
                break;
            case GlobalConfig.PROCESS_STATUS_3:
                if (refuse){
                    // 拒绝
                    remark = "终止已拒绝";
                    status = "0";
                }else if (processFlag){
                    // 通过
                    remark = "终止已通过";
                    status = projectProcess.getStatus();
                }
                break;
            default:
                break;
        }

        if (StringUtils.isNotBlank(remark) && StringUtils.isNotBlank(status)){
            ProjectInfo projectInfo = projectInfoService.get(projectProcessRequest.getProjectId());
            projectInfo.setStepStatus(status);
            projectInfo.setStepRemark(remark);
            projectInfoService.save(projectInfo);
        }
        return ResultMessage.success("审批完成");
    }

    /**
     * 查询审批结果
     * @param projectId
     * @return
     */
    @GetMapping(value = "queryProjectProcess")
    @ApiOperation(value = "查询审批结果")
    @ApiImplicitParam(name = "projectId", value = "项目编码", required =  true, dataType = "string", paramType = "query")
    public ResultMessage queryProjectProcess(String projectId){
        ProjectProcess projectProcess = new ProjectProcess();
        projectProcess.setProjectId(projectId);
        List<ProjectProcess> projectProcessList = projectProcessService.findList(projectProcess);
        if (projectProcessList != null && projectProcessList.size() > 0){
            for (ProjectProcess process : projectProcessList) {
                ProjectProcessDetails projectProcessDetails = new ProjectProcessDetails();
                projectProcessDetails.setProcessId(process.getId());
                process.setProjectProcessDetailsList(projectProcessDetailsService.findList(projectProcessDetails));
            }
        }
        return ResultMessage.success(projectProcessList);
    }

}
