package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectImages;
import com.highnes.attractinvestment.mapper.ProjectImagesMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目画像Service接口
 * 
 * @author fuly
 * @date 2020-05-19
 */
@Service
public class ProjectImagesServiceImpl extends BaseService<ProjectImagesMapper, ProjectImages> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectImages get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectImages
     * @return
     */
    @Override
    public List<ProjectImages> findList(ProjectImages projectImages){
        return super.findList(projectImages);
    }

    /**
     * 分页查询
     * @param projectImages
     * @return
     */
    @Override
    public PageInfo<ProjectImages> findPage(ProjectImages projectImages){
        return super.findPage(projectImages);
    }

    /**
     * 保存
     * @param projectImages
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectImages projectImages){
        super.save(projectImages);
    }

    /**
     * 批量保存
     * @param projectImagesList
     * @param projectId
     */
    @Transactional(readOnly = false)
    public void saveBatch(List<ProjectImages> projectImagesList, String projectId){
        // 删除
        deleteByProject(projectId);
        for (ProjectImages projectImages : projectImagesList) {
            save(projectImages);
        }
    }

    /**
     * 删除
     * @param projectImages
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectImages projectImages){
        super.delete(projectImages);
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
            delete(new ProjectImages(s));
        }
        return arr.length;
    }

    /**
     * 删除
     * @param projectId
     */
    @Transactional(readOnly = false)
    public void deleteByProject(String projectId){
        ProjectImages projectImages = new ProjectImages();
        projectImages.setProjectId(projectId);
        mapper.deleteByProject(projectImages);
    }
}
