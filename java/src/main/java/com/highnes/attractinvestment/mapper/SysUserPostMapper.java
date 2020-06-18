package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.mapper.BaseMapper;
import com.highnes.attractinvestment.entity.SysUserPost;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户与岗位关联Mapper接口
 * 
 * @author ranlj
 * @date 2020-05-18
 */
@Mapper
public interface SysUserPostMapper extends BaseMapper<SysUserPost> {
}
