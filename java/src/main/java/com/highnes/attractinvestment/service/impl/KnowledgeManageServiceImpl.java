package com.highnes.attractinvestment.service.impl;

import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.entity.KnowledgeManage;
import com.highnes.attractinvestment.mapper.KnowledgeMapper;
import com.highnes.attractinvestment.service.BaseService;
import org.springframework.stereotype.Service;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.service.impl
 * @Author: ranlongjun
 * @CreateTime: 2020-05-15 14:34
 * @Description: 知识管理
 */
@Service
public class KnowledgeManageServiceImpl extends BaseService<KnowledgeMapper,KnowledgeManage> {

    @Override
    public PageInfo<KnowledgeManage> findPage(KnowledgeManage entity) {
        return super.findPage(entity);
    }

    @Override
    public void save(KnowledgeManage entity) {
        super.save(entity);
    }

    @Override
    public void delete(KnowledgeManage entity) {
        super.delete(entity);
    }
}
