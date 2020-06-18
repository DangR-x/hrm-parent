package com.highnes.attractinvestment.service.impl;

import com.highnes.attractinvestment.common.utils.Convert;
import com.highnes.attractinvestment.common.utils.StringUtils;
import com.highnes.attractinvestment.entity.SysDictData;
import com.highnes.attractinvestment.entity.SysDictType;
import com.highnes.attractinvestment.mapper.SysDictDataMapper;
import com.highnes.attractinvestment.mapper.SysDictTypeMapper;
import com.highnes.attractinvestment.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.service.impl
 * @Author: ranlongjun
 * @CreateTime: 2020-05-14 17:43
 * @Description: 数据字典类型
 */
@Service
public class SysDictTypeServiceImpl extends BaseService<SysDictTypeMapper,SysDictType> {

    @Autowired
    private SysDictDataMapper dictDataMapper;

    /**
     * 根据条件分页查询字典类型
     *
     * @param dictType 字典类型信息
     * @return 字典类型集合信息
     */
    public List<SysDictType> selectDictTypeList(SysDictType dictType)
    {
        return mapper.selectDictTypeList(dictType);
    }

    /**
     * 根据所有字典类型
     *
     * @return 字典类型集合信息
     */
    public List<SysDictType> selectDictTypeAll()
    {
        return mapper.selectDictTypeAll();
    }

    /**
     * 根据字典类型查询字典数据
     *
     * @param dictType 字典类型
     * @return 字典数据集合信息
     */
    public List<SysDictData> selectDictDataByType(String dictType)
    {
        return dictDataMapper.selectDictDataByType(dictType);
    }

    /**
     * 根据字典类型ID查询信息
     *
     * @param dictId 字典类型ID
     * @return 字典类型
     */
    public SysDictType selectDictTypeById(Long dictId)
    {
        return mapper.selectDictTypeById(dictId);
    }

    /**
     * 根据字典类型查询信息
     *
     * @param dictType 字典类型
     * @return 字典类型
     */
    public SysDictType selectDictTypeByType(String dictType)
    {
        return mapper.selectDictTypeByType(dictType);
    }

    /**
     * 批量删除字典类型
     *
     * @param ids 需要删除的数据
     * @return 结果
     */
    public int deleteDictTypeByIds(String ids)
    {
        Long[] dictIds = Convert.toLongArray(ids);
        for (Long dictId : dictIds)
        {
            SysDictType dictType = selectDictTypeById(dictId);
        }
        int count = mapper.deleteDictTypeByIds(dictIds);
        return count;
    }


    /**
     * 新增保存字典类型信息
     *
     * @param dictType 字典类型信息
     * @return 结果
     */
    public int insertDictType(SysDictType dictType)
    {
        int row = mapper.insertDictType(dictType);
        return row;
    }

    /**
     * 修改保存字典类型信息
     *
     * @param dictType 字典类型信息
     * @return 结果
     */
    @Transactional(rollbackFor = Exception.class,readOnly = false)
    public int updateDictType(SysDictType dictType)
    {
        SysDictType oldDict = mapper.selectDictTypeById(dictType.getDictId());
        dictDataMapper.updateDictDataType(oldDict.getDictType(), dictType.getDictType());
        int row = mapper.updateDictType(dictType);
        return row;
    }
}
