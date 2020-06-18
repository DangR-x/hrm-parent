package com.highnes.attractinvestment.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;

/**
 * 读取代码生成相关配置
 *
 * @author ruoyi
 */
@Component
//@ConfigurationProperties(prefix = "gen")
//@PropertySource(value = {"classpath:application.properties"}, encoding = "utf-8")
public class GenConfig {
    /**
     * 作者
     */
    public static String author;

    /**
     * 生成包路径
     */
    public static String packageName;

    /**
     * 自动去除表前缀，默认是false
     */
    public static boolean autoRemovePre;

    /**
     * 表前缀(类名不会包含表前缀)
     */
    public static String tablePrefix;
    /**
     * 文件生成路径
     */
    private static String filePath;

    public static String getAuthor() {
        return author;
    }

    public static String getFilePath() {
        return filePath;
    }
    @Value("${gen.filePath}")
    public void setFilePath(String filePath) {
        GenConfig.filePath = filePath;
    }

    @Value("${gen.author}")
    public void setAuthor(String author) {
        GenConfig.author = author;
    }

    public static String getPackageName() {
        return packageName;
    }

    @Value("${gen.packageName}")
    public void setPackageName(String packageName) {
        GenConfig.packageName = packageName;
    }

    public static boolean getAutoRemovePre() {
        return autoRemovePre;
    }

    @Value("${gen.autoRemovePre}")
    public void setAutoRemovePre(boolean autoRemovePre) {
        GenConfig.autoRemovePre = autoRemovePre;
    }

    public static String getTablePrefix() {
        return tablePrefix;
    }

    @Value("${gen.tablePrefix}")
    public void setTablePrefix(String tablePrefix) {
        GenConfig.tablePrefix = tablePrefix;
    }
}
