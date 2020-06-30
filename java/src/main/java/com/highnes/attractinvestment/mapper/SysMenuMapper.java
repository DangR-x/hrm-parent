package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.mapper.BaseMapper;
import com.highnes.attractinvestment.entity.SysMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 菜单权限Mapper接口
 * 
 * @author ranlj
 * @date 2020-05-18
 */
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {

    List<SysMenu> findMenusByIds(@Param("MenuIds")List<String> MenuIds);

    List<SysMenu> getMenusByUserId(String userId);
}
