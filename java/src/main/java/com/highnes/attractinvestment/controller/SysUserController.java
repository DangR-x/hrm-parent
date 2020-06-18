package com.highnes.attractinvestment.controller;

import com.highnes.attractinvestment.annotation.Login;
import com.highnes.attractinvestment.common.utils.LoginUtils;
import com.highnes.attractinvestment.domain.ResultMessage;
import com.highnes.attractinvestment.domain.SysUserRequest;
import com.highnes.attractinvestment.domain.SysUserResult;
import com.highnes.attractinvestment.entity.KnowledgeManage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.controller
 * @Author: ranlongjun
 * @CreateTime: 2020-05-18 16:29
 * @Description: 用户管理模块
 */
@RestController
@RequestMapping(value = "api/SysUser")
@Api(tags = "用户管理接口")
public class SysUserController extends BaseController{

    /**
     * 获取用户信息
     * @param id
     * @return
     */
    @Login
    @RequestMapping(value = "getUserInfoList", method = RequestMethod.GET)
    @ApiOperation(notes = "getUserInfoList", value = "获取用户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户id", required = true, dataType = "String", paramType = "query")
    })
    public Object getUserInfoList(String id){
        try{
            return ResultMessage.success(sysUserService.getUserInfoList(id));
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }

    /**
     * 获取用户信息
     * @param deptId
     * @param postId
     * @param roleId
     * @return
     */
    @RequestMapping(value = "getUserInfoLists", method = RequestMethod.GET)
    @ApiOperation(notes = "getUserInfoLists", value = "获取用户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "deptId", value = "部门ID", required = false, dataType = "String", paramType = "query"),
            @ApiImplicitParam(name = "postId", value = "岗位ID", required = false, dataType = "String", paramType = "query"),
            @ApiImplicitParam(name = "roleId", value = "角色ID", required = false, dataType = "String", paramType = "query"),
    })
    public Object getUserInfoLists(String deptId, String postId, String roleId){
        try{
            SysUserRequest sysUserResult = new SysUserRequest();
            sysUserResult.setDeptId(deptId);
            sysUserResult.setPostId(postId);
            sysUserResult.setRoleId(roleId);
            return ResultMessage.success(sysUserService.getUserInfoLists(sysUserResult));
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }

    /**
     * 新增人员信息
     * @param sysUserResult
     * @return
     */
    @RequestMapping(value = "saveUser", method = RequestMethod.POST)
    @ApiOperation(notes = "saveUser", value = "新增人员信息")
    public Object addUser(@RequestBody SysUserResult sysUserResult){
        try{
            SysUserResult result = LoginUtils.getLogin();
            sysUserResult.setCreateBy(result.getUserName());
            sysUserService.saveUser(sysUserResult);
            return ResultMessage.success("保存成功!");
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }

    /**
     * 修改人员信息
     * @param sysUserResult
     * @return
     */
    @Login
    @RequestMapping(value = "updateUser", method = RequestMethod.POST)
    @ApiOperation(notes = "updateUser", value = "修改人员信息")
    public Object updateUser(@RequestBody SysUserResult sysUserResult){
        try{
            SysUserResult result = LoginUtils.getLogin();
            sysUserResult.setUpdateBy(result.getUserName());
            sysUserService.updateUser(sysUserResult);
            return ResultMessage.success("修改成功!");
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }

    /**
     * 删除用户信息
     * @param sysUserResult
     * @return
     */
    @RequestMapping(value = "deleteUser", method = RequestMethod.POST)
    @ApiOperation(notes = "deleteUser", value = "删除人员信息")
    public Object deleteUser(@RequestBody SysUserResult sysUserResult){
        try{
            sysUserService.deleteUser(sysUserResult.getUserId());
            return ResultMessage.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }









}
