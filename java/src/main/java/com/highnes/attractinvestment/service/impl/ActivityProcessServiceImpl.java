package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.config.GlobalConfig;
import com.highnes.attractinvestment.entity.ActivityProcessDetails;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ActivityProcess;
import com.highnes.attractinvestment.mapper.ActivityProcessMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 流程设置Service接口
 * 
 * @author fuly
 * @date 2020-05-25
 */
@Service
public class ActivityProcessServiceImpl extends BaseService<ActivityProcessMapper, ActivityProcess> {

    @Autowired
    private ActivityProcessDetailsServiceImpl activityProcessDetailsService;

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ActivityProcess get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param activityProcess
     * @return
     */
    @Override
    public List<ActivityProcess> findList(ActivityProcess activityProcess){
        return super.findList(activityProcess);
    }

    /**
     * 查询详情
     * @param activityProcess
     * @return
     */
    public ActivityProcess findDetails(ActivityProcess activityProcess){
        if (GlobalConfig.ACTIVITY_TYPE_2.equals(activityProcess.getType())){
            ActivityProcessDetails activityProcessDetails = new ActivityProcessDetails();
            activityProcessDetails.setProcessId(activityProcess.getId());
            activityProcess.setActivityProcessDetailsList(activityProcessDetailsService.findList(activityProcessDetails));
        }
        return activityProcess;
    }

    /**
     * 分页查询
     * @param activityProcess
     * @return
     */
    @Override
    public PageInfo<ActivityProcess> findPage(ActivityProcess activityProcess){
        return super.findPage(activityProcess);
    }

    /**
     * 保存
     * @param activityProcess
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ActivityProcess activityProcess){
        super.save(activityProcess);
    }

    /**
     * 保存
     * @param activityProcess
     */
    @Transactional(readOnly = false)
    public void saveDetails(ActivityProcess activityProcess){
        super.save(activityProcess);
        // 成员审批
        if (GlobalConfig.ACTIVITY_TYPE_2.equals(activityProcess.getType())){
            // 删除详情
            activityProcessDetailsService.deleteByProcess(activityProcess.getId());
            // 保存
            if (activityProcess.getActivityProcessDetailsList() != null && activityProcess.getActivityProcessDetailsList().size() > 0){
                for (ActivityProcessDetails activityProcessDetails : activityProcess.getActivityProcessDetailsList()) {
                    activityProcessDetails.setProcessId(activityProcess.getId());
                    activityProcessDetailsService.save(activityProcessDetails);
                }
            }
        }
    }

    /**
     * 删除
     * @param activityProcess
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ActivityProcess activityProcess){
        super.delete(activityProcess);
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
            delete(new ActivityProcess(s));
        }
        return arr.length;
    }
}
