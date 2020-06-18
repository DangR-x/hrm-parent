package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectAreaDetails;
import com.highnes.attractinvestment.mapper.ProjectAreaDetailsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 空间需求Service接口
 * 
 * @author fluy
 * @date 2020-05-15
 */
@Service
public class ProjectAreaDetailsServiceImpl extends BaseService<ProjectAreaDetailsMapper, ProjectAreaDetails> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectAreaDetails get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectAreaDetails
     * @return
     */
    @Override
    public List<ProjectAreaDetails> findList(ProjectAreaDetails projectAreaDetails){
        return super.findList(projectAreaDetails);
    }

    /**
     * 分页查询
     * @param projectAreaDetails
     * @return
     */
    @Override
    public PageInfo<ProjectAreaDetails> findPage(ProjectAreaDetails projectAreaDetails){
        return super.findPage(projectAreaDetails);
    }

    /**
     * 保存
     * @param projectAreaDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectAreaDetails projectAreaDetails){
        super.save(projectAreaDetails);
    }

    /**
     * 删除
     * @param projectAreaDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectAreaDetails projectAreaDetails){
        super.delete(projectAreaDetails);
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
            delete(new ProjectAreaDetails(s));
        }
        return arr.length;
    }

    /**
     * 根据项目编码删除空间需求
     * @param projectId
     * @return
     */
    @Transactional(readOnly = false)
    public void deleteByProject(String projectId){
        ProjectAreaDetails projectAreaDetails = new ProjectAreaDetails();
        projectAreaDetails.setProjectId(projectId);
        mapper.deleteByProject(projectAreaDetails);
    }
}
