package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.entity.ProjectCompanyDetails;
import com.highnes.attractinvestment.mapper.ProjectCompanyDetailsMapper;
import com.highnes.attractinvestment.service.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 主要参与单位Service接口
 * 
 * @author fluy
 * @date 2020-05-15
 */
@Service
public class ProjectCompanyDetailsServiceImpl extends BaseService<ProjectCompanyDetailsMapper, ProjectCompanyDetails> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectCompanyDetails get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectCompanyDetails
     * @return
     */
    @Override
    public List<ProjectCompanyDetails> findList(ProjectCompanyDetails projectCompanyDetails){
        return super.findList(projectCompanyDetails);
    }

    /**
     * 分页查询
     * @param projectCompanyDetails
     * @return
     */
    @Override
    public PageInfo<ProjectCompanyDetails> findPage(ProjectCompanyDetails projectCompanyDetails){
        return super.findPage(projectCompanyDetails);
    }

    /**
     * 保存
     * @param projectCompanyDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectCompanyDetails projectCompanyDetails){
        super.save(projectCompanyDetails);
    }

    /**
     * 删除
     * @param projectCompanyDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectCompanyDetails projectCompanyDetails){
        super.delete(projectCompanyDetails);
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
            delete(new ProjectCompanyDetails(s));
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
        ProjectCompanyDetails projectCompanyDetails = new ProjectCompanyDetails();
        projectCompanyDetails.setProjectId(projectId);
        mapper.deleteByProject(projectCompanyDetails);
    }
}
