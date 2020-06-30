package com.highnes.attractinvestment.controller;

import com.highnes.attractinvestment.common.utils.StringUtils;
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
     * @param
     * @return     返回该部门所有员工
     */
    @RequestMapping(value = "getDepUser" , method = RequestMethod.POST)
    @ApiOperation(notes = "getDepUser",value = "部门所有员工")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNo", value = "页数", required = false, dataType = "String", paramType = "query"),
            @ApiImplicitParam(name = "pageSize", value = "每页多少行", required = false, dataType = "String", paramType = "query"),
            @ApiImplicitParam(name = "deptid", value = "部门id", required = false, dataType = "String", paramType = "query"),
            @ApiImplicitParam(name = "deptLevel", value = "部门等级", required = false, dataType = "String", paramType = "query"),
    })
    public ResultMessage getDepUser(@RequestBody SysDept sysDept){
        List<SysUser> deptUserByDeptId = null;
        try {
            deptUserByDeptId = sysDeptService.findDeptUserByDeptId(sysDept);
            if(deptUserByDeptId==null){
                return ResultMessage.error("新建部门，亟待新员工加入！");
            }
            return ResultMessage.success(deptUserByDeptId);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultMessage.error("部门选择错误！");
        }
    }

    /**
     * 查找单位
     * @param deptId
     * @return
     */
    @RequestMapping(value = "getone", method = RequestMethod.GET)
    @ApiOperation(notes = "getone", value = "查找部门信息")
    public ResultMessage getone(Long deptId){
        logger.info("deptId="+deptId);
        try {
            SysDept sysDept = sysDeptService.get(deptId.toString());
            if(StringUtils.isEmpty(sysDept.getDeptName())){
                return ResultMessage.error("找不到该部门");
            }
            return ResultMessage.success(sysDept);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultMessage.error("查找部门错误！");
        }
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
