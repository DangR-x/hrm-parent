package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectProcessDetails;
import com.highnes.attractinvestment.mapper.ProjectProcessDetailsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目审批详情Service接口
 * 
 * @author fuly
 * @date 2020-05-25
 */
@Service
public class ProjectProcessDetailsServiceImpl extends BaseService<ProjectProcessDetailsMapper, ProjectProcessDetails> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectProcessDetails get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectProcessDetails
     * @return
     */
    @Override
    public List<ProjectProcessDetails> findList(ProjectProcessDetails projectProcessDetails){
        return super.findList(projectProcessDetails);
    }

    /**
     * 分页查询
     * @param projectProcessDetails
     * @return
     */
    @Override
    public PageInfo<ProjectProcessDetails> findPage(ProjectProcessDetails projectProcessDetails){
        return super.findPage(projectProcessDetails);
    }

    /**
     * 保存
     * @param projectProcessDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectProcessDetails projectProcessDetails){
        super.save(projectProcessDetails);
    }

    /**
     * 删除
     * @param projectProcessDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectProcessDetails projectProcessDetails){
        super.delete(projectProcessDetails);
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
            delete(new ProjectProcessDetails(s));
        }
        return arr.length;
    }
}
