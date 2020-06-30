package com.highnes.attractinvestment;


import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.highnes.attractinvestment.common.cache.JedisUtils;
import com.highnes.attractinvestment.domain.SysUserResult;
import com.highnes.attractinvestment.entity.*;
import com.highnes.attractinvestment.mapper.*;
import com.highnes.attractinvestment.service.IPermissionService;
import com.highnes.attractinvestment.service.IRolePermissionService;
import com.highnes.attractinvestment.service.impl.SysDeptServiceImpl;
import com.highnes.attractinvestment.service.impl.SysUserServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
class AttractinvestmentApplicationTests {


    @Autowired
    private SysDeptServiceImpl sysDeptService;

    @Autowired
    private SysUserServiceImpl sysUserService;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Autowired
    private IRolePermissionService rolePermissionService;

    @Autowired
    private IPermissionService permissionService;

    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Test
    void test08() {
        Role rolePermissionByUserId = roleMapper.findRolePermissionByUserId("1");

        System.out.println(rolePermissionByUserId);
    }
    @Test
    void test07() {
        String permissions = (String)JedisUtils.get("PERMISSIONS");
        List<Permission> permissions2 = JSON.parseArray(permissions, Permission.class);

        for (Permission permission : permissions2) {
            System.out.println(permission);
        }
    }
    @Test
    void test06() {
        SysUserResult sysUserResult = new SysUserResult();
        sysUserResult.setUserName("测试");
        sysUserResult.setPassword("123");
        SysDept sysDept = new SysDept();
        sysDept.setDeptId(103L);
        sysUserResult.setDept(sysDept);
//        SysUserRole sysUserRole = new SysUserRole();
//        sysUserRole.setRoleId("10");
//        sysUserRole.setUserId("25");
        SysRole sysRole = new SysRole();
        sysRole.setRoleId("10");

        sysUserResult.setRole(sysRole);
        sysUserResult.setUserId("25");

        sysUserService.saveUser(sysUserResult);

    }
    @Test
    void test05() {
        List<Permission> permissionsByUserId = sysUserMapper.getPermissionsByUserId("1");
        for (Permission permission : permissionsByUserId) {
            System.out.println(permission);
        }
    }
    @Test
    void test04() {
        List<Permission> permissions = permissionService.selectAll();
        for (Permission permission : permissions) {
            System.out.println(permission);
        }
    }
    @Test
    void test03() {
        RolePermission rolePermission = new RolePermission();
        rolePermission.setRoleId(1L);
        List<RolePermission> rolePermissions = rolePermissionService.selectByQuery(rolePermission);
        for (RolePermission permission : rolePermissions) {
            System.out.println(permission);
        }
    }
    @Test
    void test02() {
//        List<SysMenu> list = sysMenuMapper.findList(new SysMenu());
//        List<SysMenu> treeMenus = sysUserService.getTreeMenus(list);
//        for (SysMenu treeMenu : treeMenus) {
//            System.out.println(treeMenu);
//        }
        SysUserResult userInfoList = sysUserService.getUserInfoList("1");

    }
    @Test
    void test01() {
        SysDept sysDept = new SysDept();
        sysDept.setDeptId(112L);
        sysDeptService.delete(sysDept);

//        List<SysUser> deptUserByDeptId = sysDeptService.findDeptUserByDeptId(sysDept);
//        for (SysUser s : deptUserByDeptId) {
//            System.out.println(s);
//        }
    }


    @Test
    void testAddress() {
        String msg = "市内";
        String cq = "重庆";
        String gt = "香港";
        String add = "来自台湾有什么";
        if (add.indexOf(cq) != -1) {
            msg = "市内";
        } else if (add.indexOf(gt) != -1 || add.indexOf("台湾") != -1 || add.indexOf("澳门") != -1) {
            msg = "港澳台";
        } else {
            msg = "境外";
        }
        System.out.println(msg);
    }

}

