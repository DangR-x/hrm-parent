package com.highnes.attractinvestment.domain;

import com.highnes.attractinvestment.entity.IndustrialImages;
import com.highnes.attractinvestment.entity.IndustrialRegister;

import java.util.List;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.domain
 * @Author: ranlongjun
 * @CreateTime: 2020-05-25 16:53
 * @Description: 投促管理
 */
public class IndustriallRequest extends IndustrialRegister {

    /**
     * 工商执照
     */
    private List<IndustrialImages> imagesList;

    public List<IndustrialImages> getImagesList() {
        return imagesList;
    }

    public void setImagesList(List<IndustrialImages> imagesList) {
        this.imagesList = imagesList;
    }
}
