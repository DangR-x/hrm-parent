package com.highnes.attractinvestment.controller;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.highnes.attractinvestment.annotation.Login;
import com.highnes.attractinvestment.common.utils.DateUtils;
import com.highnes.attractinvestment.common.utils.StringUtils;
import com.highnes.attractinvestment.controller.params.DealDetailsRequest;
import com.highnes.attractinvestment.controller.params.InvestigateRequest;
import com.highnes.attractinvestment.controller.params.ProjectInfoRequest;
import com.highnes.attractinvestment.controller.params.ReceptionRequest;
import com.highnes.attractinvestment.domain.IndustriallRequest;
import com.highnes.attractinvestment.config.GlobalConfig;
import com.highnes.attractinvestment.controller.params.*;
import com.highnes.attractinvestment.domain.ResultMessage;
import com.highnes.attractinvestment.entity.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * @author Rain
 * @date 2020/5/15
 * @description
 */
@RestController
@RequestMapping(value = "api/project")
@Api(tags = "项目")
public class ProjectController extends BaseController {




    /**
     * 创建项目获取项目编码
     * @return
     */
    @PostMapping(value = "createProject")
    @ApiOperation(value = "创建项目获取项目编码")
    @Login
    public ResultMessage createProject(){
        ProjectInfo projectInfo = new ProjectInfo();
        projectInfoService.save(projectInfo);
        return ResultMessage.success(projectInfo);
    }

