package com.highnes.attractinvestment.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.entity.ProjectContract;
import com.highnes.attractinvestment.entity.ProjectContractDetails;
import com.highnes.attractinvestment.mapper.ProjectContractMapper;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.CashPolicy;
import com.highnes.attractinvestment.mapper.CashPolicyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 政策兑现Service接口
 * 
 * @author ranlj
 * @date 2020-05-26
 */
@Service
public class CashPolicyServiceImpl extends BaseService<CashPolicyMapper, CashPolicy> {

    @Autowired
    private ProjectContractMapper projectContractMapper;

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public CashPolicy get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param cashPolicy
     * @return
     */
    @Override
    public List<CashPolicy> findList(CashPolicy cashPolicy){
        return super.findList(cashPolicy);
    }

    /**
     * 分页查询
     * @param cashPolicy
     * @return
     */
    @Override
    public PageInfo<CashPolicy> findPage(CashPolicy cashPolicy){
        return super.findPage(cashPolicy);
    }

    /**
     * 保存
     * @param cashPolicy
     */
    @Override
    @Transactional(readOnly = false)
    public void save(CashPolicy cashPolicy){
        super.save(cashPolicy);
    }

    /**
     * 删除
     * @param cashPolicy
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(CashPolicy cashPolicy){
        super.delete(cashPolicy);
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
            delete(new CashPolicy(s));
        }
        return arr.length;
    }

    /**
     * 查找政策兑现
     * @param projectId
     * @return
     */
    public List<CashPolicy> queryCashPolicy(String projectId){
        ProjectContract projectContract = new ProjectContract();
        projectContract.setProjectId(projectId);
        List<CashPolicy> cashPolicies = new ArrayList<>();
        CashPolicy cashPolicy = new CashPolicy();
        CashPolicy cashPolicy1 = new CashPolicy();
        List<ProjectContract> contractList = projectContractMapper.findList(projectContract);
        for (ProjectContract projectContract1 : contractList){
            for (ProjectContractDetails projectContractDetails : projectContract1.getProjectContractDetailsList()){
                cashPolicy1.setConstructId(projectContractDetails.getContractId());
                cashPolicy = mapper.findByConstructId(cashPolicy1);
                cashPolicies.add(cashPolicy);
            }

        }
        return cashPolicies;
    }
}
