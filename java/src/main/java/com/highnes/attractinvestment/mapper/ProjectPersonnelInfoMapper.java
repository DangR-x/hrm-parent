package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectPersonnelInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目-人才信息Mapper接口
 * 
 * @author fluy
 * @date 2020-05-19
 */
@Mapper
public interface ProjectPersonnelInfoMapper extends BaseMapper<ProjectPersonnelInfo> {

    /**
     * 删除
     * @param projectPersonnelInfo
     */
    void deleteByProject(ProjectPersonnelInfo projectPersonnelInfo);

}
