package com.highnes.attractinvestment.common.word;

import com.google.common.collect.Maps;

import java.util.Map;

/**
 * @author Rain
 * @date 2020/5/11
 * @description
 */
public class WordTest {

    public static void main(String[] args) {
        try {
            DocumentHandler handler = new DocumentHandler("铁矿模板2.xml");
            Map<String, Object> dataMap = Maps.newHashMap();
            dataMap.put("designNumber", "2020年5月11日");
            String fileName = "C:\\Users\\Administrator\\Desktop\\新建文件夹 (4)\\test.doc";
            handler.createDoc(dataMap, fileName);
            System.out.println("导出成功...");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
