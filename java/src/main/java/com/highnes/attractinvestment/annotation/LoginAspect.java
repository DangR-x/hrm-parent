package com.highnes.attractinvestment.annotation;

import com.highnes.attractinvestment.common.utils.LoginUtils;
import com.highnes.attractinvestment.domain.ResultMessage;
import com.highnes.attractinvestment.domain.SysUserResult;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.annotation
 * @Author: ranlongjun
 * @CreateTime: 2020-05-21 10:31
 * @Description: 登录验证
 */
@Aspect
@Component
public class LoginAspect {


    @Pointcut("@annotation(Login)")
    public void loginPointCut(){

    }

    @Around(value = "loginPointCut()")
    public Object login(ProceedingJoinPoint joinPoint) throws Throwable{
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        Login login =method.getAnnotation(Login.class);
        if (login != null && login.required()){
            SysUserResult sysUserResult = LoginUtils.getLogin();
            if (sysUserResult == null){
                return ResultMessage.error("未登录!");
            }
        }
        return joinPoint.proceed();
    }
}
