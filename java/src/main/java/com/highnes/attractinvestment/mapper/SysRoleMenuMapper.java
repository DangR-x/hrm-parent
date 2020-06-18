package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.mapper.BaseMapper;
import com.highnes.attractinvestment.entity.SysRoleMenu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 角色和菜单关联Mapper接口
 * 
 * @author ranlj
 * @date 2020-05-18
 */
@Mapper
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenu> {

    /**
     * 通过角色ID查询角色菜单及对应权限
     * @param roleId
     * @return
     */
    List<SysRoleMenu> selSysRoleListByRoleId(Integer roleId);

}
