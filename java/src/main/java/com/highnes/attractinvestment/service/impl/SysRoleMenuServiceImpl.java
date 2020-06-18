package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.SysRoleMenu;
import com.highnes.attractinvestment.mapper.SysRoleMenuMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 角色和菜单关联Service接口
 * 
 * @author ranlj
 * @date 2020-05-18
 */
@Service
public class SysRoleMenuServiceImpl extends BaseService<SysRoleMenuMapper, SysRoleMenu> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public SysRoleMenu get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param sysRoleMenu
     * @return
     */
    @Override
    public List<SysRoleMenu> findList(SysRoleMenu sysRoleMenu){
        return super.findList(sysRoleMenu);
    }

    /**
     * 分页查询
     * @param sysRoleMenu
     * @return
     */
    @Override
    public PageInfo<SysRoleMenu> findPage(SysRoleMenu sysRoleMenu){
        return super.findPage(sysRoleMenu);
    }

    /**
     * 保存
     * @param sysRoleMenu
     */
    @Override
    @Transactional(readOnly = false)
    public void save(SysRoleMenu sysRoleMenu){
        super.save(sysRoleMenu);
    }

    /**
     * 删除
     * @param sysRoleMenu
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(SysRoleMenu sysRoleMenu){
        super.delete(sysRoleMenu);
    }

    /**
    * 批量删除
    * @param ids
    * @return
    */
    @Transactional(readOnly = false)
    public int delete(String ids){
        String [] arr = ids.split(",");
        for (String s: arr){
            delete(new SysRoleMenu(s));
        }
        return arr.length;
    }
}
