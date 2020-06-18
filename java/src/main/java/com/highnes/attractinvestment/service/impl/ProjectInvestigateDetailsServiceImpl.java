package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectInvestigateDetails;
import com.highnes.attractinvestment.mapper.ProjectInvestigateDetailsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 考察陪同人员Service接口
 * 
 * @author fuly
 * @date 2020-05-20
 */
@Service
public class ProjectInvestigateDetailsServiceImpl extends BaseService<ProjectInvestigateDetailsMapper, ProjectInvestigateDetails> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectInvestigateDetails get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectInvestigateDetails
     * @return
     */
    @Override
    public List<ProjectInvestigateDetails> findList(ProjectInvestigateDetails projectInvestigateDetails){
        return super.findList(projectInvestigateDetails);
    }

    /**
     * 分页查询
     * @param projectInvestigateDetails
     * @return
     */
    @Override
    public PageInfo<ProjectInvestigateDetails> findPage(ProjectInvestigateDetails projectInvestigateDetails){
        return super.findPage(projectInvestigateDetails);
    }

    /**
     * 保存
     * @param projectInvestigateDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectInvestigateDetails projectInvestigateDetails){
        super.save(projectInvestigateDetails);
    }

    /**
     * 删除
     * @param projectInvestigateDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectInvestigateDetails projectInvestigateDetails){
        super.delete(projectInvestigateDetails);
    }

    /**
     * 批量保存
     * @param projectInvestigateDetailsList
     */
    @Transactional(readOnly = false)
    public void saveBatch(List<ProjectInvestigateDetails> projectInvestigateDetailsList){
        for (ProjectInvestigateDetails projectInvestigateDetails : projectInvestigateDetailsList) {
            save(projectInvestigateDetails);
        }
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
            delete(new ProjectInvestigateDetails(s));
        }
        return arr.length;
    }

    @Transactional(readOnly = false)
    public void deleteByInvestigate(String investigateId){
        ProjectInvestigateDetails projectInvestigateDetails = new ProjectInvestigateDetails();
        projectInvestigateDetails.setInvestigateId(investigateId);
        mapper.deleteByInvestigate(projectInvestigateDetails);
    }
}
