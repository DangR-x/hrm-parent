package com.highnes.attractinvestment.entity;


/**
 * 【请填写功能名称】对象 industrial_images
 * 
 * @author ranlj
 * @date 2020-05-21
 */
public class IndustrialImages extends BaseEntity<IndustrialImages> {

    /**
     * 工商注册ID
     */
    private String industrialId;

    /**
     * 图片地址
     */
    private String images;


    public IndustrialImages(){
        super();
    }

    public IndustrialImages(String id){
        super(id);
    }

    public void setIndustrialId(String industrialId) {
        this.industrialId = industrialId;
    }

    public String getIndustrialId() {
        return industrialId;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getImages() {
        return images;
    }


}
