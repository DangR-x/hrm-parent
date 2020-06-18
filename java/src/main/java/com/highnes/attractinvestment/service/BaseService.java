package com.highnes.attractinvestment.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.common.utils.StringUtils;
import com.highnes.attractinvestment.entity.BaseEntity;
import com.highnes.attractinvestment.mapper.BaseMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Rain
 * @date
 * @description
 * @param <Mapper>
 * @param <T>
 */
@Transactional(readOnly = true)
public abstract class BaseService<Mapper extends BaseMapper<T>, T extends BaseEntity> {

    protected Logger logger = LoggerFactory.getLogger(BaseService.class);

    @Autowired
    protected Mapper mapper;

    /**
     * 获取信息
     * @param id
     * @return
     */
    public T get(String id){
        T entity = mapper.get(id);
        if (entity != null && StringUtils.isNotBlank(entity.getCreateBy())){
        }
        return entity;
    }

    /**
     * 获取信息
     * @param entity
     * @return
     */
    public T get(T entity){
        entity = mapper.get(entity);
        return entity;
    }

    /**
     * 条件查询
     * @param entity
     * @return
     */
    public List<T> findList(T entity){
        List<T> list = mapper.findList(entity);
        return list;
    }

    /**
     * 查询分页
     * @param entity
     * @return
     */
    public PageInfo<T> findPage(T entity){
        PageHelper.startPage(entity.getPageNo(), entity.getPageSize());
        List<T> list = mapper.findList(entity);
        return new PageInfo(list);
    }

    /**
     * 保存
     * @param entity
     */
    @Transactional(readOnly = false)
    public void save(T entity){
        if (StringUtils.isBlank(entity.getId())){
            entity.preInsert();
            mapper.insert(entity);
        }else {
            entity.preUpdate();
            mapper.update(entity);
        }
    }

    /**
     * 删除
     * @param entity
     */
    public void delete(T entity){
        mapper.delete(entity);
    }
}
