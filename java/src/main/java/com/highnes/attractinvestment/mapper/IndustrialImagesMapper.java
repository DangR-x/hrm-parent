package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.IndustrialImages;
import org.apache.ibatis.annotations.Mapper;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ranlj
 * @date 2020-05-21
 */
@Mapper
public interface IndustrialImagesMapper extends BaseMapper<IndustrialImages> {

    /**
     * 通过项目ID删除工商图片
     * @param Id
     * @return
     */
    int deletefromIndustrialId(String Id);

}
