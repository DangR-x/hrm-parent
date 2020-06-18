package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.config.GlobalConfig;
import com.highnes.attractinvestment.entity.ProjectInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ProjectTransfer;
import com.highnes.attractinvestment.mapper.ProjectTransferMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 转办移交记录Service接口
 * 
 * @author fuly
 * @date 2020-06-02
 */
@Service
public class ProjectTransferServiceImpl extends BaseService<ProjectTransferMapper, ProjectTransfer> {

    @Autowired
    private ProjectInfoServiceImpl projectInfoService;

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ProjectTransfer get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param projectTransfer
     * @return
     */
    @Override
    public List<ProjectTransfer> findList(ProjectTransfer projectTransfer){
        return super.findList(projectTransfer);
    }

    /**
     * 分页查询
     * @param projectTransfer
     * @return
     */
    @Override
    public PageInfo<ProjectTransfer> findPage(ProjectTransfer projectTransfer){
        return super.findPage(projectTransfer);
    }

    /**
     * 保存
     * @param projectTransfer
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ProjectTransfer projectTransfer){
        super.save(projectTransfer);
    }

    /**
     * 批量保存
     * @param projectTransferList
     */
    @Transactional(readOnly = false)
    public void saveBatch(List<ProjectTransfer> projectTransferList){
        if (projectTransferList != null && projectTransferList.size() > 0){
            for (ProjectTransfer projectTransfer : projectTransferList) {
                // 获取当前项目
                ProjectInfo projectInfo = projectInfoService.get(projectTransfer.getProjectId());
                projectInfo.setTransferFlag(GlobalConfig.YES);
                projectInfo.setCreateBy(projectTransfer.getToCreateBy());
                projectInfo.setGroupId(projectTransfer.getToGroupId());
                projectInfoService.save(projectInfo);
                // 保存
                super.save(projectTransfer);
            }
        }
    }

    /**
     * 删除
     * @param projectTransfer
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ProjectTransfer projectTransfer){
        super.delete(projectTransfer);
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
            delete(new ProjectTransfer(s));
        }
        return arr.length;
    }
}
