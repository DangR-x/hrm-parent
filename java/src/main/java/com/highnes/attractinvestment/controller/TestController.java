package com.highnes.attractinvestment.controller;

import com.highnes.attractinvestment.annotation.Login;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.controller
 * @Author: ranlongjun
 * @CreateTime: 2020-05-14 14:56
 * @Description:
 */
@RestController
@RequestMapping(value = "test")
@Api(tags = "测试")
public class TestController {
    @RequestMapping(value = "/test1", method = RequestMethod.POST)
    @ApiOperation(value = "测试111")
    @ApiImplicitParam(name = "projectId", value = "测试id", required = true, dataType = "string", paramType = "query")
    @Login
    public void test() {
        System.out.println(1111);
    }
}
