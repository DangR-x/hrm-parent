package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectCompanyInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目-公司信息Mapper接口
 * 
 * @author fluy
 * @date 2020-05-19
 */
@Mapper
public interface ProjectCompanyInfoMapper extends BaseMapper<ProjectCompanyInfo> {

    /**
     * 批量删除
     * @param projectCompanyInfo
     */
    void deleteByProject(ProjectCompanyInfo projectCompanyInfo);


}
