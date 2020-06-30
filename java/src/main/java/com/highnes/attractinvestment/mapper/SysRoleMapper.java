package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.domain.SysRoleRequest;
import com.highnes.attractinvestment.mapper.BaseMapper;
import com.highnes.attractinvestment.entity.SysRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 角色信息Mapper接口
 * 
 * @author ranlj
 * @date 2020-05-18
 */
@Mapper
public interface SysRoleMapper extends BaseMapper<SysRole> {

    /**
     * 查询角色信息
     * @param sysRoleRequest
     * @return
     */
    List<SysRoleRequest> selRoleInfoList(SysRoleRequest sysRoleRequest);

    /**
     *
     * @param userId
     * @return
     */
    SysRole getRoleByUserId(String userId);

    /**
     *  通过userID获取用户权限和角色信息
     */
    SysRole findRolePermissionByUserId(String userId);

}
