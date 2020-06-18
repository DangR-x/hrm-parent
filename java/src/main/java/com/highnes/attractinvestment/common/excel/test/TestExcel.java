package com.highnes.attractinvestment.common.excel.test;

import com.google.common.collect.Lists;
import com.highnes.attractinvestment.common.excel.ExportExcel;
import com.highnes.attractinvestment.common.excel.ImportExcel;

import java.io.File;
import java.io.IOException;
import java.util.List;

public class TestExcel {

    public static void main(String[] args) {
//        testImportExcel();
////        testExportExcel();
    }


    public static void testImportExcel() {
        File importFile = new File("E:\\导入测试.xls");
        ImportExcel importExcel = null;
        try {
            importExcel = new ImportExcel(importFile, 1, 0);
            List<User> resultList = importExcel.getDataList(User.class);
            System.out.println(resultList);
            System.out.println("导入成功...");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void testExportExcel(){
        List<User> userList = Lists.newArrayList();
        User u1 = new User();
        u1.setName("电视");
        u1.setSex("男");
        userList.add(u1);
        User u2 = new User();
        u2.setName("冰箱");
        u2.setSex("女");
        userList.add(u2);
        User u3 = new User();
        u3.setName("洗衣机");
        u3.setSex("男");
        userList.add(u3);
        try {
            new ExportExcel("导出测试", User.class).setDataList(userList).writeFile("E:\\导出测试.xls");
            System.out.println("导出成功...");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
