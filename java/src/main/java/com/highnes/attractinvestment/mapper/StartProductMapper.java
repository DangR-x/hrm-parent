package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.StartProduct;
import org.apache.ibatis.annotations.Mapper;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ranlj
 * @date 2020-05-26
 */
@Mapper
public interface StartProductMapper extends BaseMapper<StartProduct> {

    /**
     * 删除
     * @param startProduct
     */
    void deleteByProject(StartProduct startProduct);

}
