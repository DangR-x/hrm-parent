package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.domain.SysUserRequest;
import com.highnes.attractinvestment.mapper.BaseMapper;
import com.highnes.attractinvestment.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Configuration;

import java.util.List;

/**
 * 用户信息Mapper接口
 * 
 * @author ranlj
 * @date 2020-05-18
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {

    /**
     * 条件查询用户列表
     * @param sysUserRequest
     * @return
     */
    List<SysUser> selUserByConditions(SysUserRequest sysUserRequest);

    /**
     * 通过登录名称查找用户
     * @param sysUser
     * @return
     */
    SysUser getUserByLoginName(SysUser sysUser);

    /**
     * 通过多个部门id查出员工
     * @param DeptIds
     * @return
     */
    List<SysUser> findUserByDeptIds(@Param("DeptIds") List<Long> DeptIds);
}
