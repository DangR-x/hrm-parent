package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectDealDetails;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目进展维护Mapper接口
 * 
 * @author fuly
 * @date 2020-05-19
 */
@Mapper
public interface ProjectDealDetailsMapper extends BaseMapper<ProjectDealDetails> {

    /**
     * 删除
     * @param projectDealDetails
     */
    void deleteByProject(ProjectDealDetails projectDealDetails);

}
