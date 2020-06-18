package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectContract;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目合同信息Mapper接口
 * 
 * @author fuly
 * @date 2020-05-25
 */
@Mapper
public interface ProjectContractMapper extends BaseMapper<ProjectContract> {

    /**
     * 删除
     * @param projectContract
     */
    void deleteByProject(ProjectContract projectContract);
}
