package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.domain.SysRoleRequest;
import com.highnes.attractinvestment.entity.BaseEntity;
import com.highnes.attractinvestment.entity.SysMenu;
import com.highnes.attractinvestment.entity.SysRoleMenu;
import com.highnes.attractinvestment.mapper.SysRoleMenuMapper;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.SysRole;
import com.highnes.attractinvestment.mapper.SysRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 角色信息Service接口
 * 
 * @author ranlj
 * @date 2020-05-18
 */
@Service
public class SysRoleServiceImpl extends BaseService<SysRoleMapper, SysRole> {

    @Autowired
    private SysRoleMenuMapper sysRoleMenuMapper;

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public SysRole get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param sysRole
     * @return
     */
    @Override
    public List<SysRole> findList(SysRole sysRole){
        return super.findList(sysRole);
    }

    /**
     * 分页查询
     * @param sysRole
     * @return
     */
    @Override
    public PageInfo<SysRole> findPage(SysRole sysRole){
        return super.findPage(sysRole);
    }

    /**
     * 保存
     * @param sysRole
     */
    @Override
    @Transactional(readOnly = false)
    public void save(SysRole sysRole){
        super.save(sysRole);
    }

    /**
     * 删除
     * @param sysRole
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(SysRole sysRole){
        sysRoleMenuMapper.delete(sysRole.getRoleId());
        super.delete(sysRole);
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
            delete(new SysRole(s));
        }
        return arr.length;
    }

    /**
     * 保存角色信息 --菜单权限
     * @param sysRoleRequest
     * @return
     */
    @Transactional(readOnly = false)
    public int saveRoleInfo(SysRoleRequest sysRoleRequest){
        sysRoleRequest.setRoleKey(sysRoleRequest.getRoleName());
        sysRoleRequest.setStatus(BaseEntity.NORMAL_STATUS);

        save(sysRoleRequest);
        List<SysRole> roleList = findList(sysRoleRequest);
        if (roleList != null && roleList.size() >0){
            for (SysRoleMenu sysRoleMenu : sysRoleRequest.getMenuList()){
                sysRoleMenu.setRoleId(String.valueOf(roleList.get(0).getRoleId()));
                sysRoleMenuMapper.insert(sysRoleMenu);
            }
        }
        return 0;
    }


    /**
     * 查询角色信息
     * @param sysRoleRequest
     * @return
     */
    public List<SysRoleRequest> selRoleInfoList(SysRoleRequest sysRoleRequest){
       return mapper.selRoleInfoList(sysRoleRequest);
    }
}
