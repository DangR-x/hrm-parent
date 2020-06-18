package com.highnes.attractinvestment.controller;

import com.highnes.attractinvestment.common.utils.StringUtils;
import com.highnes.attractinvestment.controller.params.DictDataRequest;
import com.highnes.attractinvestment.domain.ResultMessage;
import com.highnes.attractinvestment.entity.SysDictData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.controller
 * @Author: ranlongjun
 * @CreateTime: 2020-05-14 18:39
 * @Description: 数据字典
 */
@RestController
@RequestMapping(value = "api/sysDict")
@Api(tags = "数据字典接口")
public class SysDictDataController extends BaseController {

    /**
     * 获取数据字典列表
     *
     * @param dictCode
     * @param dictType
     * @return
     */
    @RequestMapping(value = "selectDictDataList", method = RequestMethod.GET)
    @ApiOperation(notes = "selectDictDataList", value = "获取数据字典列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "dictCode", value = "字典编码", required = false, dataType = "String", paramType = "query"),
            @ApiImplicitParam(name = "dictType", value = "字典类型", required = false, dataType = "String", paramType = "query"),
    })
    public Object selectDictDataList(String dictCode, String dictType) {


        try {
            SysDictData sysDictData = new SysDictData();
            if (StringUtils.isNotBlank(dictCode)){
                sysDictData.setDictCode(Long.parseLong(dictCode));
            }
            sysDictData.setDictType(dictType);
            List<SysDictData> sysDictDataList = sysDictDataService.selectDictDataList(sysDictData);
            return ResultMessage.success(sysDictDataList);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return ResultMessage.error(e.getMessage());
        }
    }


    /**
     * 获取数据字典列表
     *
     * @param dictDataRequest
     * @return
     */
    @RequestMapping(value = "addDictData", method = RequestMethod.POST)
    @ApiOperation(notes = "addDictData", value = "新增数据字典列表")
    public Object insertDictData(@RequestBody DictDataRequest dictDataRequest) {
        try {
            SysDictData sysDictData = new SysDictData();
            sysDictData.setDictSort(dictDataRequest.getDictSort());
            sysDictData.setDictType(dictDataRequest.getDictType());
            sysDictData.setDictValue(dictDataRequest.getDictValue());
            sysDictData.setDictLabel(dictDataRequest.getDictLabel());
            sysDictDataService.insertDictData(sysDictData);
            return ResultMessage.success("新增成功!");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return ResultMessage.error(e.getMessage());
        }
    }


    /**
     * 删除数据字典列表
     *
     * @param dictDataRequest
     * @return
     */
    @RequestMapping(value = "deleteDictDataByIds", method = RequestMethod.POST)
    @ApiOperation(notes = "deleteDictDataByIds", value = "删除数据字典列表")
    public Object deleteDictDataByIds(@RequestBody DictDataRequest dictDataRequest) {
        try {
            if (dictDataRequest == null || dictDataRequest.getDictCode() == null){
                return ResultMessage.fail("参数为空");
            }
            sysDictDataService.deleteDictDataByIds(String.valueOf(dictDataRequest.getDictCode()));
            return ResultMessage.success("删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return ResultMessage.error(e.getMessage());
        }
    }


    /**
     * 修改数据字典列表
     *
     * @param dictDataRequest
     * @return
     */
    @RequestMapping(value = "updateDictData", method = RequestMethod.POST)
    @ApiOperation(notes = "updateDictData", value = "修改数据字典列表")
    public Object updateDictData(@RequestBody DictDataRequest dictDataRequest) {
        try {
            SysDictData sysDictData = new SysDictData();
            sysDictData.setDictCode(dictDataRequest.getDictCode());
            sysDictData.setDictSort(dictDataRequest.getDictSort());
            sysDictData.setDictType(dictDataRequest.getDictType());
            sysDictData.setDictValue(dictDataRequest.getDictValue());
            sysDictData.setDictLabel(dictDataRequest.getDictLabel());
            sysDictDataService.updateDictData(sysDictData);
            return ResultMessage.success("修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return ResultMessage.error(e.getMessage());
        }
    }


}
