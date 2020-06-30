package com.highnes.attractinvestment.service;

import com.highnes.attractinvestment.entity.Permission;

import java.io.Serializable;
import java.util.List;

/**
 * @author Rain
 * @date 2020/6/29
 * @description
 */
public interface IPermissionService {

    int insert(Permission permission);

    void deleteById(Serializable id);

    void update(Permission permission);

    List<Permission> selectAll();

    List<Permission> selectByQuery(Permission permission);
}
