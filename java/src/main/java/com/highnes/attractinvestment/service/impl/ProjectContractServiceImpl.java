package com.highnes.attractinvestment.service.impl;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.entity.ProjectContractDetails;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectContract;
import com.highnes.attractinvestment.mapper.ProjectContractMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目合同信息Service接口
 *
 * @author fuly
 * @date 2020-05-25
 */
@Service
public class ProjectContractServiceImpl extends BaseService<ProjectContractMapper, ProjectContract> {

    @Autowired
    private ProjectContractDetailsServiceImpl projectContractDetailsService;

    /**
     * 根据ID获取信息
     *
     * @param id
     * @return
     */
    @Override
    public ProjectContract get(String id) {
        return super.get(id);
    }


    /**
     * 查询列表
     *
     * @param projectContract
     * @return
     */
    @Override
    public List<ProjectContract> findList(ProjectContract projectContract) {
        return super.findList(projectContract);
    }

    /**
     * 分页查询
     *
     * @param projectContract
     * @return
     */
    @Override
    public PageInfo<ProjectContract> findPage(ProjectContract projectContract) {
        return super.findPage(projectContract);
    }

    /**
     * 保存
     *
     * @param projectContract
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectContract projectContract) {
        super.save(projectContract);
    }

    /**
     * 保存
     * @param projectContract
     */
    @Transactional(readOnly = false)
    public void saveDetails(ProjectContract projectContract){
        // 删除合同
        deleteByProject(projectContract.getProjectId());
        super.save(projectContract);
        if (projectContract.getProjectContractDetailsList() != null && projectContract.getProjectContractDetailsList().size() > 0){
            for (ProjectContractDetails projectContractDetails : projectContract.getProjectContractDetailsList()) {
                projectContractDetails.setProjectId(projectContract.getProjectId());
                projectContractDetails.setContractId(projectContract.getId());
                projectContractDetailsService.save(projectContractDetails);
            }
        }
    }

    /**
     * 查询详情
     * @param projectContract
     * @return
     */
    public ProjectContract findDetails(ProjectContract projectContract){
        ProjectContractDetails projectContractDetails = new ProjectContractDetails();
        projectContractDetails.setContractId(projectContract.getId());
        projectContractDetails.setProjectId(projectContract.getProjectId());
        projectContract.setProjectContractDetailsList(projectContractDetailsService.findList(projectContractDetails));
        return projectContract;
    }

    /**
     * 删除
     *
     * @param projectContract
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectContract projectContract) {
        super.delete(projectContract);
        // 删除详情
        projectContractDetailsService.deleteByProject(projectContract.getProjectId());
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
            delete(new ProjectContract(s));
        }
        return arr.length;
    }

    /**
     * 删除
     * @param projectId
     */
    @Transactional(readOnly = false)
    public void deleteByProject(String projectId){
        ProjectContract projectContract = new ProjectContract();
        projectContract.setProjectId(projectId);
        mapper.deleteByProject(projectContract);
        // 删除详情
        projectContractDetailsService.deleteByProject(projectId);
    }
}
