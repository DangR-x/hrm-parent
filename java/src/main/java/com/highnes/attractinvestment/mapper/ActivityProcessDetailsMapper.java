package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.ActivityProcessDetails;
import org.apache.ibatis.annotations.Mapper;

/**
 * 流程审批-成员审批Mapper接口
 * 
 * @author fuly
 * @date 2020-05-25
 */
@Mapper
public interface ActivityProcessDetailsMapper extends BaseMapper<ActivityProcessDetails> {

    /**
     * 删除
     * @param activityProcessDetails
     */
    void deleteByProcess(ActivityProcessDetails activityProcessDetails);

}
