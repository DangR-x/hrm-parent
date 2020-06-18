package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectReceptionDetails;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目-接待-陪同人员Mapper接口
 * 
 * @author fuly
 * @date 2020-05-21
 */
@Mapper
public interface ProjectReceptionDetailsMapper extends BaseMapper<ProjectReceptionDetails> {

    /**
     * 删除
     * @param projectReceptionDetails
     */
    void deleteByReception(ProjectReceptionDetails projectReceptionDetails);

}
