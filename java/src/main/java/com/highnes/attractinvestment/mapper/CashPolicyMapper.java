package com.highnes.attractinvestment.mapper;

import com.highnes.attractinvestment.entity.CashPolicy;
import org.apache.ibatis.annotations.Mapper;

/**
 * 政策兑现Mapper接口
 * 
 * @author ranlj
 * @date 2020-05-26
 */
@Mapper
public interface CashPolicyMapper extends BaseMapper<CashPolicy> {

    /**
     * 通过合同编号查找
     * @param cashPolicy
     * @return
     */
    CashPolicy findByConstructId(CashPolicy cashPolicy);
}
