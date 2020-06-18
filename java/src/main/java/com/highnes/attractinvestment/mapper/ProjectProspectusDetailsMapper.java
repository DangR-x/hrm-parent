package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectProspectusDetails;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目计划书Mapper接口
 * 
 * @author fluy
 * @date 2020-05-15
 */
@Mapper
public interface ProjectProspectusDetailsMapper extends BaseMapper<ProjectProspectusDetails> {

    /**
     * 删除
     * @param projectProspectusDetails
     * @return
     */
    int deleteByProject(ProjectProspectusDetails projectProspectusDetails);
}
