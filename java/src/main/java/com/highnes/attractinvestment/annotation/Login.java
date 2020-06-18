package com.highnes.attractinvestment.annotation;

import java.lang.annotation.*;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.annotation
 * @Author: ranlongjun
 * @CreateTime: 2020-05-21 10:01
 * @Description: 判断是否登录
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Login {
    boolean required() default true;
}
