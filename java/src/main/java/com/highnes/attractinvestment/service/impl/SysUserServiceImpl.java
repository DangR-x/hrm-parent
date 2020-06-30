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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;


/**
 * 用户信息Service接口
 *
 * @author ranlj
 * @date 2020-05-18
 */
@Service
public class SysUserServiceImpl extends BaseService<SysUserMapper, SysUser> {

    private Logger login = LoggerFactory.getLogger(SysUserServiceImpl.class);

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
     *
     * @param DeptIds
     * @return
     */
    public PageInfo<SysUser> findUserByDeptIds(List<Long> DeptIds, Integer pageNo, Integer pageSize) {
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
    public void save(SysUser sysUser) {
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
     *
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
        //sysUserResult.setPassword(EncryptUtil.decrypt(sysUser.getPassword()));

        //用户对应的权限
        sysUserResult.setPermissions(sysUserMapper.getPermissionsByUserId(sysUser.getUserId()));

        //登录用户的部门
        sysUserResult.setDept(sysDeptMapper.get(sysUser.getDeptId()));

        //登录用户的角色信息
        sysUserResult.setRole(sysRoleMapper.getRoleByUserId(sysUser.getUserId()));

        //登录用户菜单
        sysUserResult.setMenuList(this.getTreeMenus(sysUser.getUserId()));

        return sysUserResult;
    }

    /**
     *  通过登录用户信息获取该用户树形菜单
     * @param userId
     * @return
     */
    public List<SysMenu> getTreeMenus(String userId) {

        List<SysMenu> sysMenus = sysMenuMapper.getMenusByUserId(userId);
        logger.info("sysMenus.get(0)="+sysMenus.get(0));
        List<SysMenu> fistMenus = new ArrayList<>();
        for (SysMenu sysMenu : sysMenus) {

            if (sysMenu.getParentId().equals("0")) {
                fistMenus.add(sysMenu);
            } else {
                for (SysMenu menu : sysMenus) {
                    if (sysMenu.getParentId().equals(menu.getMenuId())) {
                        menu.getChildren().add(sysMenu);
                    }
                }
            }
        }
        return fistMenus;
    }


    /**
     * 保存用户信息和所属角色信息
     *
     * @param sysUserResult
     * @return
     */
    @Transactional(readOnly = false)
    public int saveUser(SysUserResult sysUserResult) {
        sysUserResult.setCreateDate(new Date());
        sysUserResult.setPassword(EncryptUtil.encrypt(sysUserResult.getPassword()));
        sysUserResult.setSalt(String.valueOf(UUID.randomUUID()));
        save(sysUserResult);
        SysUserRole sysUserRole = new SysUserRole();
        sysUserRole.setRoleId(sysUserResult.getRole().getRoleId());
        sysUserRole.setUserId(sysUserResult.getUserId());
        sysUserRoleMapper.insert(sysUserRole);
//        for (SysRole sysRole : sysUserResult.getRole()) {
//            sysUserRole = new SysUserRole();
//            sysUserRole.setRoleId(String.valueOf(sysRole.getRoleId()));
//            sysUserRole.setUserId(sysUserResult.getUserId());
//            sysUserRoleMapper.insert(sysUserRole);
//        }
        return 0;
    }

    /**
     * 是否可登录
     *
     * @param sysUser
     * @return
     */
    public Map<String, Object> isLogin(SysUser sysUser) {
        SysUser user = mapper.getUserByLoginName(sysUser);
        if (user == null || StringUtils.isBlank(user.getUserId())) {
            return null;
        }
        Map<String, Object> map = new HashMap<>();
        String encryPassword = EncryptUtil.encrypt(sysUser.getPassword());
        boolean status = encryPassword.equals(user.getPassword());
        if (status) {
            SysUserResult sysUserResult = getUserInfoList(user.getUserId());
            map.put("userInfo", sysUserResult);
            map.put("token", LoginUtils.login(sysUserResult));
        }

        Set<Map.Entry<String, Object>> entries = map.entrySet();
        for (Map.Entry<String, Object> entry : entries) {
            System.out.println(entry + ":=>" + map.get(entry));
        }


        return map;
    }

    /**
     * 保存用户信息和所属角色信息
     *
     * @param sysUserResult
     * @return
     */
    @Transactional(readOnly = false)
    public int updateUser(SysUserResult sysUserResult) {
        sysUserResult.setUpdateDate(new Date());
        mapper.update(sysUserResult);
        sysUserRoleMapper.delete(sysUserResult.getUserId());
        SysUserRole sysUserRole = new SysUserRole();
        sysUserRole.setUserId(sysUserResult.getUserId());
        sysUserRole.setRoleId(sysUserResult.getRole().getRoleId());
        sysUserRoleMapper.insert(sysUserRole);
//        for (SysRole sysRole : sysUserResult.getRoleList()) {
//            SysUserRole sysUserRole = new SysUserRole();
//            sysUserRole.setUserId(sysUserResult.getUserId());
//            sysUserRole.setRoleId(String.valueOf(sysRole.getRoleId()));
//            sysUserRoleMapper.insert(sysUserRole);
//        }
        return 0;
    }

    /**
     * 保存用户信息和所属角色信息
     *
     * @param userIds
     * @return
     */
    @Transactional(readOnly = false)
    public int deleteUser(String userIds) {
        String[] arr = userIds.split(",");
        for (String s : arr) {
            mapper.delete(s);
            sysUserRoleMapper.delete(s);
        }
        return 0;
    }

}
