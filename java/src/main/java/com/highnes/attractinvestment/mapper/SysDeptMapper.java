package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.mapper.BaseMapper;
import com.highnes.attractinvestment.entity.SysDept;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 部门Mapper接口
 * 
 * @author ranlj
 * @date 2020-05-18
 */
@Mapper
public interface SysDeptMapper extends BaseMapper<SysDept> {

    List<SysDept> findParentList();


}
