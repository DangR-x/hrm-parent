package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.SysMenu;
import com.highnes.attractinvestment.mapper.SysMenuMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 菜单权限Service接口
 * 
 * @author ranlj
 * @date 2020-05-18
 */
@Service
public class SysMenuServiceImpl extends BaseService<SysMenuMapper, SysMenu> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public SysMenu get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param sysMenu
     * @return
     */
    @Override
    public List<SysMenu> findList(SysMenu sysMenu){
        return super.findList(sysMenu);
    }

    /**
     * 分页查询
     * @param sysMenu
     * @return
     */
    @Override
    public PageInfo<SysMenu> findPage(SysMenu sysMenu){
        return super.findPage(sysMenu);
    }

    /**
     * 保存
     * @param sysMenu
     */
    @Override
    @Transactional(readOnly = false)
    public void save(SysMenu sysMenu){
        super.save(sysMenu);
    }

    /**
     * 删除
     * @param sysMenu
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(SysMenu sysMenu){
        super.delete(sysMenu);
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
            delete(new SysMenu(s));
        }
        return arr.length;
    }
}
