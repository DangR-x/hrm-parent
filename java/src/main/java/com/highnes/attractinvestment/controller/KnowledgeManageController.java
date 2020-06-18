package com.highnes.attractinvestment.controller;

import com.highnes.attractinvestment.domain.ResultMessage;
import com.highnes.attractinvestment.entity.KnowledgeManage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.controller
 * @Author: ranlongjun
 * @CreateTime: 2020-05-15 14:41
 * @Description: 知识管理
 */
@RestController
@RequestMapping(value = "api/knowledge")
@Api(tags = "知识管理接口")
public class KnowledgeManageController extends BaseController {
    /**
     * 获取数据字典列表
     * @param knowledgeManage
     * @return
     */
    @RequestMapping(value = "findPage", method = RequestMethod.POST)
    @ApiOperation(notes = "findPage", value = "获取数据字典列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "knowledgeType", value = "知识类型", required = false, dataType = "String", paramType = "query")
    })
    public Object findPage(@RequestBody KnowledgeManage knowledgeManage){
        try{
            return ResultMessage.success(knowledgeManageService.findPage(knowledgeManage));
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }

    /**
     * 保存知识数据列表
     * @param knowledgeManage
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ApiOperation(notes = "save", value = "保存知识数据列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "knowledgeType", value = "知识类型", required = false, dataType = "String", paramType = "query"),
            @ApiImplicitParam(name = "pageNo", value = "页数", required = false, dataType = "String", paramType = "query"),
            @ApiImplicitParam(name = "pageSize", value = "知识类型", required = false, dataType = "String", paramType = "query")
    })
    public Object save(@RequestBody KnowledgeManage knowledgeManage){
        try {
            knowledgeManageService.save(knowledgeManage);
            return ResultMessage.success("保存成功!");
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }

    /**
     * 获取数据字典列表
     * @param knowledgeManage
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ApiOperation(notes = "delete", value = "获取数据字典列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "knowledgeType", value = "知识类型", required = false, dataType = "String", paramType = "query")
    })
    public Object delete(@RequestBody KnowledgeManage knowledgeManage){
        try{
            knowledgeManageService.delete(knowledgeManage);
            return ResultMessage.success("删除成功");
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }
}
