package com.highnes.attractinvestment.service;

import com.highnes.attractinvestment.entity.ProjectInvestor;
import org.apache.poi.ss.formula.functions.T;

import java.io.Serializable;
import java.util.List;

/**
 * @author Rain
 * @date 2020/6/17
 * @description
 */
public interface IProjectInvestorService {

    ProjectInvestor selectById(Serializable id);

    List<ProjectInvestor> selectAll();

    List<ProjectInvestor> selectByProjectId(String projectId);

    void insert(ProjectInvestor projectInvestor);

    void insertList(List<ProjectInvestor> projectInvestors,String projectId);

    //Serializable是Long，string等等的顶级接口
    void deleteById(Serializable id);

    void updateById(ProjectInvestor projectInvestor);


}
