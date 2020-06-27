package com.highnes.attractinvestment.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.common.utils.EncryptUtil;
import com.highnes.attractinvestment.common.utils.LoginUtils;
import com.highnes.attractinvestment.common.utils.StringUtils;
import com.highnes.attractinvestment.domain.SysUserRequest;
import com.highnes.attractinvestment.domain.SysUserResult;
import com.highnes.attractinvestment.entity.*;
import com.highnes.attractinvestment.mapper.*;
import com.highnes.attractinvestment.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;


/**
 * 用户信息Service接口
 *
 * @author ranlj
 * @date 2020-05-18
 */
@Service
public class SysUserServiceImpl extends BaseService<SysUserMapper, SysUser> {

    @Autowired
    private SysMenuMapper sysMenuMapper;
    @Autowired
    private SysRoleMapper sysRoleMapper;
    @Autowired
    private SysDeptMapper sysDeptMapper;
    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;
    @Autowired
    private SysRoleMenuMapper sysRoleMenuMapper;
    @Autowired
    private SysUserMapper sysUserMapper;

    /**
     * 通过多个部门id查出员工
     * @param DeptIds
     * @return
     */
    public PageInfo<SysUser> findUserByDeptIds(List<Long> DeptIds,Integer pageNo,Integer pageSize){
        PageHelper.startPage(pageNo, pageSize);
        List<SysUser> userByDeptIds = sysUserMapper.findUserByDeptIds(DeptIds);
        return new PageInfo(userByDeptIds);
    }

    /**
     * 根据ID获取信息
     *
     * @param id
     * @return
     */
    @Override
    public SysUser get(String id) {
        return super.get(id);
    }


    /**
     * 查询列表
     *
     * @param sysUser
     * @return
     */
    @Override
    public List<SysUser> findList(SysUser sysUser) {
        return super.findList(sysUser);
    }

    /**
     * 分页查询
     *
     * @param sysUser
     * @return
     */
    @Override
    public PageInfo<SysUser> findPage(SysUser sysUser) {
        return super.findPage(sysUser);
    }

    /**
     * 保存
     *
     * @param sysUser
     */
    @Override
    @Transactional(readOnly = false)
    public void save(SysUser sysUser){
        super.save(sysUser);
    }

    /**
     * 删除
     *
     * @param sysUser
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(SysUser sysUser) {
        super.delete(sysUser);
        sysUserRoleMapper.delete(sysUser.getUserId());
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @Transactional(readOnly = false)
    public int delete(String ids) {
        String[] arr = ids.split(",");
        for (String s : arr) {
            delete(new SysUser(s));
            sysUserRoleMapper.delete(s);
        }
        return arr.length;
    }

    public SysUserResult getUserInfoList(String id) {
        SysUser sysUser = mapper.get(id);
        return getUserResultByUserId(sysUser);
    }


    public List<SysUserResult> getUserInfoLists(SysUserRequest sysUserRequest) {
        List<SysUser> sysUserList = mapper.selUserByConditions(sysUserRequest);
        List<SysUserResult> sysUserResults = new ArrayList<>();
        SysUserResult sysUserResult = null;
        for (SysUser sysUser : sysUserList) {
            sysUserResult = getUserResultByUserId(sysUser);
            sysUserResults.add(sysUserResult);
        }
        return sysUserResults;
    }

    /**
     * 获取用户权限 -- 用户角色 -- 用户部门
     * @param sysUser
     * @return
     */
    private SysUserResult getUserResultByUserId(SysUser sysUser) {
        SysUserResult sysUserResult = new SysUserResult();
        sysUserResult.setUserId(sysUser.getUserId());
        sysUserResult.setDeptId(sysUser.getDeptId());
        sysUserResult.setEmail(sysUser.getEmail());
        sysUserResult.setUserName(sysUser.getUserName());
        sysUserResult.setSex(sysUser.getSex());
        sysUserResult.setLoginName(sysUser.getLoginName());
        sysUserResult.setPhonenumber(sysUser.getPhonenumber());
        sysUserResult.setLoginDate(sysUser.getLoginDate());
        sysUserResult.setStatus(sysUser.getStatus());
        sysUserResult.setPassword(EncryptUtil.decrypt(sysUser.getPassword()));
        List<SysRole> sysRoles = new ArrayList<>();
        List<SysDept> sysDepts = new ArrayList<>();
        List<SysRoleMenu> sysMenus = new ArrayList<>();
        sysDepts.add(sysDeptMapper.get(sysUserResult.getDeptId()));
        sysUserResult.setDeptList(sysDepts);
        SysRole sysRole;
        List<SysUserRole> sysUserRoleList = sysUserRoleMapper.selUserRoleListByUserId(Integer.parseInt(sysUser.getUserId()));
        for (SysUserRole sysUserRole : sysUserRoleList) {
            sysRole = sysRoleMapper.get(sysUserRole.getRoleId());
            sysRoles.add(sysRole);
            List<SysRoleMenu> sysRoleMenuList = sysRoleMenuMapper.selSysRoleListByRoleId(Integer.parseInt(sysRole.getRoleId()));
            for (SysRoleMenu sysRoleMenu : sysRoleMenuList){
               SysMenu sysMenu  = sysMenuMapper.get(sysRoleMenu.getMenuId());
               sysRoleMenu.setMenuName(sysMenu.getMenuName());
               sysRoleMenu.setMenuUrl(sysMenu.getUrl());
               sysMenus.add(sysRoleMenu);
            }
        }
        sysUserResult.setMenuList(sysMenus);
        sysUserResult.setRoleList(sysRoles);
        return sysUserResult;
    }

