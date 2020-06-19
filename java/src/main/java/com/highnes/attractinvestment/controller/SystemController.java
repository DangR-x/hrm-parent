package com.highnes.attractinvestment.controller;

import com.highnes.attractinvestment.domain.ResultMessage;
import com.highnes.attractinvestment.entity.SysUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.controller
 * @Author: ranlongjun
 * @CreateTime: 2020-05-19 14:12
 * @Description: 系统管理
 */
@RestController
@RequestMapping(value = "api/system")
@Api(tags = "系统管理接口")
public class SystemController extends BaseController {

    /**
     * 登录
     * @param sysUser
     * @return
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ApiOperation(notes = "login", value = "登录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "loginName", value = "登录名", required = false, dataType = "String", paramType = "query"),
            @ApiImplicitParam(name = "password", value = "密码", required = false, dataType = "String", paramType = "query"),
    })
    public Object login(@RequestBody SysUser sysUser){


        try {
            Map<String,Object> map = sysUserService.isLogin(sysUser);
            if (map != null && map.size() > 0){
                return ResultMessage.success(map);
            }else {
                return ResultMessage.error("账号或者密码错误");
            }
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }
}