    /**
     * 分页查询项目信息
     * @param pageNo
     * @param pageSize
     * @param projectName
     * @param projectCode
     * @return
     */
    @GetMapping(value = "queryProjectPage")
    @ApiOperation(value = "分页查询项目信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNo", value = "页码", required = true, dataType = "int", paramType = "query"),
            @ApiImplicitParam(name = "pageSize", value = "每页条数", required = true, dataType = "int", paramType = "query"),
            @ApiImplicitParam(name = "projectName", value = "项目名称", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "projectCode", value = "项目编号", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "status", value = "状态：1-在谈，2-拟签约，3-已签约", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "urgeFlag", value = "是否督办项目：0-否，1-是", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "urgeType", value = "督办类型：1-普通督办，2-重点督办", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "stepStatus", value = "阶段状态：0-正常，1-暂停，2-重启，3-终止", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "classifyType", value = "所属行业-门类", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "classifyTypeTwo", value = "所属行业-大类", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "itemType", value = "项目类型", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "startCast", value = "投资金额起始值", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "endCast", value = "投资金额结束值", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "sourceType", value = "项目来源", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "groupId", value = "企业所属小组", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "companyName", value = "企业名称", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "companyCode", value = "企业编号", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "companyUser", value = "企业负责人", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "companyAddress", value = "企业注册地", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "companyClassify", value = "企业行业-门类", required = false, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "transferFlag", value = "是否投促项目：0-否，1-是", required = false, dataType = "string", paramType = "query"),
    })
    @Login
    public ResultMessage queryProjectPage(Integer pageNo, Integer pageSize, String projectName, String projectCode, String status,
                                          String urgeFlag, String urgeType, String stepStatus, String classifyType, String classifyTypeTwo, String itemType,
                                          String startCast, String endCast, String sourceType, String groupId, String companyName, String companyCode, String companyUser,
                                          String companyAddress, String companyClassify, String transferFlag){
        ProjectInfo projectInfo = new ProjectInfo();
        projectInfo.setPageNo(pageNo==null?1:pageNo);
        projectInfo.setPageSize(pageSize==null?10:pageSize);
        projectInfo.setTitle(projectName);
        projectInfo.setCode(projectCode);
        projectInfo.setStatus(status);
        projectInfo.setUrgeFlag(urgeFlag);
        projectInfo.setUrgeType(urgeType);
        projectInfo.setStepStatus(stepStatus);
        projectInfo.setClassifyType(classifyType);
        projectInfo.setClassifyTypeTwo(classifyTypeTwo);
        projectInfo.setItemType(itemType);
        projectInfo.setSourceType(sourceType);
        projectInfo.setGroupId(groupId);
        projectInfo.setTransferFlag(transferFlag);

        Map<String, Object> paras = Maps.newHashMap();
        paras.put("startCast", startCast);
        paras.put("endCast", endCast);
        paras.put("companyName", companyName);
        paras.put("companyCode", companyCode);
        paras.put("companyUser", companyUser);
        paras.put("companyAddress", companyAddress);
        paras.put("companyClassify", companyClassify);
        projectInfo.setParas(paras);
        PageInfo<ProjectInfo> pageInfo = projectInfoService.findPage(projectInfo);
        return ResultMessage.success(pageInfo);
    }

    /**
     * 查询项目信息
     * @param projectName
     * @return
     */
    @GetMapping(value = "queryProjectList")
    @ApiOperation(value = "查询项目信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "projectName", value = "项目名称", required = false, dataType = "string", paramType = "query"),
    })
    @Login
    public ResultMessage queryProjectList(String projectName){
        ProjectInfo projectInfo = new ProjectInfo();
        projectInfo.setTitle(projectName);
        PageInfo<ProjectInfo> pageInfo = projectInfoService.findPage(projectInfo);
        return ResultMessage.success(pageInfo);
    }


    /**
     * 查询项目信息
     * @param projectId
     * @return
     */
    @GetMapping(value = "queryProjectInfo")
    @ApiOperation(value = "查询项目信息")
    @ApiImplicitParam(name = "projectId", value = "项目编码", required = true, paramType = "query", dataType = "string")
    @Login
    public ResultMessage queryProjectInfo(String projectId){
        ProjectInfo projectInfo = projectInfoService.get(projectId);
        return ResultMessage.success(projectInfo);
    }

    /**
     * 查询项目详细信息
     * @param projectId
     * @return
     */
    @GetMapping(value = "queryProjectInfoDetails")
    @ApiOperation(value = "查询项目详细信息")
    @ApiImplicitParam(name = "projectId", value = "项目编码", required = true, paramType = "query", dataType = "string")
    @Login
    public ResultMessage queryProjectInfoDetails(String projectId){
        ProjectInfo projectInfo = projectInfoService.get(projectId);
        // 查询空间需求
        ProjectAreaDetails projectAreaDetails = new ProjectAreaDetails();
        projectAreaDetails.setProjectId(projectId);
        projectInfo.setProjectAreaDetailsList(projectAreaDetailsService.findList(projectAreaDetails));

        // 参与单位
        ProjectCompanyDetails projectCompanyDetails = new ProjectCompanyDetails();
        projectCompanyDetails.setProjectId(projectId);
        projectInfo.setProjectCompanyDetailsList(projectCompanyDetailsService.findList(projectCompanyDetails));

        // 计划书
        ProjectProspectusDetails projectProspectusDetails = new ProjectProspectusDetails();
        projectProspectusDetails.setProjectId(projectId);
        projectInfo.setProjectProspectusDetailsList(projectProspectusDetailsService.findList(projectProspectusDetails));

        // 查询企业信息
        ProjectCompanyInfo projectCompanyInfo = new ProjectCompanyInfo();
        projectCompanyInfo.setProjectId(projectId);
        projectInfo.setProjectCompanyInfoList(projectCompanyInfoService.findList(projectCompanyInfo));

        //查询投资人信息
        projectInfo.setProjectInvestors(projectInvestorService.selectByProjectId(projectId));

        // 人才信息
        ProjectPersonnelInfo projectPersonnelInfo = new ProjectPersonnelInfo();
        projectPersonnelInfo.setProjectId(projectId);
        projectInfo.setProjectPersonnelInfoList(projectPersonnelInfoService.findListDetails(projectPersonnelInfo));

        // 项目画像
        ProjectImages projectImages = new ProjectImages();
        projectImages.setProjectId(projectId);
        projectInfo.setProjectImagesList(projectImagesService.findList(projectImages));
        return ResultMessage.success(projectInfo);
    }

    /**
     * 新增项目
     * @return
     */
    @PostMapping(value = "addProjectInfo")
    @ApiOperation(value = "新增项目")
    @Login
    public ResultMessage addProjectInfo(@RequestBody ProjectInfoRequest projectInfoRequest){
        if (projectInfoRequest == null || StringUtils.isBlank(projectInfoRequest.getProjectId())){
            return ResultMessage.fail("参数为空");
        }
        ProjectInfo projectInfo = projectInfoService.get(projectInfoRequest.getProjectId());
        projectInfo.setTitle(projectInfoRequest.getTitle());
        String code = projectInfoRequest.getCode();
        if (StringUtils.isBlank(projectInfoRequest.getCode())){
            // 项目编号：SPB+当前日期+6位随机数
            code = "SPB"+DateUtils.parseDateToStr("yyyyMMdd", new Date())+new Random().nextInt(1000000);
        }
        // 项目编号
        projectInfo.setCode(code);
        // 状态
        projectInfo.setStatus(projectInfoRequest.getStatus());
        // 是否督办项目：0-否，1-是
        projectInfo.setUrgeFlag(projectInfoRequest.getUrgeFlag());
        // 督办类型：1-普通督办，2-重点督办
        projectInfo.setUrgeType(projectInfoRequest.getUrgeType());
        projectInfo.setUrgeLeader(projectInfoRequest.getUrgeLeader());
        projectInfo.setStepStatus(GlobalConfig.NO);
        projectInfo.setClassifyType(projectInfoRequest.getClassifyType());
        projectInfo.setClassifyTypeTwo(projectInfoRequest.getClassifyTypeTwo());
        projectInfo.setSourceType(projectInfoRequest.getSourceType());
        projectInfo.setSourceTypeTwo(projectInfoRequest.getSourceTypeTwo());
        projectInfo.setDescription(projectInfoRequest.getDescription());
        projectInfo.setTotalCast(projectInfoRequest.getTotalCast());
        projectInfo.setOutputValue(projectInfoRequest.getOutputValue());
        projectInfo.setEstimatedTax(projectInfoRequest.getEstimatedTax());
        projectInfo.setTotalPeople(projectInfoRequest.getTotalPeople());
        projectInfo.setDealTime(projectInfoRequest.getDealTime());
        projectInfo.setOpenTime(projectInfoRequest.getOpenTime());
        projectInfo.setProductionTime(projectInfoRequest.getProductionTime());
        projectInfo.setGroupId(projectInfoRequest.getGroupId());
        // 项目类型
        projectInfo.setItemType(projectInfoRequest.getItemType());

        // 项目空间需求
        if (projectInfoRequest.getProjectAreaRequestList() != null && projectInfoRequest.getProjectAreaRequestList().size() > 0){
            List<ProjectAreaDetails> projectAreaDetailsList = Lists.newArrayList();
            projectInfoRequest.getProjectAreaRequestList().forEach(projectAreaRequest -> {
                ProjectAreaDetails projectAreaDetails = new ProjectAreaDetails();
                projectAreaDetails.setAreaType(projectAreaRequest.getAreaType());
                projectAreaDetails.setAreaCount(projectAreaRequest.getAreaCount());
                projectAreaDetailsList.add(projectAreaDetails);
            });
            projectInfo.setProjectAreaDetailsList(projectAreaDetailsList);
        }

        // 主要参与单位
        if (projectInfoRequest.getProjectCompanyRequestList() != null && projectInfoRequest.getProjectCompanyRequestList().size() > 0){
            List<ProjectCompanyDetails> projectCompanyDetailsList = Lists.newArrayList();
            projectInfoRequest.getProjectCompanyRequestList().forEach(projectCompanyRequest -> {
                ProjectCompanyDetails projectCompanyDetails = new ProjectCompanyDetails();
                projectCompanyDetails.setCompany(projectCompanyRequest.getCompany());
                projectCompanyDetailsList.add(projectCompanyDetails);
            });
            projectInfo.setProjectCompanyDetailsList(projectCompanyDetailsList);
        }

        // 计划书
        if (projectInfoRequest.getProjectProspectusRequestList() != null && projectInfoRequest.getProjectProspectusRequestList().size() > 0){
            List<ProjectProspectusDetails> projectProspectusDetailsList = Lists.newArrayList();
            projectInfoRequest.getProjectProspectusRequestList().forEach(projectProspectusRequest -> {
                ProjectProspectusDetails projectProspectusDetails = new ProjectProspectusDetails();
                projectProspectusDetails.setFileName(projectProspectusRequest.getFileName());
                projectProspectusDetails.setFilePath(projectProspectusRequest.getFilePath());
                projectProspectusDetailsList.add(projectProspectusDetails);
            });
            projectInfo.setProjectProspectusDetailsList(projectProspectusDetailsList);
        }

        //投资人添加
        if(projectInfoRequest.getProjectInvestors()!=null && projectInfoRequest.getProjectInvestors().size() !=0){
            List<ProjectInvestor> projectInvestors1 = projectInfoRequest.getProjectInvestors();
            System.out.println("projectInvestors1:->"+projectInvestors1);

            List<ProjectInvestor> projectInvestors = projectInfoRequest.getProjectInvestors();
            projectInvestorService.insertList(projectInvestors,projectInfoRequest.getProjectId());
        }

        //企业
        if(projectInfoRequest.getCompanyInfoRequestList() != null && projectInfoRequest.getCompanyInfoRequestList().size() != 0){

            List<ProjectCompanyInfo> projectCompanyInfoList = Lists.newArrayList();
            projectInfoRequest.getCompanyInfoRequestList().forEach(companyInfoRequest -> {
                ProjectCompanyInfo projectCompanyInfo = new ProjectCompanyInfo();
                // 所属项目
                projectCompanyInfo.setProjectId(projectInfoRequest.getProjectId());
                projectCompanyInfo.setCompanyName(companyInfoRequest.getCompanyName());
                projectCompanyInfo.setCompanyCode(companyInfoRequest.getCompanyCode());
                projectCompanyInfo.setClassifyType(companyInfoRequest.getClassifyType());
                projectCompanyInfo.setClassifyTypeTwo(companyInfoRequest.getClassifyTypeTwo());
                // 注册地
                projectCompanyInfo.setRegisterAddress(companyInfoRequest.getRegisterAddress());
                projectCompanyInfo.setCompanyDescription(companyInfoRequest.getCompanyDescription());
                // 上年度收入
                projectCompanyInfo.setLastTotalIncome(companyInfoRequest.getLastTotalIncome());
                projectCompanyInfo.setLastPayTaxes(companyInfoRequest.getLastPayTaxes());
                projectCompanyInfo.setTotalPeople(companyInfoRequest.getTotalPeople());
                projectCompanyInfo.setCompanySource(companyInfoRequest.getCompanySource());
                // 企业法人
                projectCompanyInfo.setCompanyLegalPerson(companyInfoRequest.getCompanyLegalPerson());
                projectCompanyInfo.setCompanyMobile(companyInfoRequest.getCompanyMobile());
                // 营业执照
                projectCompanyInfo.setCompanyLicense(companyInfoRequest.getCompanyLicense());
                projectCompanyInfoList.add(projectCompanyInfo);
            });
            // 保存企业信息
            projectCompanyInfoService.saveProjectCompany(projectCompanyInfoList, projectInfoRequest.getProjectId());
        }

        projectInfoService.saveDetails(projectInfo);
        return ResultMessage.success(projectInfo);
    }

   @PostMapping(value = "addprojectInvestor")
   @ApiOperation(value = "保存投资人信息")
   @Login
   public ResultMessage addprojectInvestor(@RequestBody ProjectInfoRequest projectInfoRequest){
       if (projectInfoRequest == null || StringUtils.isBlank(projectInfoRequest.getProjectId()) || projectInfoRequest.getProjectInvestors() == null || projectInfoRequest.getProjectInvestors().size() == 0){
           return ResultMessage.fail("投资人参数不能为空！");
       }
       List<ProjectInvestor> projectInvestors = projectInfoRequest.getProjectInvestors();
       projectInvestorService.insertList(projectInvestors,projectInfoRequest.getProjectId());
       return ResultMessage.success(projectInvestors);
   }

    /**
     * 保存企业信息
     * @param projectInfoRequest
     * @return
     */
    @PostMapping(value = "addCompanyInfo")
    @ApiOperation(value = "保存企业信息")
    @Login
    public ResultMessage addCompanyInfo(@RequestBody ProjectInfoRequest projectInfoRequest){
        if (projectInfoRequest == null || StringUtils.isBlank(projectInfoRequest.getProjectId()) || projectInfoRequest.getCompanyInfoRequestList() == null || projectInfoRequest.getCompanyInfoRequestList().size() == 0){
            return ResultMessage.fail("企业参数不能为空！");
        }

        List<ProjectCompanyInfo> projectCompanyInfoList = Lists.newArrayList();
        projectInfoRequest.getCompanyInfoRequestList().forEach(companyInfoRequest -> {
            ProjectCompanyInfo projectCompanyInfo = new ProjectCompanyInfo();
            // 所属项目
            projectCompanyInfo.setProjectId(projectInfoRequest.getProjectId());
            projectCompanyInfo.setCompanyName(companyInfoRequest.getCompanyName());
            projectCompanyInfo.setCompanyCode(companyInfoRequest.getCompanyCode());
            projectCompanyInfo.setClassifyType(companyInfoRequest.getClassifyType());
            projectCompanyInfo.setClassifyTypeTwo(companyInfoRequest.getClassifyTypeTwo());
            // 注册地
            projectCompanyInfo.setRegisterAddress(companyInfoRequest.getRegisterAddress());
            projectCompanyInfo.setCompanyDescription(companyInfoRequest.getCompanyDescription());
            // 上年度收入
            projectCompanyInfo.setLastTotalIncome(companyInfoRequest.getLastTotalIncome());
            projectCompanyInfo.setLastPayTaxes(companyInfoRequest.getLastPayTaxes());
            projectCompanyInfo.setTotalPeople(companyInfoRequest.getTotalPeople());
            projectCompanyInfo.setCompanySource(companyInfoRequest.getCompanySource());
            // 企业法人
            projectCompanyInfo.setCompanyLegalPerson(companyInfoRequest.getCompanyLegalPerson());
            projectCompanyInfo.setCompanyMobile(companyInfoRequest.getCompanyMobile());
            // 营业执照
            projectCompanyInfo.setCompanyLicense(companyInfoRequest.getCompanyLicense());
            projectCompanyInfoList.add(projectCompanyInfo);
        });
        // 保存企业信息
        projectCompanyInfoService.saveProjectCompany(projectCompanyInfoList, projectInfoRequest.getProjectId());
        return ResultMessage.success(projectCompanyInfoList);
    }

    /**
     * 新增人才信息
     * @param projectInfoRequest
     * @return
     */
    @PostMapping(value = "addPersonnelInfo")
    @ApiOperation(value = "新增人才信息")
    @Login
    public ResultMessage addPersonnelInfo(@RequestBody ProjectInfoRequest projectInfoRequest){
        if (projectInfoRequest == null || StringUtils.isBlank(projectInfoRequest.getProjectId()) || projectInfoRequest.getPersonnelInfoRequestList() == null || projectInfoRequest.getPersonnelInfoRequestList().size() == 0){
            return ResultMessage.fail("参数为空");
        }

        List<ProjectPersonnelInfo> projectPersonnelInfoList = Lists.newArrayList();
        projectInfoRequest.getPersonnelInfoRequestList().forEach(personnelInfoRequest -> {
            ProjectPersonnelInfo projectPersonnelInfo = new ProjectPersonnelInfo();
            // 所属项目
            projectPersonnelInfo.setProjectId(projectInfoRequest.getProjectId());
            projectPersonnelInfo.setName(personnelInfoRequest.getName());
            projectPersonnelInfo.setPost(personnelInfoRequest.getPost());
            projectPersonnelInfo.setTitle(personnelInfoRequest.getTitle());
            projectPersonnelInfo.setHighHonor(personnelInfoRequest.getHighHonor());
            projectPersonnelInfo.setRemarks(personnelInfoRequest.getRemarks());
            // 简历
            if (personnelInfoRequest.getPersonnelResumeRequestList() != null && personnelInfoRequest.getPersonnelResumeRequestList().size() > 0){
                List<ProjectPersonnelResume> projectPersonnelResumeList = Lists.newArrayList();
                personnelInfoRequest.getPersonnelResumeRequestList().forEach(personnelResumeRequest -> {
                    ProjectPersonnelResume projectPersonnelResume = new ProjectPersonnelResume();
                    projectPersonnelResume.setFileName(personnelResumeRequest.getFileName());
                    projectPersonnelResume.setFilePath(personnelResumeRequest.getFilePath());
                    projectPersonnelResumeList.add(projectPersonnelResume);
                });
                projectPersonnelInfo.setProjectPersonnelResumeList(projectPersonnelResumeList);
            }
            projectPersonnelInfoList.add(projectPersonnelInfo);
        });
        projectPersonnelInfoService.saveProject(projectPersonnelInfoList, projectInfoRequest.getProjectId());
        return ResultMessage.success(projectPersonnelInfoList);
    }

    /**
     * 新增项目画像
     * @param projectInfoRequest
     * @return
     */
    @PostMapping(value = "addProjectImages")
    @ApiOperation(value = "新增项目画像")
    @Login
    public ResultMessage addProjectImages(@RequestBody ProjectInfoRequest projectInfoRequest){
        if (projectInfoRequest == null || StringUtils.isBlank(projectInfoRequest.getProjectId()) || projectInfoRequest.getImagesRequestList() == null || projectInfoRequest.getImagesRequestList().size() == 0){
            return ResultMessage.fail("参数为空");
        }

        List<ProjectImages> projectImagesList = Lists.newArrayList();
        projectInfoRequest.getImagesRequestList().forEach(imagesRequest -> {
            ProjectImages projectImages = new ProjectImages();
            projectImages.setProjectId(projectInfoRequest.getProjectId());
            projectImages.setStatus(imagesRequest.getStatus());
            projectImages.setUploadFlag(imagesRequest.getUploadFlag());
            projectImages.setUploadCode(imagesRequest.getUploadCode());
            projectImages.setOpenFlag(imagesRequest.getOpenFlag());
            projectImages.setOpenDate(imagesRequest.getOpenDate());
            projectImages.setSigningFlag(imagesRequest.getSigningFlag());
            projectImages.setSigningDate(imagesRequest.getSigningDate());
            projectImagesList.add(projectImages);
        });
        projectImagesService.saveBatch(projectImagesList, projectInfoRequest.getProjectId());
        return ResultMessage.success(projectImagesList);
    }

    /**
     * 新增项目进展维护
     * @param dealDetailsRequest
     * @return
     */
    @PostMapping(value = "addProjectDealDetails")
    @ApiOperation(value = "新增项目进展维护")
    @Login
    public ResultMessage addProjectDealDetails(@RequestBody DealDetailsRequest dealDetailsRequest){
        ProjectDealDetails projectDealDetails = new ProjectDealDetails();
        projectDealDetails.setProjectId(dealDetailsRequest.getProjectId());
        projectDealDetails.setProjectName(dealDetailsRequest.getProjectName());
        projectDealDetails.setDealUserName(dealDetailsRequest.getDealUserName());
        projectDealDetails.setDealCreateDate(dealDetailsRequest.getDealCreateDate());
        // 企业联系人
        projectDealDetails.setCompanyUserName(dealDetailsRequest.getCompanyUserName());
        // 联系人职务
        projectDealDetails.setCompanyUserPost(dealDetailsRequest.getCompanyUserPost());
        projectDealDetails.setDealType(dealDetailsRequest.getDealType());
        // 项目进展
        projectDealDetails.setProjectDebriefing(dealDetailsRequest.getProjectDebriefing());

        projectDealDetails.setProjectIssues(dealDetailsRequest.getProjectIssues());
        projectDealDetails.setProjectFollowUp(dealDetailsRequest.getProjectFollowUp());
        projectDealDetailsService.save(projectDealDetails);
        return ResultMessage.success(projectDealDetails);
    }

    /**
     * 修改项目进展维护
     * @param dealDetailsRequest
     * @return
     */
    @PostMapping(value = "updateProjectDealDetails")
    @ApiOperation(value = "修改项目进展维护")
    @Login
    public ResultMessage updateProjectDealDetails(@RequestBody DealDetailsRequest dealDetailsRequest){
        if (dealDetailsRequest == null || StringUtils.isBlank(dealDetailsRequest.getDetailsId())){
            return ResultMessage.fail("参数为空");
        }
        ProjectDealDetails projectDealDetails = projectDealDetailsService.get(dealDetailsRequest.getDetailsId());
        projectDealDetails.setProjectId(dealDetailsRequest.getProjectId());
        projectDealDetails.setProjectName(dealDetailsRequest.getProjectName());
        projectDealDetails.setDealUserName(dealDetailsRequest.getDealUserName());
        projectDealDetails.setDealCreateDate(dealDetailsRequest.getDealCreateDate());
        // 企业联系人
        projectDealDetails.setCompanyUserName(dealDetailsRequest.getCompanyUserName());
        // 联系人职务
        projectDealDetails.setCompanyUserPost(dealDetailsRequest.getCompanyUserPost());
        projectDealDetails.setDealType(dealDetailsRequest.getDealType());
        // 项目进展
        projectDealDetails.setProjectDebriefing(dealDetailsRequest.getProjectDebriefing());

        projectDealDetails.setProjectIssues(dealDetailsRequest.getProjectIssues());
        projectDealDetails.setProjectFollowUp(dealDetailsRequest.getProjectFollowUp());
        projectDealDetailsService.save(projectDealDetails);
        return ResultMessage.success(projectDealDetails);
    }

    /**
     * 查询所有项目进展维护
     * @param projectId
     * @return
     */
    @GetMapping(value = "queryProjectDealDetailsList")
    @ApiOperation(value = "查询所有项目进展维护")
    @ApiImplicitParam(name = "projectId", value = "项目编码", required = true, dataType = "string", paramType = "query")
    @Login
    public ResultMessage queryProjectDealDetailsList(String projectId){
        if (StringUtils.isBlank(projectId)){
            return ResultMessage.fail("参数为空");
        }
        ProjectDealDetails projectDealDetails = new ProjectDealDetails();
        projectDealDetails.setProjectId(projectId);
        return ResultMessage.success(projectDealDetailsService.findList(projectDealDetails));
    }

    /**
     * 查询项目进展维护
     * @param dealId
     * @return
     */
    @GetMapping(value = "queryProjectDealDetails")
    @ApiOperation(value = "查询项目进展维护")
    @ApiImplicitParam(name = "dealId", value = "进展编码", required = true, dataType = "string", paramType = "query")
    @Login
    public ResultMessage queryProjectDealDetails(String dealId){
        if (StringUtils.isBlank(dealId)){
            return ResultMessage.fail("参数为空");
        }
        return ResultMessage.success(projectDealDetailsService.get(dealId));
    }

    /**
     * 移除项目进展维护
     * @param dealDetailsRequest
     * @return
     */
    @PostMapping(value = "removeProjectDealDetails")
    @ApiOperation(value = "移除项目进展维护")
    @Login
    public ResultMessage removeProjectDealDetails(@RequestBody DealDetailsRequest dealDetailsRequest){
        if (dealDetailsRequest == null || StringUtils.isBlank(dealDetailsRequest.getDetailsId())){
            return ResultMessage.fail("参数为空");
        }
        projectDealDetailsService.delete(dealDetailsRequest.getDetailsId());
        return ResultMessage.success("移除成功");
    }

    /**
     * 新增考察信息
     * @param investigateRequest
     * @return
     */
    @PostMapping(value = "addInvestigate")
    @ApiOperation(value = "新增考察信息")
    @Login
    public ResultMessage addInvestigate(@RequestBody InvestigateRequest investigateRequest){
        if (investigateRequest == null || StringUtils.isBlank(investigateRequest.getProjectId())){
            return ResultMessage.fail("参数为空");
        }

        ProjectInvestigate projectInvestigate = new ProjectInvestigate();
        if (StringUtils.isNotBlank(investigateRequest.getInvestigateId())){
            projectInvestigate = projectInvestigateService.get(investigateRequest.getInvestigateId());
        }
        if (projectInvestigate == null){
            projectInvestigate = new ProjectInvestigate();
        }
        projectInvestigate.setProjectId(investigateRequest.getProjectId());
        projectInvestigate.setProjectName(investigateRequest.getProjectName());
        projectInvestigate.setInvestigateStartTime(investigateRequest.getInvestigateStartTime());
        projectInvestigate.setInvestigateEndTime(investigateRequest.getInvestigateEndTime());
        projectInvestigate.setMainLeader(investigateRequest.getMainLeader());
        projectInvestigate.setOtherLeader(investigateRequest.getOtherLeader());
        projectInvestigate.setInvestigatePlane(investigateRequest.getInvestigatePlane());
        projectInvestigate.setRemarks(investigateRequest.getRemarks());
        projectInvestigate.setTravelDate(investigateRequest.getTravelDate());
        projectInvestigate.setReturnTripDate(investigateRequest.getReturnTripDate());
        projectInvestigate.setTravel(investigateRequest.getTravel());
        projectInvestigate.setAddress(investigateRequest.getAddress());
        // 陪同方案
        if (investigateRequest.getInvestigateDetailsRequestList() != null && investigateRequest.getInvestigateDetailsRequestList().size() >0){
            List<ProjectInvestigateDetails> projectInvestigateDetailsList = Lists.newArrayList();
            investigateRequest.getInvestigateDetailsRequestList().forEach(investigateDetailsRequest -> {
                ProjectInvestigateDetails projectInvestigateDetails = new ProjectInvestigateDetails();
                projectInvestigateDetails.setDept(investigateDetailsRequest.getDept());
                projectInvestigateDetails.setName(investigateDetailsRequest.getName());
                projectInvestigateDetailsList.add(projectInvestigateDetails);
            });
            projectInvestigate.setProjectInvestigateDetailsList(projectInvestigateDetailsList);
        }
        // 考察方案
        if (investigateRequest.getInvestigateFileRequestList() != null && investigateRequest.getInvestigateFileRequestList().size() > 0){
            List<ProjectInvestigateFile> projectInvestigateFileList = Lists.newArrayList();
            for (InvestigateFileRequest investigateFileRequest : investigateRequest.getInvestigateFileRequestList()) {
                ProjectInvestigateFile projectInvestigateFile = new ProjectInvestigateFile();
                projectInvestigateFile.setFileName(investigateFileRequest.getFileName());
                projectInvestigateFile.setFilePath(investigateFileRequest.getFilePath());
                projectInvestigateFileList.add(projectInvestigateFile);
            }
            projectInvestigate.setProjectInvestigateFileList(projectInvestigateFileList);
        }
        projectInvestigateService.saveDetails(projectInvestigate);
        return ResultMessage.success(projectInvestigate);
    }

    /**
     * 分页查询考察信息
     * @param pageNo
     * @param pageSize
     * @return
     */
    @GetMapping(value = "queryInvestigatePage")
    @ApiOperation(value = "分页查询考察信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNo", value = "当前页数", required = true, dataType = "int", paramType = "query"),
            @ApiImplicitParam(name = "pageSize", value = "数据条数", required = true, dataType = "int", paramType = "query"),
    })
    public ResultMessage queryInvestigatePage(Integer pageNo, Integer pageSize){
        ProjectInvestigate projectInvestigate = new ProjectInvestigate();
        projectInvestigate.setPageNo(pageNo);
        projectInvestigate.setPageSize(pageSize);
        PageInfo<ProjectInvestigate> projectInvestigatePageInfo = projectInvestigateService.findPage(projectInvestigate);
        if (projectInvestigatePageInfo != null && projectInvestigatePageInfo.getList() != null && projectInvestigatePageInfo.getList().size() > 0){
            for (ProjectInvestigate investigate : projectInvestigatePageInfo.getList()) {
                investigate.setProjectInfo(projectInfoService.get(investigate.getProjectId()));
            }
        }
        return ResultMessage.success(projectInvestigatePageInfo);
    }

    /**
     * 新增考察信息
     * @param investigateRequest
     * @return
     */
    @PostMapping(value = "updateInvestigate")
    @ApiOperation(value = "修改考察信息")
    @Login
    @ApiIgnore
    public ResultMessage updateInvestigate(@RequestBody InvestigateRequest investigateRequest){
        if (investigateRequest == null || StringUtils.isBlank(investigateRequest.getProjectId())){
            return ResultMessage.fail("参数为空");
        }
        ProjectInvestigate projectInvestigate = projectInvestigateService.get(investigateRequest.getInvestigateId());
        projectInvestigate.setProjectId(investigateRequest.getProjectId());
        projectInvestigate.setProjectName(investigateRequest.getProjectName());
        projectInvestigate.setInvestigateStartTime(investigateRequest.getInvestigateStartTime());
        projectInvestigate.setInvestigateEndTime(investigateRequest.getInvestigateEndTime());
        projectInvestigate.setMainLeader(investigateRequest.getMainLeader());
        projectInvestigate.setOtherLeader(investigateRequest.getOtherLeader());
        projectInvestigate.setInvestigatePlane(investigateRequest.getInvestigatePlane());
        projectInvestigate.setRemarks(investigateRequest.getRemarks());
        projectInvestigate.setTravelDate(investigateRequest.getTravelDate());
        projectInvestigate.setReturnTripDate(investigateRequest.getReturnTripDate());
        projectInvestigate.setTravel(investigateRequest.getTravel());
        projectInvestigate.setAddress(investigateRequest.getAddress());
        // 陪同人员
        if (investigateRequest.getInvestigateDetailsRequestList() != null && investigateRequest.getInvestigateDetailsRequestList().size() >0){
            List<ProjectInvestigateDetails> projectInvestigateDetailsList = Lists.newArrayList();
            investigateRequest.getInvestigateDetailsRequestList().forEach(investigateDetailsRequest -> {
                ProjectInvestigateDetails projectInvestigateDetails = new ProjectInvestigateDetails();
                projectInvestigateDetails.setDept(investigateDetailsRequest.getDept());
                projectInvestigateDetails.setName(investigateDetailsRequest.getName());
                projectInvestigateDetailsList.add(projectInvestigateDetails);
            });
            projectInvestigate.setProjectInvestigateDetailsList(projectInvestigateDetailsList);
        }
        // 考察方案
        if (investigateRequest.getInvestigateFileRequestList() != null && investigateRequest.getInvestigateFileRequestList().size() > 0){
            List<ProjectInvestigateFile> projectInvestigateFileList = Lists.newArrayList();
            for (InvestigateFileRequest investigateFileRequest : investigateRequest.getInvestigateFileRequestList()) {
                ProjectInvestigateFile projectInvestigateFile = new ProjectInvestigateFile();
                projectInvestigateFile.setFileName(investigateFileRequest.getFileName());
                projectInvestigateFile.setFilePath(investigateFileRequest.getFilePath());
                projectInvestigateFileList.add(projectInvestigateFile);
            }
            projectInvestigate.setProjectInvestigateFileList(projectInvestigateFileList);
        }
        projectInvestigateService.saveDetails(projectInvestigate);
        return ResultMessage.success(projectInvestigate);
    }

    /**
     * 查询考察详情
     * @param projectId
     * @return
     */
    @GetMapping(value = "queryInvestigate")
    @ApiOperation(value = "查询考察详情")
    @ApiImplicitParam(name = "projectId", value = "项目编码", required = true, dataType = "string", paramType = "query")
    @Login
    public ResultMessage queryInvestigate(String projectId){
        if (StringUtils.isBlank(projectId)){
            return ResultMessage.fail("参数为空");
        }

        ProjectInvestigate projectInvestigate = new ProjectInvestigate();
        projectInvestigate.setProjectId(projectId);
        List<ProjectInvestigate> projectInvestigateList = projectInvestigateService.findList(projectInvestigate);
        if (projectInvestigateList != null && projectInvestigateList.size() > 0){
            projectInvestigate = projectInvestigateList.get(0);
            projectInvestigate = projectInvestigateService.findDetails(projectInvestigate);
        }
        return ResultMessage.success(projectInvestigate);
    }

    /**
     * 新增接待详情
     * @param receptionRequest
     * @return
     */
    @PostMapping(value = "addReception")
    @ApiOperation(value = "新增接待详情")
    @Login
    public ResultMessage addReception(@RequestBody ReceptionRequest receptionRequest){
        if (receptionRequest == null || StringUtils.isBlank(receptionRequest.getProjectId())){
            return ResultMessage.fail("参数为空");
        }

        ProjectReception projectReception = new ProjectReception();
        if (StringUtils.isNotBlank(receptionRequest.getReceptionId())){
            projectReception = projectReceptionService.get(receptionRequest.getReceptionId());
        }
        if (projectReception == null ){
            projectReception = new ProjectReception();
        }
        projectReception.setProjectId(receptionRequest.getProjectId());
        projectReception.setProjectName(receptionRequest.getProjectName());
        projectReception.setReceptionDate(receptionRequest.getReceptionDate());
        projectReception.setMainLeader(receptionRequest.getMainLeader());
        projectReception.setOtherLeader(receptionRequest.getOtherLeader());
        projectReception.setRemarks(receptionRequest.getRemarks());
        // 到访人员
        if (receptionRequest.getReceptionVisitRequestList() != null && receptionRequest.getReceptionVisitRequestList().size() >0){
            List<ProjectReceptionVisit> projectReceptionVisitList = Lists.newArrayList();
            receptionRequest.getReceptionVisitRequestList().forEach(receptionVisitRequest -> {
                ProjectReceptionVisit projectReceptionVisit = new ProjectReceptionVisit();
                projectReceptionVisit.setName(receptionVisitRequest.getName());
                projectReceptionVisit.setTitle(receptionVisitRequest.getTitle());
                projectReceptionVisitList.add(projectReceptionVisit);
            });
            projectReception.setProjectReceptionVisitList(projectReceptionVisitList);
        }
        // 陪同人员
        if (receptionRequest.getReceptionDetailsRequestList() != null && receptionRequest.getReceptionDetailsRequestList().size() >0){
            List<ProjectReceptionDetails> projectReceptionDetailsList = Lists.newArrayList();
            receptionRequest.getReceptionDetailsRequestList().forEach(receptionDetailsRequest -> {
                ProjectReceptionDetails projectReceptionDetails = new ProjectReceptionDetails();
                projectReceptionDetails.setName(receptionDetailsRequest.getName());
                projectReceptionDetails.setDept(receptionDetailsRequest.getDept());
                projectReceptionDetailsList.add(projectReceptionDetails);
            });
            projectReception.setProjectReceptionDetailsList(projectReceptionDetailsList);
        }
        // 到访人员
        if (receptionRequest.getReceptionFileRequestList() != null && receptionRequest.getReceptionFileRequestList().size() >0){
            List<ProjectReceptionFile> projectReceptionVisitList = Lists.newArrayList();
            receptionRequest.getReceptionFileRequestList().forEach(receptionFileRequest -> {
                ProjectReceptionFile projectReceptionFile = new ProjectReceptionFile();
                projectReceptionFile.setFileName(receptionFileRequest.getFileName());
                projectReceptionFile.setFilePath(receptionFileRequest.getFilePath());
                projectReceptionVisitList.add(projectReceptionFile);
            });
            projectReception.setProjectReceptionFileList(projectReceptionVisitList);
        }
        projectReceptionService.saveDetails(projectReception);
        return ResultMessage.success(projectReception);
    }

    /**
     * 修改接待详情
     * @param receptionRequest
     * @return
     */
    @PostMapping(value = "updateReception")
    @ApiOperation(value = "修改接待详情")
    @Login
    @ApiIgnore
    public ResultMessage updateReception(@RequestBody ReceptionRequest receptionRequest){
        if (receptionRequest == null || StringUtils.isBlank(receptionRequest.getProjectId()) || StringUtils.isBlank(receptionRequest.getReceptionId())){
            return ResultMessage.fail("参数为空");
        }

        ProjectReception projectReception = projectReceptionService.get(receptionRequest.getReceptionId());
        projectReception.setProjectId(receptionRequest.getProjectId());
        projectReception.setProjectName(receptionRequest.getProjectName());
        projectReception.setReceptionDate(receptionRequest.getReceptionDate());
        projectReception.setMainLeader(receptionRequest.getMainLeader());
        projectReception.setOtherLeader(receptionRequest.getOtherLeader());
        projectReception.setRemarks(receptionRequest.getRemarks());
        // 到访人员
        if (receptionRequest.getReceptionVisitRequestList() != null && receptionRequest.getReceptionVisitRequestList().size() >0){
            List<ProjectReceptionVisit> projectReceptionVisitList = Lists.newArrayList();
            receptionRequest.getReceptionVisitRequestList().forEach(receptionVisitRequest -> {
                ProjectReceptionVisit projectReceptionVisit = new ProjectReceptionVisit();
                projectReceptionVisit.setName(receptionVisitRequest.getName());
                projectReceptionVisit.setTitle(receptionVisitRequest.getTitle());
                projectReceptionVisitList.add(projectReceptionVisit);
            });
            projectReception.setProjectReceptionVisitList(projectReceptionVisitList);
        }
        // 陪同人员
        if (receptionRequest.getReceptionDetailsRequestList() != null && receptionRequest.getReceptionDetailsRequestList().size() >0){
            List<ProjectReceptionDetails> projectReceptionDetailsList = Lists.newArrayList();
            receptionRequest.getReceptionDetailsRequestList().forEach(receptionDetailsRequest -> {
                ProjectReceptionDetails projectReceptionDetails = new ProjectReceptionDetails();
                projectReceptionDetails.setName(receptionDetailsRequest.getName());
                projectReceptionDetails.setDept(receptionDetailsRequest.getDept());
                projectReceptionDetailsList.add(projectReceptionDetails);
            });
            projectReception.setProjectReceptionDetailsList(projectReceptionDetailsList);
        }
        // 陪同方案
        if (receptionRequest.getReceptionFileRequestList() != null && receptionRequest.getReceptionFileRequestList().size() >0){
            List<ProjectReceptionFile> projectReceptionVisitList = Lists.newArrayList();
            receptionRequest.getReceptionFileRequestList().forEach(receptionFileRequest -> {
                ProjectReceptionFile projectReceptionFile = new ProjectReceptionFile();
                projectReceptionFile.setFileName(receptionFileRequest.getFileName());
                projectReceptionFile.setFilePath(receptionFileRequest.getFilePath());
                projectReceptionVisitList.add(projectReceptionFile);
            });
            projectReception.setProjectReceptionFileList(projectReceptionVisitList);
        }
        projectReceptionService.saveDetails(projectReception);
        return ResultMessage.success(projectReception);
    }

    /**
     * 分页查询接待信息
     * @param pageNo
     * @param pageSize
     * @return
     */
    @GetMapping(value = "queryReceptionPage")
    @ApiOperation(value = "分页查询接待信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNo", value = "当前页数", required = true, dataType = "int", paramType = "query"),
            @ApiImplicitParam(name = "pageSize", value = "数据条数", required = true, dataType = "int", paramType = "query"),
    })
    public ResultMessage queryReceptionPage(Integer pageNo, Integer pageSize){
        ProjectReception projectReception = new ProjectReception();
        projectReception.setPageNo(pageNo);
        projectReception.setPageSize(pageSize);
        PageInfo<ProjectReception> projectReceptionPageInfo = projectReceptionService.findPage(projectReception);
        if (projectReceptionPageInfo != null && projectReceptionPageInfo.getList() != null && projectReceptionPageInfo.getList().size() > 0){
            for (ProjectReception reception : projectReceptionPageInfo.getList()) {
                reception.setProjectInfo(projectInfoService.get(reception.getProjectId()));
            }
        }
        return ResultMessage.success(projectReceptionPageInfo);
    }

    /**
     * 查询接待详情
     * @param projectId
     * @return
     */
    @GetMapping(value = "queryReception")
    @ApiOperation(value = "查询接待详情")
    @ApiImplicitParam(name = "projectId", value = "项目编码", required = true, dataType = "string", paramType = "query")
    @Login
    public ResultMessage queryReception(String projectId){
        if (StringUtils.isBlank(projectId)){
            return ResultMessage.fail("参数为空");
        }
        ProjectReception projectReception = new ProjectReception();
        projectReception.setProjectId(projectId);
        List<ProjectReception> projectReceptionList = projectReceptionService.findList(projectReception);
        if (projectReceptionList != null && projectReceptionList.size() > 0){
            projectReception = projectReceptionList.get(0);
            // 查询详情
            projectReception = projectReceptionService.findDetails(projectReception);
        }
        return ResultMessage.success(projectReception);
    }
    /**
     *
     * @param industriallRequest
     * @return 保存工商信息
     */
    @PostMapping(value = "addIndustriall")
    @ApiOperation(value = "保存工商信息")
    @Login
    public ResultMessage addIndustriall(IndustriallRequest industriallRequest){
        industrialRegisterService.saveIndustrail(industriallRequest);
        return ResultMessage.success("保存工商信息成功");
    }


    /**
     *
     * @param industriallRequest
     * @return 修改工商信息
     */
    @PostMapping(value = "updIndustriall")
    @ApiOperation(value = "修改工商信息")
    @ApiImplicitParam(name = "projectId", value = "项目编码", required = true, dataType = "string", paramType = "query")
    @Login
    public ResultMessage updIndustriall(IndustriallRequest industriallRequest){
        industrialRegisterService.updIndustriall(industriallRequest);
        return ResultMessage.success("修改工商信息成功");
    }

    /**
     *
     * @param projectId
     * @return 查询工商信息
     */
    @GetMapping(value = "selIndustrialByProjectId")
    @ApiOperation(value = "查询工商信息")
    @ApiImplicitParam(name = "projectId", value = "项目编码", required = true, dataType = "string", paramType = "query")
    @Login
    public ResultMessage selIndustrialByProjectId(String projectId){
        IndustriallRequest industriallRequest = new IndustriallRequest();
        industriallRequest.setProjectId(projectId);
        return ResultMessage.success(industrialRegisterService.selIndustrialByProjectId(industriallRequest));
    }

    /**
     *
     * @param industriallRequest
     * @return 查询工商信息
     */
    @GetMapping(value = "deleteIndustrial")
    @ApiOperation(value = "查询工商信息")
    @ApiImplicitParam(name = "projectId", value = "项目编码", required = true, dataType = "string", paramType = "query")
    @Login
    public ResultMessage deleteIndustrial(IndustriallRequest industriallRequest){
        industrialRegisterService.deleteIndustriall(industriallRequest);
        return ResultMessage.success("查询工商信息成功");
    }


    /**
     *新增/开工投产
     * @param
     * @return
     */
    @PostMapping(value = "saveStartProduct")
    @ApiOperation(value = "新增/开工投产")
    @Login
    public ResultMessage addStartProduct(@RequestBody StartProduct startProduct){
        startProductService.save(startProduct);
        return ResultMessage.success("新增开工投产成功");
    }

    /**
     *删除开工投产
     * @param
     * @return
     */
    @PostMapping(value = "deleteStartProduct")
    @ApiOperation(value = "删除开工投产")
    @Login
    public ResultMessage updStartProduct(@RequestBody StartProduct startProduct){
        startProductService.delete(startProduct);
        return ResultMessage.success("删除开工投产成功");
    }

    /**
     * 查询开工投产信息
     * @param projectId
     * @return
     */
    @GetMapping(value = "queryStartProduct")
    @ApiOperation(value = "查询开工投产信息")
    @ApiImplicitParam(name = "projectId", value = "项目编码", required = true, dataType = "string", paramType = "query")
    @Login
    public ResultMessage queryStartProduct(String projectId){
        StartProduct startProduct = new StartProduct();
        startProduct.setProductId(projectId);
        List<StartProduct> startProductList = startProductService.findList(startProduct);
        return ResultMessage.success(startProductList);
    }

    /**
     * 新增/修改项目合同信息
     * @param contractRequest
     * @return
     */
    @PostMapping(value = "addContract")
    @ApiOperation(value = "新增/修改项目合同信息")
    @Login
    public ResultMessage addContract(@RequestBody ContractRequest contractRequest){
        if (contractRequest == null || StringUtils.isBlank(contractRequest.getStatus()) || StringUtils.isBlank(contractRequest.getProjectId())){
            return ResultMessage.fail("参数为空");
        }
        ProjectContract projectContract = new ProjectContract();
        if (StringUtils.isNotBlank(contractRequest.getContractId())){
            projectContract = projectContractService.get(contractRequest.getContractId());
        }
        projectContract.setProjectId(contractRequest.getProjectId());
        projectContract.setStatus(contractRequest.getStatus());
        projectContract.setMeetingCode(contractRequest.getMeetingCode());
        projectContract.setMeetingCodeTwo(contractRequest.getMeetingCodeTwo());
        projectContract.setContractItems(contractRequest.getContractItems());
        projectContract.setSignFlag(contractRequest.getSignFlag());
        projectContract.setLegFlag(contractRequest.getLegFlag());
        projectContract.setMeetingFlag(contractRequest.getMeetingFlag());
        projectContract.setMeetingTwoFlag(contractRequest.getMeetingTwoFlag());
        if (contractRequest.getContractDetailsRequestList() != null && contractRequest.getContractDetailsRequestList().size() > 0){
            List<ProjectContractDetails> projectContractDetailsList = Lists.newArrayList();
            for (ContractDetailsRequest contractDetailsRequest : contractRequest.getContractDetailsRequestList()) {
                ProjectContractDetails projectContractDetails = new ProjectContractDetails();
                projectContractDetails.setFileName(contractDetailsRequest.getFileName());
                projectContractDetails.setFilePath(contractDetailsRequest.getFilePath());
                projectContractDetails.setContractItems(contractDetailsRequest.getContractItems());
                projectContractDetails.setProjectId(contractRequest.getProjectId());
                projectContractDetailsList.add(projectContractDetails);
            }
            projectContract.setProjectContractDetailsList(projectContractDetailsList);
        }
        projectContractService.saveDetails(projectContract);
        return ResultMessage.success(projectContract);
    }

    /**
     * 查询项目合同详情
     * @param projectId
     * @return
     */
    @GetMapping(value = "queryContractDetails")
    @ApiOperation(value = "查询项目合同详情")
    @Login
    public ResultMessage queryContractDetails(String projectId){
        ProjectContract projectContract = new ProjectContract();
        projectContract.setProjectId(projectId);
        List<ProjectContract> projectContractList = projectContractService.findList(projectContract);
        if (projectContractList != null && projectContractList.size() > 0){
            projectContract = projectContractService.findDetails(projectContractList.get(0));
        }
        return ResultMessage.success(projectContract);
    }

    /**
     * 批量转办项目
     * @param transferRequest
     * @return
     */
    @PostMapping(value = "addTransferBatch")
    @ApiOperation(value = "批量转办项目")
    @Login
    public ResultMessage addTransferBatch(@RequestBody TransferRequest transferRequest){
        if (transferRequest == null || transferRequest.getTransferDetailsRequestList() == null || transferRequest.getTransferDetailsRequestList().size() == 0){
            return ResultMessage.fail("参数为空");
        }
        List<ProjectTransfer> projectTransferList = Lists.newArrayList();
        for (TransferDetailsRequest transferDetailsRequest : transferRequest.getTransferDetailsRequestList()) {
            ProjectTransfer projectTransfer = new ProjectTransfer();
            projectTransfer.setProjectId(transferDetailsRequest.getProjectId());
            projectTransfer.setProjectName(transferDetailsRequest.getProjectName());
            projectTransfer.setFromCreateBy(transferDetailsRequest.getFromCreateBy());
            projectTransfer.setFromCreateName(transferDetailsRequest.getFromCreateName());
            projectTransfer.setFromGroupId(transferDetailsRequest.getFromGroupId());
            projectTransfer.setDealDate(transferDetailsRequest.getDealDate());
            projectTransfer.setToCreateBy(transferDetailsRequest.getToCreateBy());
            projectTransfer.setToCreateName(transferDetailsRequest.getToCreateName());
            projectTransfer.setToGroupId(transferDetailsRequest.getToGroupId());
            projectTransferList.add(projectTransfer);
        }
        projectTransferService.saveBatch(projectTransferList);
        return ResultMessage.success("操作成功");
    }

    /**
     * 新增/修改政策兑现
     * @param exchangeRequest
     * @return
     */
    @PostMapping(value = "addExchangeBatch")
    @ApiOperation(value = "新增/修改政策兑现")
    @Login
    public ResultMessage addExchangeBatch(@RequestBody ExchangeRequest exchangeRequest){
        if (exchangeRequest == null || exchangeRequest.getExchangeDetailsRequestList() == null || exchangeRequest.getExchangeDetailsRequestList().size() == 0){
            return ResultMessage.fail("参数为空");
        }

        List<ProjectExchange> projectExchangeList = Lists.newArrayList();
        StringBuffer projectId = new StringBuffer();
        for (ExchangeDetailsRequest exchangeDetailsRequest : exchangeRequest.getExchangeDetailsRequestList()) {
            ProjectExchange projectExchange = new ProjectExchange();
            if (StringUtils.isBlank(projectId.toString())){
                projectId.append(exchangeDetailsRequest.getProjectId());
            }
            projectExchange.setProjectId(exchangeDetailsRequest.getProjectId());
            projectExchange.setContractCode(exchangeDetailsRequest.getContractCode());
            projectExchange.setContractItems(exchangeDetailsRequest.getContractItems());
            projectExchange.setPreExchangeFlag(exchangeDetailsRequest.getPreExchangeFlag());
            projectExchange.setExchangedFlag(exchangeDetailsRequest.getExchangedFlag());
            projectExchange.setExchangeItems(exchangeDetailsRequest.getExchangeItems());
            projectExchange.setExchangeDate(exchangeDetailsRequest.getExchangeDate());
            projectExchange.setExchangeUserId(exchangeDetailsRequest.getExchangeUserId());
            projectExchange.setExchangeUserName(exchangeDetailsRequest.getExchangeUserName());
            projectExchangeList.add(projectExchange);
        }
        projectExchangeService.saveBatch(projectExchangeList, projectId.toString());
        return ResultMessage.success();
    }

    /**
     * 删除政策兑现
     * @param exchangeDetailsRequest
     * @return
     */
    @PostMapping(value = "removeExchange")
    @ApiOperation(value = "删除政策兑现")
    @Login
    public ResultMessage removeExchange(@RequestBody ExchangeDetailsRequest exchangeDetailsRequest){
        if (exchangeDetailsRequest == null || StringUtils.isBlank(exchangeDetailsRequest.getExchangeId())){
            return ResultMessage.fail("参数为空");
        }

        projectExchangeService.delete(exchangeDetailsRequest.getExchangeId());
        return ResultMessage.success("删除成功");
    }

    /**
     * 查询政策兑现
     * @param projectId
     * @return
     */
    @GetMapping(value = "queryExchangeList")
    @ApiOperation(value = "查询政策兑现")
    @ApiImplicitParam(name = "projectId", value = "项目编码", required = true, dataType = "string", paramType = "query")
    public ResultMessage queryExchangeList(String projectId){
        if (StringUtils.isBlank(projectId)){
            return ResultMessage.fail("参数为空");
        }
        ProjectExchange projectExchange = new ProjectExchange();
        projectExchange.setProjectId(projectId);
        List<ProjectExchange> projectExchangeList = projectExchangeService.findList(projectExchange);
        return ResultMessage.success(projectExchangeList);
    }

}
