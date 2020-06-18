package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectPersonnelResume;
import com.highnes.attractinvestment.mapper.ProjectPersonnelResumeMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目-人才信息-简历Service接口
 * 
 * @author fluy
 * @date 2020-05-19
 */
@Service
public class ProjectPersonnelResumeServiceImpl extends BaseService<ProjectPersonnelResumeMapper, ProjectPersonnelResume> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectPersonnelResume get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectPersonnelResume
     * @return
     */
    @Override
    public List<ProjectPersonnelResume> findList(ProjectPersonnelResume projectPersonnelResume){
        return super.findList(projectPersonnelResume);
    }

    /**
     * 分页查询
     * @param projectPersonnelResume
     * @return
     */
    @Override
    public PageInfo<ProjectPersonnelResume> findPage(ProjectPersonnelResume projectPersonnelResume){
        return super.findPage(projectPersonnelResume);
    }

    /**
     * 保存
     * @param projectPersonnelResume
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectPersonnelResume projectPersonnelResume){
        super.save(projectPersonnelResume);
    }

    /**
     * 删除
     * @param projectPersonnelResume
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectPersonnelResume projectPersonnelResume){
        super.delete(projectPersonnelResume);
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
            delete(new ProjectPersonnelResume(s));
        }
        return arr.length;
    }

    @Transactional(readOnly = false)
    public void deleteByPersonnel(String personnelId){
        ProjectPersonnelResume projectPersonnelResume = new ProjectPersonnelResume();
        projectPersonnelResume.setPersonnelId(personnelId);
        mapper.deleteByPersonnel(projectPersonnelResume);
    }
}
