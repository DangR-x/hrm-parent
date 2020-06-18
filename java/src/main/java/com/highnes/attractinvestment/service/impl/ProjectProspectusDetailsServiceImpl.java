package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectProspectusDetails;
import com.highnes.attractinvestment.mapper.ProjectProspectusDetailsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目计划书Service接口
 * 
 * @author fluy
 * @date 2020-05-15
 */
@Service
public class ProjectProspectusDetailsServiceImpl extends BaseService<ProjectProspectusDetailsMapper, ProjectProspectusDetails> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectProspectusDetails get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectProspectusDetails
     * @return
     */
    @Override
    public List<ProjectProspectusDetails> findList(ProjectProspectusDetails projectProspectusDetails){
        return super.findList(projectProspectusDetails);
    }

    /**
     * 分页查询
     * @param projectProspectusDetails
     * @return
     */
    @Override
    public PageInfo<ProjectProspectusDetails> findPage(ProjectProspectusDetails projectProspectusDetails){
        return super.findPage(projectProspectusDetails);
    }

    /**
     * 保存
     * @param projectProspectusDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectProspectusDetails projectProspectusDetails){
        super.save(projectProspectusDetails);
    }

    /**
     * 删除
     * @param projectProspectusDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectProspectusDetails projectProspectusDetails){
        super.delete(projectProspectusDetails);
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
            delete(new ProjectProspectusDetails(s));
        }
        return arr.length;
    }

    /**
     * 删除
     * @param projectId
     * @return
     */
    @Transactional(readOnly = false)
    public void deleteByProject(String projectId){
        ProjectProspectusDetails projectProspectusDetails = new ProjectProspectusDetails();
        projectProspectusDetails.setProjectId(projectId);
        mapper.deleteByProject(projectProspectusDetails);
    }
}
