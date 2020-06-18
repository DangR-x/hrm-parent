package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectExchange;
import com.highnes.attractinvestment.mapper.ProjectExchangeMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目-政策兑现Service接口
 * 
 * @author fuly
 * @date 2020-06-04
 */
@Service
public class ProjectExchangeServiceImpl extends BaseService<ProjectExchangeMapper, ProjectExchange> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectExchange get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectExchange
     * @return
     */
    @Override
    public List<ProjectExchange> findList(ProjectExchange projectExchange){
        return super.findList(projectExchange);
    }

    /**
     * 分页查询
     * @param projectExchange
     * @return
     */
    @Override
    public PageInfo<ProjectExchange> findPage(ProjectExchange projectExchange){
        return super.findPage(projectExchange);
    }

    /**
     * 保存
     * @param projectExchange
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectExchange projectExchange){
        super.save(projectExchange);
    }

    /**
     * 批量保存
     * @param projectExchangeList
     * @param projectId
     */
    @Transactional(readOnly = false)
    public void saveBatch(List<ProjectExchange> projectExchangeList, String projectId){
        if (projectExchangeList != null && projectExchangeList.size() > 0){
            deleteByProject(projectId);
            for (ProjectExchange projectExchange : projectExchangeList) {
                super.save(projectExchange);
            }
        }
    }

    /**
     * 删除
     * @param projectExchange
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectExchange projectExchange){
        super.delete(projectExchange);
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
            delete(new ProjectExchange(s));
        }
        return arr.length;
    }

    /**
     * 删除
     * @param projectId
     */
    @Transactional(readOnly = false)
    public void deleteByProject(String projectId){
        ProjectExchange projectExchange = new ProjectExchange();
        projectExchange.setProjectId(projectId);
        mapper.deleteByProject(projectExchange);
    }
}
