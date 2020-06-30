package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.Permission;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

/**
 * @author Rain
 * @date 2020/6/29
 * @description
 */
@Configuration
public interface PermissionMapper {

    int insert(Permission permission);

    void deleteById(Serializable id);

    void update(Permission permission);

    List<Permission> selectAll();

    List<Permission> selectByQuery(Permission permission);



}
