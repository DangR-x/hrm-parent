package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectAreaDetails;
import org.apache.ibatis.annotations.Mapper;

/**
 * 空间需求Mapper接口
 * 
 * @author fluy
 * @date 2020-05-15
 */
@Mapper
public interface ProjectAreaDetailsMapper extends BaseMapper<ProjectAreaDetails> {

    /**
     * 根据项目编码删除空间需求
     * @param projectAreaDetails
     * @return
     */
    int deleteByProject(ProjectAreaDetails projectAreaDetails);

}
