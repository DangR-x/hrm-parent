package com.highnes.attractinvestment.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author Rain
 * @Date 2020年3月4日
 * @Description 处理上传文件访问
 */
@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 设置swagger访问
        registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");
        // 设置上传的文件访问
        registry.addResourceHandler("/**").addResourceLocations("file:"+GlobalConfig.getUploadFilePath()+"/");
    }
}
