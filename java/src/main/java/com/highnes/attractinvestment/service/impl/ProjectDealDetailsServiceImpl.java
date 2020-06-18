package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectDealDetails;
import com.highnes.attractinvestment.mapper.ProjectDealDetailsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目进展维护Service接口
 * 
 * @author fuly
 * @date 2020-05-19
 */
@Service
public class ProjectDealDetailsServiceImpl extends BaseService<ProjectDealDetailsMapper, ProjectDealDetails> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectDealDetails get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectDealDetails
     * @return
     */
    @Override
    public List<ProjectDealDetails> findList(ProjectDealDetails projectDealDetails){
        return super.findList(projectDealDetails);
    }

    /**
     * 分页查询
     * @param projectDealDetails
     * @return
     */
    @Override
    public PageInfo<ProjectDealDetails> findPage(ProjectDealDetails projectDealDetails){
        return super.findPage(projectDealDetails);
    }

    /**
     * 保存
     * @param projectDealDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectDealDetails projectDealDetails){
        super.save(projectDealDetails);
    }

    /**
     * 删除
     * @param projectDealDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectDealDetails projectDealDetails){
        super.delete(projectDealDetails);
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
            delete(new ProjectDealDetails(s));
        }
        return arr.length;
    }

    /**
     * 删除
     * @param projectId
     */
    @Transactional(readOnly = false)
    public void deleteByProject(String projectId){
        ProjectDealDetails projectDealDetails = new ProjectDealDetails();
        projectDealDetails.setProjectId(projectId);
        mapper.deleteByProject(projectDealDetails);
    }
}
