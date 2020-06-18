package com.highnes.attractinvestment.common.file;

import com.google.common.collect.Maps;
import com.highnes.attractinvestment.common.utils.FileUtils;
import com.highnes.attractinvestment.common.utils.StringUtils;
import com.highnes.attractinvestment.config.GlobalConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * @author Rain
 * @Date 2020年3月4日
 * @description 上传文件工具类
 */
public class UploadFileUtils {

    private static Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
    private static final String LINE = "/";

    /**
     * 上传文件
     * @param uploadFile
     * @return
     */
    public static Map<String, Object> uploadFile(MultipartFile uploadFile){
        return uploadFile(uploadFile, GlobalConfig.getUploadFilePath());
    }


    /**
     * 上传文件
     * @param uploadFile
     * @param filePath
     * @return
     */
    public static Map<String, Object> uploadFile(MultipartFile uploadFile, String filePath){
        // 返回结果
        Map<String, Object> resultMap = Maps.newHashMap();

        if (uploadFile==null){
            logger.info("上传文件为空。");
            resultMap.put("err", "上传文件为空");
            return resultMap;
        }

        // 获取文件名并根据
        String fileName = uploadFile.getOriginalFilename();
        logger.info("文件名..."+fileName);


        // 获取当前日期，把上传地址根据日期区分
        DateFormat df = new SimpleDateFormat("yyyy年MM月dd日");
        String datePath = df.format(new Date());
//        if (filePath == null || filePath == ""){
//            filePath = "E:/easypower/userFile";
//        }
        filePath = filePath + LINE + datePath;
        logger.info("上传路径..."+filePath);

        // 创建文件夹
        FileUtils.createDirectory(filePath);

        // 判断当前文件名是否重复，重复则重新命名
        // 随机生成一个UUID防止文件重名
        fileName = StringUtils.uuid()+fileName;
        File newFile = new File(filePath+LINE+fileName);
        try {
            // 上传文件到服务器指定位置
            uploadFile.transferTo(newFile);
        } catch (IOException e) {
            e.printStackTrace();
            resultMap.put("err", "上传失败");
            resultMap.put("msg", e.getMessage());
            logger.error(e.getMessage(), e);
            return resultMap;
        }

        resultMap.put("name", fileName);
        resultMap.put("filePath", LINE+datePath+LINE+fileName);
        resultMap.put("fileName", uploadFile.getOriginalFilename());
        return resultMap;
    }
}
