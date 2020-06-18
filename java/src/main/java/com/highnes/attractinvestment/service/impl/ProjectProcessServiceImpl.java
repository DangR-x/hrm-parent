package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.common.utils.StringUtils;
import com.highnes.attractinvestment.entity.ProjectProcessDetails;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectProcess;
import com.highnes.attractinvestment.mapper.ProjectProcessMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目审批流程Service接口
 * 
 * @author fuly
 * @date 2020-05-25
 */
@Service
public class ProjectProcessServiceImpl extends BaseService<ProjectProcessMapper, ProjectProcess> {

    @Autowired
    private ProjectProcessDetailsServiceImpl projectProcessDetailsService;

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectProcess get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectProcess
     * @return
     */
    @Override
    public List<ProjectProcess> findList(ProjectProcess projectProcess){
        return super.findList(projectProcess);
    }

    /**
     * 分页查询
     * @param projectProcess
     * @return
     */
    @Override
    public PageInfo<ProjectProcess> findPage(ProjectProcess projectProcess){
        return super.findPage(projectProcess);
    }

    /**
     * 保存
     * @param projectProcess
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectProcess projectProcess){
        super.save(projectProcess);
    }

    /**
     * 保存详情
     * @param projectProcess
     */
    @Transactional(readOnly = false)
    public void saveDetails(ProjectProcess projectProcess){
        super.save(projectProcess);
        if (projectProcess.getProjectProcessDetailsList() != null && projectProcess.getProjectProcessDetailsList().size() > 0){
            for (ProjectProcessDetails projectProcessDetails : projectProcess.getProjectProcessDetailsList()) {
                projectProcessDetails.setProcessId(projectProcess.getId());
                projectProcessDetailsService.save(projectProcessDetails);
            }
        }
    }

    /**
     * 查询详情
     * @param projectProcess
     * @return
     */
    public ProjectProcess findDetails(ProjectProcess projectProcess){
        if (projectProcess == null || StringUtils.isBlank(projectProcess.getId())){
            return projectProcess;
        }
        ProjectProcessDetails projectProcessDetails = new ProjectProcessDetails();
        projectProcessDetails.setProcessId(projectProcess.getId());
        projectProcess.setProjectProcessDetailsList(projectProcessDetailsService.findList(projectProcessDetails));
        return projectProcess;
    }

    /**
     * 删除
     * @param projectProcess
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectProcess projectProcess){
        super.delete(projectProcess);
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
            delete(new ProjectProcess(s));
        }
        return arr.length;
    }
}
