package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectCompanyInfo;
import com.highnes.attractinvestment.mapper.ProjectCompanyInfoMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目-公司信息Service接口
 * 
 * @author fluy
 * @date 2020-05-19
 */
@Service
public class ProjectCompanyInfoServiceImpl extends BaseService<ProjectCompanyInfoMapper, ProjectCompanyInfo> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectCompanyInfo get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectCompanyInfo
     * @return
     */
    @Override
    public List<ProjectCompanyInfo> findList(ProjectCompanyInfo projectCompanyInfo){
        return super.findList(projectCompanyInfo);
    }

    /**
     * 分页查询
     * @param projectCompanyInfo
     * @return
     */
    @Override
    public PageInfo<ProjectCompanyInfo> findPage(ProjectCompanyInfo projectCompanyInfo){
        return super.findPage(projectCompanyInfo);
    }

    /**
     * 保存
     * @param projectCompanyInfo
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectCompanyInfo projectCompanyInfo){
        super.save(projectCompanyInfo);
    }

    /**
     * 删除
     * @param projectCompanyInfo
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectCompanyInfo projectCompanyInfo){
        super.delete(projectCompanyInfo);
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
            delete(new ProjectCompanyInfo(s));
        }
        return arr.length;
    }

    /**
     *
     * @param projectCompanyInfoList
     * @param projectId
     */
    @Transactional(readOnly = false)
    public void saveProjectCompany(List<ProjectCompanyInfo> projectCompanyInfoList, String projectId){
        deleteByProject(projectId);
        saveBatch(projectCompanyInfoList);
    }

    /**
     * 批量新增
     * @param projectCompanyInfoList
     */
    @Transactional(readOnly = false)
    public void saveBatch(List<ProjectCompanyInfo> projectCompanyInfoList){
        // 删除之前的信息
        projectCompanyInfoList.forEach(projectCompanyInfo -> {
            save(projectCompanyInfo);
        });
    }

    /**
     * 批量删除
     * @param projectId
     */
    @Transactional(readOnly = false)
    public void deleteByProject(String projectId){
        ProjectCompanyInfo projectCompanyInfo = new ProjectCompanyInfo();
        projectCompanyInfo.setProjectId(projectId);
        mapper.deleteByProject(projectCompanyInfo);
    }
}