    /**
     * 保存用户信息和所属角色信息
     * @param sysUserResult
     * @return
     */
    @Transactional(readOnly = false)
    public int saveUser(SysUserResult sysUserResult){
        sysUserResult.setCreateDate(new Date());
        sysUserResult.setPassword(EncryptUtil.encrypt(sysUserResult.getPassword()));
        sysUserResult.setSalt(String.valueOf(UUID.randomUUID()));
        save(sysUserResult);
        SysUserRole sysUserRole;
        for (SysRole sysRole : sysUserResult.getRoleList()){
            sysUserRole = new SysUserRole();
            sysUserRole.setRoleId(String.valueOf(sysRole.getRoleId()));
            sysUserRole.setUserId(sysUserResult.getUserId());
            sysUserRoleMapper.insert(sysUserRole);
        }
        return 0;
    }

    /**
     * 是否可登录
     * @param sysUser
     * @return
     */
    public Map<String,Object> isLogin(SysUser sysUser){
        SysUser  user = mapper.getUserByLoginName(sysUser);
        if (user == null || StringUtils.isBlank(user.getUserId())){
            return null;
        }
        Map<String,Object> map = new HashMap<>();
        String encryPassword = EncryptUtil.encrypt(sysUser.getPassword());
        boolean status = encryPassword.equals(user.getPassword());
        if (status){
            SysUserResult sysUserResult = getUserInfoList(user.getUserId());
            map.put("userInfo",sysUserResult);
            map.put("token", LoginUtils.login(sysUserResult));
        }

        Set<Map.Entry<String, Object>> entries = map.entrySet();
        for (Map.Entry<String, Object> entry : entries) {
            System.out.println(entry+":=>"+map.get(entry));
        }


        return map;
    }

    /**
     * 保存用户信息和所属角色信息
     * @param sysUserResult
     * @return
     */
    @Transactional(readOnly = false)
    public int updateUser(SysUserResult sysUserResult){
        sysUserResult.setUpdateDate(new Date());
        mapper.update(sysUserResult);
        sysUserRoleMapper.delete(sysUserResult.getUserId());
        for (SysRole sysRole : sysUserResult.getRoleList()){
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setUserId(sysUserResult.getUserId());
            sysUserRole.setRoleId(String.valueOf(sysRole.getRoleId()));
            sysUserRoleMapper.insert(sysUserRole);
        }
        return 0;
    }

    /**
     * 保存用户信息和所属角色信息
     * @param userIds
     * @return
     */
    @Transactional(readOnly = false)
    public int deleteUser(String userIds){
       String[] arr = userIds.split(",");
       for (String s : arr) {
            mapper.delete(s);
            sysUserRoleMapper.delete(s);
       }
       return 0;
    }

}
