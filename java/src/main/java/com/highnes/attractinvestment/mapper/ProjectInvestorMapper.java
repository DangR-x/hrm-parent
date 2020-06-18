package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectInvestor;
import org.apache.ibatis.annotations.Mapper;

import java.io.Serializable;
import java.util.List;

/**
 * @author Rain
 * @date 2020/6/17
 * @description
 */
@Mapper
public interface ProjectInvestorMapper {

    ProjectInvestor selectById(Serializable id);

    List<ProjectInvestor> selectAll();

    List<ProjectInvestor> selectByProjectId(String projectId);

    void insert(ProjectInvestor projectInvestor);

    //Serializable是Long，string等等的顶级接口
    void deleteById(Serializable id);

    void updateById(ProjectInvestor projectInvestor);


}
