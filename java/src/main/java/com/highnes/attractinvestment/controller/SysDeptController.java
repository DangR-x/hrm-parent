package com.highnes.attractinvestment.controller;

import com.highnes.attractinvestment.domain.ResultMessage;
import com.highnes.attractinvestment.entity.SysDept;
import com.highnes.attractinvestment.entity.SysUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.controller
 * @Author: ranlongjun
 * @CreateTime: 2020-05-19 17:32
 * @Description: 部门管理
 */

@RestController
@RequestMapping(value = "api/dept")
@Api(tags = "部门管理接口")
public class SysDeptController extends BaseController {

    /**
     * 获取单位树形结构
     * @param sysDept
     * @return
     */
    @RequestMapping(value = "getDeptTreeData", method = RequestMethod.POST)
    @ApiOperation(notes = "getDeptTreeData", value = "获取单位树形结构")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "parentId", value = "父级ID", required = false, dataType = "String", paramType = "query"),
            @ApiImplicitParam(name = "deptName", value = "部门名称", required = false, dataType = "String", paramType = "query"),
    })
    public Object getDeptTreeData(@RequestBody SysDept sysDept){
        try {
            List<SysDept> sysDeptList = sysDeptService.findList(sysDept);
            return ResultMessage.success(sysDeptService.getTreeData(sysDeptList));
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }

    /**
     * 新增单位
     * @param sysDept
     * @return
     */
    @RequestMapping(value = "addDept", method = RequestMethod.POST)
    @ApiOperation(notes = "addDept", value = "单位信息")
    public Object addDept(@RequestBody SysDept sysDept){
        try {
            sysDeptService.save(sysDept);
            return ResultMessage.success("新增成功");
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }

    /**
     *
     * @param deptId   部门id
     * @return     返回该部门所有员工
     */
    @RequestMapping(value = "DeptUser" , method = RequestMethod.GET)
    @ApiOperation(notes = "DeptUser",value = "部门员工")
    public List<SysUser> getDepUser( Long deptId){
        List<SysUser> deptUserByDeptId = sysDeptService.findDeptUserByDeptId(deptId);
        return deptUserByDeptId;
    }

    /**
     *
     * @return  返回所以一级部门
     */
    @RequestMapping(value = "parentDept",method = RequestMethod.GET)
    @ApiOperation(notes = "parentDept",value = "一级单位")
    public List<SysDept> getParentDept(){
        List<SysDept> parentList = sysDeptService.findParentList();
        return parentList;
    }

    /**
     * 删除单位
     * @param sysDept
     * @return
     */
    @RequestMapping(value = "deleteDept", method = RequestMethod.POST)
    @ApiOperation(notes = "deleteDept", value = "删除单位信息")
    public Object deleteDept(@RequestBody SysDept sysDept){
        try {
            sysDeptService.delete(sysDept);
            return ResultMessage.success("删除单位");
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }


}
