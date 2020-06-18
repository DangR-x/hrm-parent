package com.highnes.attractinvestment.controller;

import com.highnes.attractinvestment.service.IProjectInvestorService;
import com.highnes.attractinvestment.service.impl.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author Rain
 * @date
 * @description
 */
public abstract class BaseController {
    /**
     * 日志
     */
    protected Logger logger = LoggerFactory.getLogger(BaseController.class);
    @Autowired
    protected SysDictDataServiceImpl sysDictDataService;
    /**
     * 数据字典
     */
    @Autowired
    protected SysDictTypeServiceImpl sysDictTypeService;
    /**
     * 知识管理
     */
    @Autowired
    protected KnowledgeManageServiceImpl knowledgeManageService;
    /**
     * 项目
     */
    @Autowired
    protected ProjectInfoServiceImpl projectInfoService;
    @Autowired
    protected ProjectAreaDetailsServiceImpl projectAreaDetailsService;
    @Autowired
    protected ProjectCompanyDetailsServiceImpl projectCompanyDetailsService;
    @Autowired
    protected ProjectProspectusDetailsServiceImpl projectProspectusDetailsService;
    /**
     * 用户管理
     */
    @Autowired
    protected SysUserServiceImpl sysUserService;
    /**
     * 项目-企业信息
     */
    @Autowired
    protected ProjectCompanyInfoServiceImpl projectCompanyInfoService;
    /**
     * 项目-人才信息
     */
    @Autowired
    protected ProjectPersonnelInfoServiceImpl projectPersonnelInfoService;
    @Autowired
    protected ProjectImagesServiceImpl projectImagesService;
    /**
     * 项目进展维护
     */
    @Autowired
    protected ProjectDealDetailsServiceImpl projectDealDetailsService;
    /**
     * 单位管理
     */
    @Autowired
    protected SysDeptServiceImpl sysDeptService;
    /**
     * 项目考察
     */
    @Autowired
    protected ProjectInvestigateServiceImpl projectInvestigateService;

    /**
     * 系统角色
     */
    @Autowired
    protected SysRoleServiceImpl sysRoleService;
    /**
     * 项目接待
     */
    @Autowired
    protected ProjectReceptionServiceImpl projectReceptionService;
    /**
     * 工商信息管理
     */
    @Autowired
    protected IndustrialRegisterServiceImpl industrialRegisterService;

    /**
     * 工商图片管理
     */
    @Autowired
    protected IndustrialImagesServiceImpl industrialImagesService;

    /**
     * 开工投产
     */
    @Autowired
    protected StartProductServiceImpl startProductService;
    /**
     * 审批流程
     */
    @Autowired
    protected ActivityProcessServiceImpl activityProcessService;
    /**
     * 项目合同
     */
    @Autowired
    protected ProjectContractServiceImpl projectContractService;
    /**
     * 项目审批
     */
    @Autowired
    protected ProjectProcessServiceImpl projectProcessService;
    @Autowired
    protected ProjectProcessDetailsServiceImpl projectProcessDetailsService;
    @Autowired
    protected ProjectTransferServiceImpl projectTransferService;
    @Autowired
    protected ProjectExchangeServiceImpl projectExchangeService;

    @Autowired
    protected IProjectInvestorService projectInvestorService;
}
