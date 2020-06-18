package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ProjectImages;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目画像Mapper接口
 * 
 * @author fuly
 * @date 2020-05-19
 */
@Mapper
public interface ProjectImagesMapper extends BaseMapper<ProjectImages> {

    /**
     * 删除
     * @param projectImages
     */
    void deleteByProject(ProjectImages projectImages);
}
