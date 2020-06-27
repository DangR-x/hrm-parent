package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.mapper.BaseMapper;
import com.highnes.attractinvestment.entity.ProjectInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 项目信息Mapper接口
 * 
 * @author fluy:
 * @date 2020-05-15
 */
@Mapper
public interface ProjectInfoMapper extends BaseMapper<ProjectInfo> {


    List<ProjectInfo> findPageByUserIds(@Param("Ids") List<String> Ids);

}
