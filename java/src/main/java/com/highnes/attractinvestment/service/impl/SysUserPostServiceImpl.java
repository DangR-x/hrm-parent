package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.SysUserPost;
import com.highnes.attractinvestment.mapper.SysUserPostMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 用户与岗位关联Service接口
 * 
 * @author ranlj
 * @date 2020-05-18
 */
@Service
public class SysUserPostServiceImpl extends BaseService<SysUserPostMapper, SysUserPost> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public SysUserPost get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param sysUserPost
     * @return
     */
    @Override
    public List<SysUserPost> findList(SysUserPost sysUserPost){
        return super.findList(sysUserPost);
    }

    /**
     * 分页查询
     * @param sysUserPost
     * @return
     */
    @Override
    public PageInfo<SysUserPost> findPage(SysUserPost sysUserPost){
        return super.findPage(sysUserPost);
    }

    /**
     * 保存
     * @param sysUserPost
     */
    @Override
    @Transactional(readOnly = false)
    public void save(SysUserPost sysUserPost){
        super.save(sysUserPost);
    }

    /**
     * 删除
     * @param sysUserPost
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(SysUserPost sysUserPost){
        super.delete(sysUserPost);
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
            delete(new SysUserPost(s));
        }
        return arr.length;
    }
}
