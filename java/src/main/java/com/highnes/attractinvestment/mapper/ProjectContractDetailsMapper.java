package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectContractDetails;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目合同文件Mapper接口
 * 
 * @author fuly
 * @date 2020-05-25
 */
@Mapper
public interface ProjectContractDetailsMapper extends BaseMapper<ProjectContractDetails> {

    /**
     * 删除
     * @param projectContractDetails
     */
    void deleteByContract(ProjectContractDetails projectContractDetails);

    /**
     * 删除
     * @param projectContractDetails
     */
    void deleteByProject(ProjectContractDetails projectContractDetails);

}
