package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectExchange;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目-政策兑现Mapper接口
 * 
 * @author fuly
 * @date 2020-06-04
 */
@Mapper
public interface ProjectExchangeMapper extends BaseMapper<ProjectExchange> {

    /**
     * 删除
     * @param projectExchange
     */
    void deleteByProject(ProjectExchange projectExchange);

}
