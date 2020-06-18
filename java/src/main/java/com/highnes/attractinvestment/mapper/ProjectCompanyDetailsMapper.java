package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectCompanyDetails;
import org.apache.ibatis.annotations.Mapper;

/**
 * 主要参与单位Mapper接口
 * 
 * @author fluy
 * @date 2020-05-15
 */
@Mapper
public interface ProjectCompanyDetailsMapper extends BaseMapper<ProjectCompanyDetails> {

    /**
     * 删除
     * @param projectCompanyDetails
     * @return
     */
    int deleteByProject(ProjectCompanyDetails projectCompanyDetails);

}
