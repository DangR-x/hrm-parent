package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectInvestigate;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目-考察信息Mapper接口
 * 
 * @author fuly
 * @date 2020-05-20
 */
@Mapper
public interface ProjectInvestigateMapper extends BaseMapper<ProjectInvestigate> {

    /**
     * 删除
     * @param projectInvestigate
     */
    void deleteByProject(ProjectInvestigate projectInvestigate);

}
