package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectInvestigateDetails;
import org.apache.ibatis.annotations.Mapper;

/**
 * 考察陪同人员Mapper接口
 * 
 * @author fuly
 * @date 2020-05-20
 */
@Mapper
public interface ProjectInvestigateDetailsMapper extends BaseMapper<ProjectInvestigateDetails> {

    /**
     * 删除
     * @param projectInvestigateDetails
     */
    void deleteByInvestigate(ProjectInvestigateDetails projectInvestigateDetails);

}
