package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectReceptionDetails;
import com.highnes.attractinvestment.mapper.ProjectReceptionDetailsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目-接待-陪同人员Service接口
 * 
 * @author fuly
 * @date 2020-05-21
 */
@Service
public class ProjectReceptionDetailsServiceImpl extends BaseService<ProjectReceptionDetailsMapper, ProjectReceptionDetails> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectReceptionDetails get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectReceptionDetails
     * @return
     */
    @Override
    public List<ProjectReceptionDetails> findList(ProjectReceptionDetails projectReceptionDetails){
        return super.findList(projectReceptionDetails);
    }

    /**
     * 分页查询
     * @param projectReceptionDetails
     * @return
     */
    @Override
    public PageInfo<ProjectReceptionDetails> findPage(ProjectReceptionDetails projectReceptionDetails){
        return super.findPage(projectReceptionDetails);
    }

    /**
     * 保存
     * @param projectReceptionDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectReceptionDetails projectReceptionDetails){
        super.save(projectReceptionDetails);
    }

    /**
     * 删除
     * @param projectReceptionDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectReceptionDetails projectReceptionDetails){
        super.delete(projectReceptionDetails);
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
            delete(new ProjectReceptionDetails(s));
        }
        return arr.length;
    }

    /**
     * 删除
     * @param receptionId
     */
    @Transactional(readOnly = false)
    public void deleteByReception(String receptionId){
        ProjectReceptionDetails projectReceptionDetails = new ProjectReceptionDetails();
        projectReceptionDetails.setReceptionId(receptionId);
        mapper.deleteByReception(projectReceptionDetails);
    }
}
