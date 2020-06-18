package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.SysUserRole;
import com.highnes.attractinvestment.mapper.SysUserRoleMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 用户和角色关联Service接口
 * 
 * @author ranlj
 * @date 2020-05-18
 */
@Service
public class SysUserRoleServiceImpl extends BaseService<SysUserRoleMapper, SysUserRole> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public SysUserRole get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param sysUserRole
     * @return
     */
    @Override
    public List<SysUserRole> findList(SysUserRole sysUserRole){
        return super.findList(sysUserRole);
    }

    /**
     * 分页查询
     * @param sysUserRole
     * @return
     */
    @Override
    public PageInfo<SysUserRole> findPage(SysUserRole sysUserRole){
        return super.findPage(sysUserRole);
    }

    /**
     * 保存
     * @param sysUserRole
     */
    @Override
    @Transactional(readOnly = false)
    public void save(SysUserRole sysUserRole){
        super.save(sysUserRole);
    }

    /**
     * 删除
     * @param sysUserRole
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(SysUserRole sysUserRole){
        super.delete(sysUserRole);
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
            delete(new SysUserRole(s));
        }
        return arr.length;
    }
}
