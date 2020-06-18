package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectReceptionFile;
import com.highnes.attractinvestment.mapper.ProjectReceptionFileMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目-接待详情-接待方案Service接口
 * 
 * @author fuly
 * @date 2020-05-21
 */
@Service
public class ProjectReceptionFileServiceImpl extends BaseService<ProjectReceptionFileMapper, ProjectReceptionFile> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectReceptionFile get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectReceptionFile
     * @return
     */
    @Override
    public List<ProjectReceptionFile> findList(ProjectReceptionFile projectReceptionFile){
        return super.findList(projectReceptionFile);
    }

    /**
     * 分页查询
     * @param projectReceptionFile
     * @return
     */
    @Override
    public PageInfo<ProjectReceptionFile> findPage(ProjectReceptionFile projectReceptionFile){
        return super.findPage(projectReceptionFile);
    }

    /**
     * 保存
     * @param projectReceptionFile
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectReceptionFile projectReceptionFile){
        super.save(projectReceptionFile);
    }

    /**
     * 删除
     * @param projectReceptionFile
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectReceptionFile projectReceptionFile){
        super.delete(projectReceptionFile);
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
            delete(new ProjectReceptionFile(s));
        }
        return arr.length;
    }

    /**
     * 删除
     * @param receptionId
     */
    @Transactional(readOnly = false)
    public void deleteByReception(String receptionId){
        ProjectReceptionFile projectReceptionFile = new ProjectReceptionFile();
        projectReceptionFile.setReceptionId(receptionId);
        mapper.deleteByReception(projectReceptionFile);
    }
}
