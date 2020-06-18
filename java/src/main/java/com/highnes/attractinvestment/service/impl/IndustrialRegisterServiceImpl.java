package com.highnes.attractinvestment.service.impl;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.common.utils.CopyUtils;
import com.highnes.attractinvestment.domain.IndustriallRequest;
import com.highnes.attractinvestment.entity.IndustrialImages;
import com.highnes.attractinvestment.entity.ProjectDealDetails;
import com.highnes.attractinvestment.mapper.IndustrialImagesMapper;
import com.highnes.attractinvestment.service.BaseService;
import com.highnes.attractinvestment.entity.IndustrialRegister;
import com.highnes.attractinvestment.mapper.IndustrialRegisterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 工商注册Service接口
 * 
 * @author ranlj
 * @date 2020-05-21
 */
@Service
public class IndustrialRegisterServiceImpl extends BaseService<IndustrialRegisterMapper, IndustrialRegister> {

    @Autowired
    private IndustrialImagesMapper industrialImagesMapper;

        /**
     * 根据ID获取信息
     * @param id
     * @return
     */
    @Override
    public IndustrialRegister get(String id){
        return super.get(id);
    }


    /**
     * 查询列表
     * @param industrialRegister
     * @return
     */
    @Override
    public List<IndustrialRegister> findList(IndustrialRegister industrialRegister){
        return super.findList(industrialRegister);
    }

    /**
     * 分页查询
     * @param industrialRegister
     * @return
     */
    @Override
    public PageInfo<IndustrialRegister> findPage(IndustrialRegister industrialRegister){
        return super.findPage(industrialRegister);
    }

    /**
     * 保存
     * @param industrialRegister
     */
    @Override
    @Transactional(readOnly = false)
    public void save(IndustrialRegister industrialRegister){
        super.save(industrialRegister);
    }

    /**
     * 删除
     * @param industrialRegister
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(IndustrialRegister industrialRegister){
        super.delete(industrialRegister);
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
            delete(new IndustrialRegister(s));
        }
        return arr.length;
    }

    /**
     *
     * @param industriallRequest
     * @return 保存工商详细信息
     */
    public int saveIndustrail(IndustriallRequest industriallRequest){
        save(industriallRequest);
        List<IndustrialRegister> industrialRegisterList = findList(industriallRequest);
        for (IndustrialRegister industrialRegister : industrialRegisterList){
            industriallRequest.setId(industrialRegister.getId());
        }
        for (IndustrialImages industrialImages : industriallRequest.getImagesList()){
            industrialImages.setIndustrialId(industriallRequest.getId());
            industrialImagesMapper.insert(industrialImages);
        }
        return 0;
    }

    /**
     * 查询工商管理
     * @param industrialRegister
     * @return
     */
    public IndustriallRequest selIndustrialByProjectId(IndustrialRegister industrialRegister){
        List<IndustrialRegister> industrialRegisterList = mapper.findList(industrialRegister);
        IndustriallRequest industriallRequest = new IndustriallRequest();
        if (industrialRegisterList != null && industrialRegisterList.size() > 0){
            for (IndustrialRegister industrialRegister1 : industrialRegisterList){
                IndustrialImages industrialImages = new IndustrialImages();
                industrialImages.setIndustrialId(industrialRegister1.getProjectId());
                //父类赋值给子类
                CopyUtils.fatherToChild(industrialRegister1,industriallRequest);
                industriallRequest.setImagesList(industrialImagesMapper.findList(industrialImages));
            }
        }
        return industriallRequest;
    }

    /**
     * 修改工商管理
     * @param industriallRequest
     * @return
     */
    public int updIndustriall(IndustriallRequest industriallRequest){
        mapper.update(industriallRequest);
        for (IndustrialImages industrialImages : industriallRequest.getImagesList()){
            industrialImagesMapper.update(industrialImages);
        }
        return 0;
    }

    /**
     * 删除工商管理
     * @param industriallRequest
     * @return
     */
    public int deleteIndustriall(IndustriallRequest industriallRequest){
        mapper.delete(industriallRequest);
        industrialImagesMapper.deletefromIndustrialId(industriallRequest.getProjectId());
        return 0;
    }
}
