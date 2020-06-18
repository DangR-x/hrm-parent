package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectInvestigateFile;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目考察信息-考察方案Mapper接口
 * 
 * @author fuly
 * @date 2020-05-26
 */
@Mapper
public interface ProjectInvestigateFileMapper extends BaseMapper<ProjectInvestigateFile> {
    /**
     * 删除
     * @param projectInvestigateFile
     */
    void deleteByInvestigate(ProjectInvestigateFile projectInvestigateFile);
}
