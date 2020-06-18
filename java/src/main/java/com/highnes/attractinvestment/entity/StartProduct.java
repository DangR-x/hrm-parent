package com.highnes.attractinvestment.entity;

import java.util.Date;

/**
 * 【请填写功能名称】对象 start_product
 * 
 * @author ranlj
 * @date 2020-05-26
 */
public class StartProduct extends BaseEntity<StartProduct> {

    /**
     * 实际开工时间
     */
    private Date actualDate;

    /**
     * 预计开工时间
     */
    private Date estimatedDate;

    /**
     * 实际投产时间
     */
    private Date actualproductDate;

    /**
     * 预计投产时间
     */
    private Date estimatedproductDate;

    /**
     * 实际年产值
     */
    private String actualValue;

    /**
     * 预计年产值
     */
    private String estimatedValue;

    /**
     * 实际纳税值
     */
    private String actualPayable;

    /**
     * 预计纳税值
     */
    private String estimatedPayable;

    /**
     * 项目ID
     */
    private String productId;


    public StartProduct(){
        super();
    }

    public StartProduct(String id){
        super(id);
    }

    public void setActualDate(Date actualDate) {
        this.actualDate = actualDate;
    }

    public Date getActualDate() {
        return actualDate;
    }

    public void setEstimatedDate(Date estimatedDate) {
        this.estimatedDate = estimatedDate;
    }

    public Date getEstimatedDate() {
        return estimatedDate;
    }

    public void setActualproductDate(Date actualproductDate) {
        this.actualproductDate = actualproductDate;
    }

    public Date getActualproductDate() {
        return actualproductDate;
    }

    public void setEstimatedproductDate(Date estimatedproductDate) {
        this.estimatedproductDate = estimatedproductDate;
    }

    public Date getEstimatedproductDate() {
        return estimatedproductDate;
    }

    public void setActualValue(String actualValue) {
        this.actualValue = actualValue;
    }

    public String getActualValue() {
        return actualValue;
    }

    public void setEstimatedValue(String estimatedValue) {
        this.estimatedValue = estimatedValue;
    }

    public String getEstimatedValue() {
        return estimatedValue;
    }

    public void setActualPayable(String actualPayable) {
        this.actualPayable = actualPayable;
    }

    public String getActualPayable() {
        return actualPayable;
    }

    public void setEstimatedPayable(String estimatedPayable) {
        this.estimatedPayable = estimatedPayable;
    }

    public String getEstimatedPayable() {
        return estimatedPayable;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductId() {
        return productId;
    }


}
