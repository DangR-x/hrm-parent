package com.highnes.attractinvestment.service.impl;

import cn.hutool.Hutool;
import com.highnes.attractinvestment.common.utils.Convert;
import com.highnes.attractinvestment.common.utils.DictUtils;
import com.highnes.attractinvestment.common.utils.StringUtils;
import com.highnes.attractinvestment.entity.BaseEntity;
import com.highnes.attractinvestment.entity.SysDictData;
import com.highnes.attractinvestment.entity.SysDictType;
import com.highnes.attractinvestment.mapper.SysDictDataMapper;
import com.highnes.attractinvestment.mapper.SysDictTypeMapper;
import com.highnes.attractinvestment.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.service.impl
 * @Author: ranlongjun
 * @CreateTime: 2020-05-14 17:41
 * @Description: 数据管理
 */
@Service
public class SysDictDataServiceImpl extends BaseService<SysDictDataMapper, SysDictData> {
    private static Lock instanceLock = new ReentrantLock();

    /**
     * 根据条件分页查询字典数据
     *
     * @param dictData 字典数据信息
     * @return 字典数据集合信息
     */
    public List<SysDictData> selectDictDataList(SysDictData dictData) {
//        SysDictType sysDictType1 = sysDictTypeMapper.selectDictTypeByType(dictData.getDictLabel());
//        SysDictData sysDictData1 = new SysDictData();
//        if (sysDictType1 != null && sysDictType1.getDictType() != null){
//            sysDictData1.setDictType(sysDictType1.getDictType());
            return mapper.selectDictDataList(dictData);
//        }else{
//            return null;
//        }

    }

    /**
     * 根据字典类型和字典键值查询字典数据信息
     *
     * @param dictType  字典类型
     * @param dictValue 字典键值
     * @return 字典标签
     */
    public String selectDictLabel(String dictType, String dictValue) {
        return mapper.selectDictLabel(dictType, dictValue);
    }

    /**
     * 根据字典数据ID查询信息
     *
     * @param dictCode 字典数据ID
     * @return 字典数据
     */
    public SysDictData selectDictDataById(Long dictCode) {
        return mapper.selectDictDataById(dictCode);
    }

    /**
     * 批量删除字典数据
     *
     * @param ids 需要删除的数据
     * @return 结果
     */
    @Transactional(readOnly = false)
    public int deleteDictDataByIds(String ids) {
        int row = mapper.deleteDictDataByIds(Convert.toStrArray(ids));
        return row;
    }

    /**
     * 新增保存字典数据信息
     *
     * @param dictData 字典数据信息
     * @return 结果
     */
    @Transactional(readOnly = false)
    public int insertDictData(SysDictData dictData) {
//        instanceLock.lock();
//        try {
//            List<SysDictData> dataList = selectDictDataList(dictData);
//            int dictSort = mapper.selectMaxDictSort(dictData);
//            if (dataList.size() <=  0) {
//                dictData.setDictSort((long) (dictSort == 0 ? 0 : dictSort+1));
//                dictData.setDictValue(String.valueOf(dictSort == 0 ? 0 : dictSort+1));
//            }
//            dictData.setDelFlag(BaseEntity.DEL_FLAG_NORMAL);
//        } catch (Exception e) {
//        } finally {
//            instanceLock.unlock();
//        }
        int row = mapper.insertDictData(dictData);
        return row;
    }

    /**
     * 修改保存字典数据信息
     *
     * @param dictData 字典数据信息
     * @return 结果
     */
    @Transactional(readOnly = false)
    public int updateDictData(SysDictData dictData) {
        int row = mapper.updateDictData(dictData);
        return row;
    }


}
