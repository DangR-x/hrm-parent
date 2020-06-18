package com.highnes.attractinvestment.controller;

import com.highnes.attractinvestment.annotation.Login;
import com.highnes.attractinvestment.common.utils.LoginUtils;
import com.highnes.attractinvestment.domain.ResultMessage;
import com.highnes.attractinvestment.domain.SysRoleRequest;
import com.highnes.attractinvestment.domain.SysUserResult;
import com.highnes.attractinvestment.entity.BaseEntity;
import com.highnes.attractinvestment.entity.SysRole;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.controller
 * @Author: ranlongjun
 * @CreateTime: 2020-05-21 11:20
 * @Description: 角色管理
 */
@RestController
@RequestMapping(value = "api/SysRole")
@Api(tags = "系统角色接口")
public class SysRoleController extends BaseController {


    /**
     * 删除用户信息
     * @param sysRoleRequest
     * @return
     */
    @Login
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ApiOperation(notes = "save", value = "新增角色")
    public Object save(@RequestBody SysRoleRequest sysRoleRequest){
        try{
            SysUserResult sysUserResult = LoginUtils.getLogin();
            sysRoleRequest.setCreateBy(sysUserResult.getUserName());
            sysRoleRequest.setCreateDate(new Date());
            sysRoleRequest.setDelFlag(BaseEntity.DEL_FLAG_NORMAL);
            sysRoleService.saveRoleInfo(sysRoleRequest);
            return ResultMessage.success("新增角色成功!");
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }


    /**
     * 删除用户信息
     * @param sysRoleRequest
     * @return
     */
    @Login
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ApiOperation(notes = "delete", value = "新增角色")
    public Object delete(@RequestBody SysRoleRequest sysRoleRequest){
        try{
            if (sysRoleRequest != null && sysRoleRequest.getRoleIds() != null){
                for (String roleId : sysRoleRequest.getRoleIds().split(",")){
                    SysRole sysRole = new SysRole();
                    sysRole.setRoleId(roleId);
                    sysRoleService.delete(sysRole);
                }
            }
            return ResultMessage.success("新增角色成功!");
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }

    /**
     * 删除用户信息
     * @param sysRoleRequest
     * @return
     */
    @Login
    @RequestMapping(value = "select", method = RequestMethod.POST)
    @ApiOperation(notes = "select", value = "新增角色")
    public Object select(@RequestBody SysRoleRequest sysRoleRequest){
        try{
            return ResultMessage.success(sysRoleService.selRoleInfoList(sysRoleRequest));
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }


}
