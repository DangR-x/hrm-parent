package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectInvestigateFile;
import com.highnes.attractinvestment.mapper.ProjectInvestigateFileMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目考察信息-考察方案Service接口
 * 
 * @author fuly
 * @date 2020-05-26
 */
@Service
public class ProjectInvestigateFileServiceImpl extends BaseService<ProjectInvestigateFileMapper, ProjectInvestigateFile> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectInvestigateFile get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectInvestigateFile
     * @return
     */
    @Override
    public List<ProjectInvestigateFile> findList(ProjectInvestigateFile projectInvestigateFile){
        return super.findList(projectInvestigateFile);
    }

    /**
     * 分页查询
     * @param projectInvestigateFile
     * @return
     */
    @Override
    public PageInfo<ProjectInvestigateFile> findPage(ProjectInvestigateFile projectInvestigateFile){
        return super.findPage(projectInvestigateFile);
    }

    /**
     * 保存
     * @param projectInvestigateFile
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectInvestigateFile projectInvestigateFile){
        super.save(projectInvestigateFile);
    }

    /**
     * 删除
     * @param projectInvestigateFile
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectInvestigateFile projectInvestigateFile){
        super.delete(projectInvestigateFile);
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
            delete(new ProjectInvestigateFile(s));
        }
        return arr.length;
    }

    /**
     * 删除
     * @param investigateId
     */
    @Transactional(readOnly = false)
    public void deleteByInvestigate(String investigateId){
        ProjectInvestigateFile projectInvestigateFile = new ProjectInvestigateFile();
        projectInvestigateFile.setInvestigateId(investigateId);
        mapper.deleteByInvestigate(projectInvestigateFile);
    }
}
