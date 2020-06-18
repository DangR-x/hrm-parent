package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectReceptionVisit;
import com.highnes.attractinvestment.mapper.ProjectReceptionVisitMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目-接待记录-到访人员Service接口
 * 
 * @author fuly
 * @date 2020-05-21
 */
@Service
public class ProjectReceptionVisitServiceImpl extends BaseService<ProjectReceptionVisitMapper, ProjectReceptionVisit> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectReceptionVisit get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectReceptionVisit
     * @return
     */
    @Override
    public List<ProjectReceptionVisit> findList(ProjectReceptionVisit projectReceptionVisit){
        return super.findList(projectReceptionVisit);
    }

    /**
     * 分页查询
     * @param projectReceptionVisit
     * @return
     */
    @Override
    public PageInfo<ProjectReceptionVisit> findPage(ProjectReceptionVisit projectReceptionVisit){
        return super.findPage(projectReceptionVisit);
    }

    /**
     * 保存
     * @param projectReceptionVisit
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectReceptionVisit projectReceptionVisit){
        super.save(projectReceptionVisit);
    }

    /**
     * 删除
     * @param projectReceptionVisit
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectReceptionVisit projectReceptionVisit){
        super.delete(projectReceptionVisit);
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
            delete(new ProjectReceptionVisit(s));
        }
        return arr.length;
    }

    /**
     * 删除
     * @param receptionId
     */
    @Transactional(readOnly = false)
    public void deleteByReception(String receptionId){
        ProjectReceptionVisit projectReceptionVisit = new ProjectReceptionVisit();
        projectReceptionVisit.setReceptionId(receptionId);
        mapper.deleteByReception(projectReceptionVisit);
    }
}
