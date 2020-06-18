package com.highnes.attractinvestment.controller;

import com.highnes.attractinvestment.common.file.UploadFileUtils;
import com.highnes.attractinvestment.config.GlobalConfig;
import com.highnes.attractinvestment.domain.ResultMessage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * @author Rain
 * @Date
 * @Description
 */
@RestController
@RequestMapping(value = "api")
@Api(tags = "公共api接口")
public class CommonController extends BaseController {

    /**
     * 上传文件
     * @param uploadFile
     * @return
     */
    @RequestMapping(value = "uploadFile", method = RequestMethod.POST)
    @ApiOperation(notes = "uploadFile", value = "上传文件")
    public Object uploadFile(MultipartFile uploadFile){
        try {
            Map<String, Object> map = UploadFileUtils.uploadFile(uploadFile);
            return ResultMessage.success(map);
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return ResultMessage.error(e.getMessage());
        }
    }

}
