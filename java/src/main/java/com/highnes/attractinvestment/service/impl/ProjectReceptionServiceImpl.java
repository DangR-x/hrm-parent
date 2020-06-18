package com.highnes.attractinvestment.service.impl;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.common.utils.StringUtils;
import com.highnes.attractinvestment.entity.ProjectReceptionDetails;
import com.highnes.attractinvestment.entity.ProjectReceptionFile;
import com.highnes.attractinvestment.entity.ProjectReceptionVisit;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectReception;
import com.highnes.attractinvestment.mapper.ProjectReceptionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目-接待信息Service接口
 *
 * @author fuly
 * @date 2020-05-21
 */
@Service
public class ProjectReceptionServiceImpl extends BaseService<ProjectReceptionMapper, ProjectReception> {

    @Autowired
    private ProjectReceptionVisitServiceImpl projectReceptionVisitService;
    @Autowired
    private ProjectReceptionDetailsServiceImpl projectReceptionDetailsService;
    @Autowired
    private ProjectReceptionFileServiceImpl projectReceptionFileService;

    /**
     * 根据ID获取信息
     *
     * @param id
     * @return
     */
    @Override
    public ProjectReception get(String id) {
        return super.get(id);
    }


    /**
     * 查询列表
     *
     * @param projectReception
     * @return
     */
    @Override
    public List<ProjectReception> findList(ProjectReception projectReception) {
        return super.findList(projectReception);
    }

    /**
     * 分页查询
     *
     * @param projectReception
     * @return
     */
    @Override
    public PageInfo<ProjectReception> findPage(ProjectReception projectReception) {
        return super.findPage(projectReception);
    }

    /**
     * 保存
     *
     * @param projectReception
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectReception projectReception) {
        super.save(projectReception);
    }

    /**
     * 保存详情
     * @param projectReception
     */
    @Transactional(readOnly = false)
    public void saveDetails(ProjectReception projectReception){
        // 删除子集
        deleteDetails(projectReception.getId());
        // 保存接待信息
        save(projectReception);
        // 保存详细信息
        if (projectReception.getProjectReceptionVisitList() != null && projectReception.getProjectReceptionVisitList().size() >0){
            projectReception.getProjectReceptionVisitList().forEach(projectReceptionVisit -> {
                projectReceptionVisit.setReceptionId(projectReception.getId());
                projectReceptionVisitService.save(projectReceptionVisit);
            });
        }
        if (projectReception.getProjectReceptionDetailsList() != null && projectReception.getProjectReceptionDetailsList().size() >0){
            projectReception.getProjectReceptionDetailsList().forEach(projectReceptionDetails -> {
                projectReceptionDetails.setReceptionId(projectReception.getId());
                projectReceptionDetailsService.save(projectReceptionDetails);
            });
        }
        if (projectReception.getProjectReceptionFileList() != null && projectReception.getProjectReceptionFileList().size() >0){
            projectReception.getProjectReceptionFileList().forEach(projectReceptionFile -> {
                projectReceptionFile.setReceptionId(projectReception.getId());
                projectReceptionFileService.save(projectReceptionFile);
            });
        }
    }

    /**
     * 查询详情
     * @param projectReception
     * @return
     */
    public ProjectReception findDetails(ProjectReception projectReception){
        // 到访人员
        ProjectReceptionVisit projectReceptionVisit = new ProjectReceptionVisit();
        projectReceptionVisit.setReceptionId(projectReception.getId());
        projectReception.setProjectReceptionVisitList(projectReceptionVisitService.findList(projectReceptionVisit));

        // 陪同人员
        ProjectReceptionDetails projectReceptionDetails = new ProjectReceptionDetails();
        projectReceptionDetails.setReceptionId(projectReception.getId());
        projectReception.setProjectReceptionDetailsList(projectReceptionDetailsService.findList(projectReceptionDetails));

        // 接待方案
        ProjectReceptionFile projectReceptionFile = new ProjectReceptionFile();
        projectReceptionFile.setReceptionId(projectReception.getId());
        projectReception.setProjectReceptionFileList(projectReceptionFileService.findList(projectReceptionFile));
        return projectReception;
    }

    /**
     * 删除
     *
     * @param projectReception
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectReception projectReception) {
        super.delete(projectReception);
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @Transactional(readOnly = false)
    public int delete(String ids) {
        String[] arr = ids.split(",");
        for (String s : arr) {
            delete(new ProjectReception(s));
        }
        return arr.length;
    }

    /**
     * 删除接待详情
     * @param receptionId
     */
    @Transactional(readOnly = false)
    public void deleteDetails(String receptionId){
        if (StringUtils.isNotBlank(receptionId)){
            projectReceptionVisitService.deleteByReception(receptionId);
            projectReceptionDetailsService.deleteByReception(receptionId);
            projectReceptionFileService.deleteByReception(receptionId);
        }
    }

    /**
     * 删除
     * @param projectReception
     */
    @Transactional(readOnly = false)
    public void deleteByProject(ProjectReception projectReception){
        mapper.deleteByProject(projectReception);
        // 删除详情
        deleteDetails(projectReception.getId());
    }

}
