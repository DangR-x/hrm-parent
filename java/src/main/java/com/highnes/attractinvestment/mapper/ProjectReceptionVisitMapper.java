package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectReceptionVisit;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目-接待记录-到访人员Mapper接口
 * 
 * @author fuly
 * @date 2020-05-21
 */
@Mapper
public interface ProjectReceptionVisitMapper extends BaseMapper<ProjectReceptionVisit> {

    /**
     * 删除
     * @param projectReceptionVisit
     */
    void deleteByReception(ProjectReceptionVisit projectReceptionVisit);
}
