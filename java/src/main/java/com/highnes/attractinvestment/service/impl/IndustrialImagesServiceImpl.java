package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.IndustrialImages;
import com.highnes.attractinvestment.mapper.IndustrialImagesMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 【请填写功能名称】Service接口
 * 
 * @author ranlj
 * @date 2020-05-21
 */
@Service
public class IndustrialImagesServiceImpl extends BaseService<IndustrialImagesMapper, IndustrialImages> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public IndustrialImages get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param industrialImages
     * @return
     */
    @Override
    public List<IndustrialImages> findList(IndustrialImages industrialImages){
        return super.findList(industrialImages);
    }

    /**
     * 分页查询
     * @param industrialImages
     * @return
     */
    @Override
    public PageInfo<IndustrialImages> findPage(IndustrialImages industrialImages){
        return super.findPage(industrialImages);
    }

    /**
     * 保存
     * @param industrialImages
     */
    @Override
    @Transactional(readOnly = false)
    public void save(IndustrialImages industrialImages){
        super.save(industrialImages);
    }

    /**
     * 删除
     * @param industrialImages
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(IndustrialImages industrialImages){
        super.delete(industrialImages);
    }

    /**
    * 批量删除
    * @param ids
    * @return
    */
    @Transactional(readOnly = false)
    public int delete(String ids){
        String [] arr = ids.split(",");
        for (String s: arr){
            delete(new IndustrialImages(s));
        }
        return arr.length;
    }
}
