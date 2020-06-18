package com.highnes.attractinvestment.common.excel.test;


import com.highnes.attractinvestment.common.excel.annotation.ExcelField;

/**
 * @author Administrator
 */
public class User {
    private String name;
    private String sex;

    @ExcelField(title = "姓名", sort = 1, align = 2)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ExcelField(title = "性别", sort = 2, align = 2)
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
}
