package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.StartProduct;
import com.highnes.attractinvestment.mapper.StartProductMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 【请填写功能名称】Service接口
 * 
 * @author ranlj
 * @date 2020-05-26
 */
@Service
public class StartProductServiceImpl extends BaseService<StartProductMapper, StartProduct> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public StartProduct get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param startProduct
     * @return
     */
    @Override
    public List<StartProduct> findList(StartProduct startProduct){
        return super.findList(startProduct);
    }

    /**
     * 分页查询
     * @param startProduct
     * @return
     */
    @Override
    public PageInfo<StartProduct> findPage(StartProduct startProduct){
        return super.findPage(startProduct);
    }

    /**
     * 保存
     * @param startProduct
     */
    @Override
    @Transactional(readOnly = false)
    public void save(StartProduct startProduct){
        // 删除之前的数据
        deleteByProject(startProduct.getProductId());
        super.save(startProduct);
    }

    /**
     * 删除
     * @param startProduct
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(StartProduct startProduct){
        super.delete(startProduct);
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
            delete(new StartProduct(s));
        }
        return arr.length;
    }

    /**
     * 删除
     * @param productId
     */
    @Transactional(readOnly = false)
    public void deleteByProject(String productId){
        StartProduct startProduct = new StartProduct();
        startProduct.setProductId(productId);
        mapper.deleteByProject(startProduct);
    }
}
