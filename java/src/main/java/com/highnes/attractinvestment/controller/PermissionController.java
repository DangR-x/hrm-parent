package com.highnes.attractinvestment.controller;

import com.highnes.attractinvestment.domain.ResultMessage;
import com.highnes.attractinvestment.entity.Permission;
import com.highnes.attractinvestment.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Rain
 * @date 2020/6/29
 * @description
 */
@RestController
@RequestMapping("/api/permission")
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public ResultMessage add(@RequestBody Permission permission){
        try {
            int insert = permissionService.insert(permission);
            return ResultMessage.success(insert);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultMessage.error("添加失败");
        }
    }



}
