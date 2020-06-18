package com.highnes.attractinvestment.mapper;

import java.util.List;

/**
 * @author Rain
 * @date
 * @description
 */
public interface BaseMapper<T> {
    /**
     * 获取对象
     * @param id
     * @return
     */
    T get(String id);
    /**
     * 获取对象
     * @param entity
     * @return
     */
    T get(T entity);
    /**
     * 获取对象
     * @param entity
     * @return
     */
    List<T> findList(T entity);

    /**
     * 获取对象
     * @return
     */
//    List<T> findAllList();
    /**
     * 获取对象
     * @param entity
     * @return
     */
    int insert(T entity);
    /**
     * 获取对象
     * @param entity
     * @return
     */
    int update(T entity);
    /**
     * 获取对象
     * @param entity
     * @return
     */
    int delete(T entity);
    /**
     * 获取对象
     * @param id
     * @return
     */
    int delete(String id);

}
