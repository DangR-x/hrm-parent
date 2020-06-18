package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.mapper.BaseMapper;
import com.highnes.attractinvestment.entity.ProjectPersonnelResume;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目-人才信息-简历Mapper接口
 * 
 * @author fluy
 * @date 2020-05-19
 */
@Mapper
public interface ProjectPersonnelResumeMapper extends BaseMapper<ProjectPersonnelResume> {

    /**
     * 删除
     * @param projectPersonnelResume
     */
    void deleteByPersonnel(ProjectPersonnelResume projectPersonnelResume);

}
