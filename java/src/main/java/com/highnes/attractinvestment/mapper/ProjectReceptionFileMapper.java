package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectReceptionFile;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目-接待详情-接待方案Mapper接口
 * 
 * @author fuly
 * @date 2020-05-21
 */
@Mapper
public interface ProjectReceptionFileMapper extends BaseMapper<ProjectReceptionFile> {

    /**
     * 删除
     * @param projectReceptionFile
     */
    void deleteByReception(ProjectReceptionFile projectReceptionFile);

}
