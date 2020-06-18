package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectInfo;
import com.highnes.attractinvestment.mapper.ProjectInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目信息Service接口
 * 
 * @author fluy:
 * @date 2020-05-15
 */
@Service
public class ProjectInfoServiceImpl extends BaseService<ProjectInfoMapper, ProjectInfo> {

    @Autowired
    private ProjectAreaDetailsServiceImpl projectAreaDetailsService;
    @Autowired
    private ProjectCompanyDetailsServiceImpl projectCompanyDetailsService;
    @Autowired
    private ProjectProspectusDetailsServiceImpl projectProspectusDetailsService;

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectInfo get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectInfo
     * @return
     */
    @Override
    public List<ProjectInfo> findList(ProjectInfo projectInfo){
        return super.findList(projectInfo);
    }

    /**
     * 分页查询
     * @param projectInfo
     * @return
     */
    @Override
    public PageInfo<ProjectInfo> findPage(ProjectInfo projectInfo){
        return super.findPage(projectInfo);
    }

    /**
     * 保存
     * @param projectInfo
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectInfo projectInfo){
        System.out.println("projectInfoid:=>"+projectInfo.getId());
        super.save(projectInfo);
    }

    /**
     * 删除
     * @param projectInfo
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectInfo projectInfo){
        super.delete(projectInfo);
    }

    /**
    * 批量删除
    * @param ids
    * @return
    */
    @Transactional(readOnly = false)
    public int delete(String ids){
        String [] arr = ids.split(",");
        for (String s: arr){
            delete(new ProjectInfo(s));
        }
        return arr.length;
    }

    /**
     * 保存项目详情
     * @param projectInfo
     */
    @Transactional(readOnly = false)
    public void saveDetails(ProjectInfo projectInfo){
        // 1. 保存项目信息
        save(projectInfo);

        // 2. 删除项目存在的空间需求、参与单位、计划书
        projectAreaDetailsService.deleteByProject(projectInfo.getId());
        projectCompanyDetailsService.deleteByProject(projectInfo.getId());
        projectProspectusDetailsService.deleteByProject(projectInfo.getId());

        // 3. 保存空间需求
        if (projectInfo.getProjectAreaDetailsList() != null && projectInfo.getProjectAreaDetailsList().size() > 0){
            projectInfo.getProjectAreaDetailsList().forEach(projectAreaDetails -> {
                projectAreaDetails.setProjectId(projectInfo.getId());
                projectAreaDetailsService.save(projectAreaDetails);
            });
        }

        // 4. 参与单位
        if (projectInfo.getProjectCompanyDetailsList() != null && projectInfo.getProjectCompanyDetailsList().size() > 0){
            projectInfo.getProjectCompanyDetailsList().forEach(projectCompanyDetails -> {
                projectCompanyDetails.setProjectId(projectInfo.getId());
                projectCompanyDetailsService.save(projectCompanyDetails);
            });
        }

        // 5. 计划书
        if (projectInfo.getProjectProspectusDetailsList() != null && projectInfo.getProjectProspectusDetailsList().size() > 0){
            projectInfo.getProjectProspectusDetailsList().forEach(projectProspectusDetails -> {
                projectProspectusDetails.setProjectId(projectInfo.getId());
                projectProspectusDetailsService.save(projectProspectusDetails);
            });
        }
    }
}