package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.ActivityProcessDetails;
import com.highnes.attractinvestment.mapper.ActivityProcessDetailsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 流程审批-成员审批Service接口
 * 
 * @author fuly
 * @date 2020-05-25
 */
@Service
public class ActivityProcessDetailsServiceImpl extends BaseService<ActivityProcessDetailsMapper, ActivityProcessDetails> {

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public ActivityProcessDetails get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param activityProcessDetails
     * @return
     */
    @Override
    public List<ActivityProcessDetails> findList(ActivityProcessDetails activityProcessDetails){
        return super.findList(activityProcessDetails);
    }

    /**
     * 分页查询
     * @param activityProcessDetails
     * @return
     */
    @Override
    public PageInfo<ActivityProcessDetails> findPage(ActivityProcessDetails activityProcessDetails){
        return super.findPage(activityProcessDetails);
    }

    /**
     * 保存
     * @param activityProcessDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void save(ActivityProcessDetails activityProcessDetails){
        super.save(activityProcessDetails);
    }

    /**
     * 删除
     * @param activityProcessDetails
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(ActivityProcessDetails activityProcessDetails){
        super.delete(activityProcessDetails);
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
            delete(new ActivityProcessDetails(s));
        }
        return arr.length;
    }

    /**
     * 删除
     * @param processId
     */
    public void deleteByProcess(String processId){
        ActivityProcessDetails activityProcessDetails = new ActivityProcessDetails();
        activityProcessDetails.setProcessId(processId);
        mapper.deleteByProcess(activityProcessDetails);
    }
}
