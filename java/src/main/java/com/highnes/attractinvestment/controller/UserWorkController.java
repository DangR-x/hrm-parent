package com.highnes.attractinvestment.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Rain
 * @date 2020/5/25
 * @description
 */
@RestController
@RequestMapping(value = "api/work")
@Api(tags = "我的工作")
public class UserWorkController extends BaseController {

}
