package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectReception;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目-接待信息Mapper接口
 * 
 * @author fuly
 * @date 2020-05-21
 */
@Mapper
public interface ProjectReceptionMapper extends BaseMapper<ProjectReception> {

    /**
     * 删除
     * @param projectReception
     */
    void deleteByProject(ProjectReception projectReception);
}
