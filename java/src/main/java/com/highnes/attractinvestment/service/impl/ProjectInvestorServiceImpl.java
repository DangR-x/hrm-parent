package com.highnes.attractinvestment.service.impl;

import com.highnes.attractinvestment.entity.ProjectInvestor;
import com.highnes.attractinvestment.mapper.ProjectCompanyInfoMapper;
import com.highnes.attractinvestment.mapper.ProjectInvestorMapper;
import com.highnes.attractinvestment.service.IProjectInvestorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * @author Rain
 * @date 2020/6/17
 * @description
 */
@Service
public class ProjectInvestorServiceImpl  implements IProjectInvestorService {

    @Autowired
    private ProjectInvestorMapper projectInvestorMapper;

    @Override
    public ProjectInvestor selectById(Serializable id) {
        return projectInvestorMapper.selectById(id);
    }

    @Override
    public List<ProjectInvestor> selectAll() {
        return projectInvestorMapper.selectAll();
    }

    @Override
    public List<ProjectInvestor> selectByProjectId(String projectId) {
        return projectInvestorMapper.selectByProjectId(projectId);
    }

    @Override
    public void insert(ProjectInvestor projectInvestor) {
        projectInvestorMapper.insert(projectInvestor);
    }

    /**
     *  批量添加投资人
     * @param projectInvestors
     * @param projectId
     */
    @Override
    public void insertList(List<ProjectInvestor> projectInvestors,String projectId) {
        for (ProjectInvestor projectInvestor : projectInvestors) {
            if(projectInvestor.getId()!=null && projectInvestor.getId()>0){
                updateById(projectInvestor);
            }else {
                projectInvestor.setProjectId(projectId);
                insert(projectInvestor);
            }

        }
    }

    @Override
    public void deleteById(Serializable id) {
        projectInvestorMapper.deleteById(id);
    }

    @Override
    public void updateById(ProjectInvestor projectInvestor) {
        projectInvestorMapper.updateById(projectInvestor);
    }
}
