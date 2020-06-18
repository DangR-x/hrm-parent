package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.entity.ProjectInvestigateDetails;
import com.highnes.attractinvestment.entity.ProjectInvestigateFile;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectInvestigate;
import com.highnes.attractinvestment.mapper.ProjectInvestigateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目-考察信息Service接口
 * 
 * @author fuly
 * @date 2020-05-20
 */
@Service
public class ProjectInvestigateServiceImpl extends BaseService<ProjectInvestigateMapper, ProjectInvestigate> {

    @Autowired
    private ProjectInvestigateDetailsServiceImpl projectInvestigateDetailsService;
    @Autowired
    private ProjectInvestigateFileServiceImpl projectInvestigateFileService;

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectInvestigate get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectInvestigate
     * @return
     */
    @Override
    public List<ProjectInvestigate> findList(ProjectInvestigate projectInvestigate){
        return super.findList(projectInvestigate);
    }

    /**
     * 查询详情
     * @param projectInvestigate
     * @return
     */
    public ProjectInvestigate findDetails(ProjectInvestigate projectInvestigate){
        // 陪同人员
        ProjectInvestigateDetails projectInvestigateDetails = new ProjectInvestigateDetails();
        projectInvestigateDetails.setInvestigateId(projectInvestigate.getId());
        projectInvestigate.setProjectInvestigateDetailsList(projectInvestigateDetailsService.findList(projectInvestigateDetails));
        // 考察方案
        ProjectInvestigateFile projectInvestigateFile = new ProjectInvestigateFile();
        projectInvestigateFile.setInvestigateId(projectInvestigate.getId());
        projectInvestigate.setProjectInvestigateFileList(projectInvestigateFileService.findList(projectInvestigateFile));
        return projectInvestigate;
    }

    /**
     * 分页查询
     * @param projectInvestigate
     * @return
     */
    @Override
    public PageInfo<ProjectInvestigate> findPage(ProjectInvestigate projectInvestigate){
        return super.findPage(projectInvestigate);
    }

    /**
     * 保存
     * @param projectInvestigate
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectInvestigate projectInvestigate){
        super.save(projectInvestigate);
    }

    /**
     * 删除
     * @param projectInvestigate
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectInvestigate projectInvestigate){
        super.delete(projectInvestigate);
    }

    /**
     * 批量保存
     * @param projectInvestigateList
     */
    @Transactional(readOnly = false)
    public void saveBatch(List<ProjectInvestigate> projectInvestigateList){
        if (projectInvestigateList != null && projectInvestigateList.size() > 0){
            for (ProjectInvestigate projectInvestigate : projectInvestigateList) {
                saveDetails(projectInvestigate);
            }
        }
    }

    /**
     * 保存详情
     * @param projectInvestigate
     */
    @Transactional(readOnly = false)
    public void saveDetails(ProjectInvestigate projectInvestigate){
        save(projectInvestigate);
        if (projectInvestigate.getProjectInvestigateDetailsList() != null && projectInvestigate.getProjectInvestigateDetailsList().size() > 0){
            // 删除之前的数据
            projectInvestigateDetailsService.deleteByInvestigate(projectInvestigate.getId());
            for (ProjectInvestigateDetails projectInvestigateDetails : projectInvestigate.getProjectInvestigateDetailsList()) {
                projectInvestigateDetails.setInvestigateId(projectInvestigate.getId());
                projectInvestigateDetailsService.save(projectInvestigateDetails);
            }
        }
        if (projectInvestigate.getProjectInvestigateFileList() != null && projectInvestigate.getProjectInvestigateFileList().size() > 0){
            // 删除
            projectInvestigateFileService.deleteByInvestigate(projectInvestigate.getId());
            for (ProjectInvestigateFile projectInvestigateFile : projectInvestigate.getProjectInvestigateFileList()) {
                projectInvestigateFile.setInvestigateId(projectInvestigate.getId());
                projectInvestigateFileService.save(projectInvestigateFile);
            }
        }
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
            delete(new ProjectInvestigate(s));
        }
        return arr.length;
    }

    @Transactional(readOnly = false)
    public void deleteByProject(String projectId){
        ProjectInvestigate projectInvestigate = new ProjectInvestigate();
        projectInvestigate.setProjectId(projectId);
        mapper.deleteByProject(projectInvestigate);
    }
}
