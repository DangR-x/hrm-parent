package com.highnes.attractinvestment.service.impl;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.entity.ProjectPersonnelResume;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectPersonnelInfo;
import com.highnes.attractinvestment.mapper.ProjectPersonnelInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 项目-人才信息Service接口
 *
 * @author fluy
 * @date 2020-05-19
 */
@Service
public class ProjectPersonnelInfoServiceImpl extends BaseService<ProjectPersonnelInfoMapper, ProjectPersonnelInfo> {

    @Autowired
    private ProjectPersonnelResumeServiceImpl projectPersonnelResumeService;

    /**
     * 根据ID获取信息
     *
     * @param id
     * @return
     */
    @Override
    public ProjectPersonnelInfo get(String id) {
        return super.get(id);
    }


    /**
     * 查询列表
     *
     * @param projectPersonnelInfo
     * @return
     */
    @Override
    public List<ProjectPersonnelInfo> findList(ProjectPersonnelInfo projectPersonnelInfo) {
        return super.findList(projectPersonnelInfo);
    }

    /**
     * 查询详情
     * @param projectPersonnelInfo
     * @return
     */
    public List<ProjectPersonnelInfo> findListDetails(ProjectPersonnelInfo projectPersonnelInfo) {
        List<ProjectPersonnelInfo> projectPersonnelInfoList = super.findList(projectPersonnelInfo);
        if (projectPersonnelInfoList != null && projectPersonnelInfoList.size() > 0){
            for (ProjectPersonnelInfo personnelInfo : projectPersonnelInfoList) {
                ProjectPersonnelResume projectPersonnelResume = new ProjectPersonnelResume();
                projectPersonnelResume.setPersonnelId(personnelInfo.getId());
                personnelInfo.setProjectPersonnelResumeList(projectPersonnelResumeService.findList(projectPersonnelResume));
            }
        }
        return super.findList(projectPersonnelInfo);
    }

    /**
     * 分页查询
     *
     * @param projectPersonnelInfo
     * @return
     */
    @Override
    public PageInfo<ProjectPersonnelInfo> findPage(ProjectPersonnelInfo projectPersonnelInfo) {
        return super.findPage(projectPersonnelInfo);
    }

    /**
     * 保存
     *
     * @param projectPersonnelInfo
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectPersonnelInfo projectPersonnelInfo) {
        super.save(projectPersonnelInfo);
    }

    @Transactional(readOnly = false)
    public void saveProject(List<ProjectPersonnelInfo> projectPersonnelInfoList, String projectId){
        // 删除
        deleteByProject(projectId);
        // 保存
        saveBatch(projectPersonnelInfoList);
    }

    @Transactional(readOnly = false)
    public void saveBatch(List<ProjectPersonnelInfo> projectPersonnelInfoList){
        projectPersonnelInfoList.forEach(projectPersonnelInfo -> {
            saveDetails(projectPersonnelInfo);
        });
    }

    /**
     * 批量删除
     * @param projectId
     */
    @Transactional(readOnly = false)
    public void deleteByProject(String projectId){
        ProjectPersonnelInfo projectPersonnelInfo = new ProjectPersonnelInfo();
        projectPersonnelInfo.setProjectId(projectId);
        List<ProjectPersonnelInfo> projectPersonnelInfoList = findList(projectPersonnelInfo);
        projectPersonnelInfoList.forEach(info ->{
            mapper.deleteByProject(info);
            projectPersonnelResumeService.deleteByPersonnel(info.getId());
        });
    }


    /**
     * 保存人才信息
     * @param projectPersonnelInfo
     */
    @Transactional(readOnly = false)
    public void saveDetails(ProjectPersonnelInfo projectPersonnelInfo){
        save(projectPersonnelInfo);
        // 删除简历信息
        projectPersonnelResumeService.deleteByPersonnel(projectPersonnelInfo.getId());
        // 新增简历信息
        if (projectPersonnelInfo.getProjectPersonnelResumeList() != null && projectPersonnelInfo.getProjectPersonnelResumeList().size() > 0){
            projectPersonnelInfo.getProjectPersonnelResumeList().forEach(projectPersonnelResume -> {
                projectPersonnelResume.setPersonnelId(projectPersonnelInfo.getId());
                projectPersonnelResumeService.save(projectPersonnelResume);
            });
        }
    }

    /**
     * 删除
     *
     * @param projectPersonnelInfo
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectPersonnelInfo projectPersonnelInfo) {
        super.delete(projectPersonnelInfo);
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @Transactional(readOnly = false)
    public int delete(String ids) {
        String[] arr = ids.split(",");
        for (String s : arr) {
            delete(new ProjectPersonnelInfo(s));
        }
        return arr.length;
    }
}
