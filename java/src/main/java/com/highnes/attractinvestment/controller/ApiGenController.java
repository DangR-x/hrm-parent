package com.highnes.attractinvestment.controller;

import com.highnes.attractinvestment.common.utils.Convert;
import com.highnes.attractinvestment.domain.ResultMessage;
import com.highnes.attractinvestment.entity.GenTable;
import com.highnes.attractinvestment.service.IGenTableColumnService;
import com.highnes.attractinvestment.service.IGenTableService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Rain
 * @date 2020/5/15
 * @description
 */
@RestController
@RequestMapping(value = "api")
@Api(tags = "代码生成")
public class ApiGenController {

    @Autowired
    private IGenTableService genTableService;
    @Autowired
    private IGenTableColumnService genTableColumnService;

    @PostMapping(value = "importTableSave")
    @ApiOperation(value = "生成代码")
    @ApiImplicitParam(name = "tables", value = "表明，多个请用逗号隔开", required = true, paramType = "query", dataType = "string")
    public ResultMessage importTableSave(String tables) {
          String[] tableNames = Convert.toStrArray(tables);
        // 查询表信息
        List<GenTable> tableList = genTableService.selectDbTableListByNames(tableNames);
        String operName = "loginName";
        genTableService.importGenTable(tableList, operName);
        return ResultMessage.success();
    }
}
