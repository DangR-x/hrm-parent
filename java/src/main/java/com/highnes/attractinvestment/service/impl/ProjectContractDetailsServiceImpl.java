package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectContractDetails;
import com.highnes.attractinvestment.mapper.ProjectContractDetailsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目合同文件Service接口
 * 
 * @author fuly
 * @date 2020-05-25
 */
@Service
public class ProjectContractDetailsServiceImpl extends BaseService<ProjectContractDetailsMapper, ProjectContractDetails> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectContractDetails get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectContractDetails
     * @return
     */
    @Override
    public List<ProjectContractDetails> findList(ProjectContractDetails projectContractDetails){
        return super.findList(projectContractDetails);
    }

    /**
     * 分页查询
     * @param projectContractDetails
     * @return
     */
    @Override
    public PageInfo<ProjectContractDetails> findPage(ProjectContractDetails projectContractDetails){
        return super.findPage(projectContractDetails);
    }

    /**
     * 保存
     * @param projectContractDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectContractDetails projectContractDetails){
        super.save(projectContractDetails);
    }

    /**
     * 删除
     * @param projectContractDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectContractDetails projectContractDetails){
        super.delete(projectContractDetails);
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
            delete(new ProjectContractDetails(s));
        }
        return arr.length;
    }

    /**
     * 删除
     * @param contractId
     */
    @Transactional(readOnly = false)
    public void deleteByContract(String contractId){
        ProjectContractDetails projectContractDetails = new ProjectContractDetails();
        projectContractDetails.setContractId(contractId);
        mapper.deleteByContract(projectContractDetails);
    }

    /**
     * 删除
     * @param projectId
     */
    @Transactional(readOnly = false)
    public void deleteByProject(String projectId) {
        ProjectContractDetails projectContractDetails = new ProjectContractDetails();
        projectContractDetails.setProjectId(projectId);
        mapper.deleteByProject(projectContractDetails);
    }
}
