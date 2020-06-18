package com.highnes.attractinvestment.controller.params;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author Rain
 * @date 2020/6/3
 * @description
 */
@ApiModel(description = "开工投产")
public class StartProductRequest {
    @ApiModelProperty(name = "actualDate", example = "实际开工时间，yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date actualDate;

    @ApiModelProperty(name = "estimatedDate", example = "预计开工时间，yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date estimatedDate;

    @ApiModelProperty(name = "actualproductDate", example = "实际投产时间，yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date actualproductDate;

    @ApiModelProperty(name = "estimatedproductDate", example = "预计投产时间，yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date estimatedproductDate;

    @ApiModelProperty(name = "actualValue", example = "实际年产值")
    private String actualValue;

    @ApiModelProperty(name = "estimatedValue", example = "预计年产值")
    private String estimatedValue;

    @ApiModelProperty(name = "actualPayable", example = "实际纳税值")
    private String actualPayable;

    @ApiModelProperty(name = "estimatedPayable", example = "预计纳税值")
    private String estimatedPayable;

    @ApiModelProperty(name = "productId", example = "投产编码")
    private String productId;
    @ApiModelProperty(name = "projectId", example = "项目编码")
    private String projectId;

    /**
     * 实际开工时间
     */
    public Date getActualDate() {
        return actualDate;
    }

    public void setActualDate(Date actualDate) {
        this.actualDate = actualDate;
    }

    /**
     * 预计开工时间
     */
    public Date getEstimatedDate() {
        return estimatedDate;
    }

    public void setEstimatedDate(Date estimatedDate) {
        this.estimatedDate = estimatedDate;
    }

    /**
     * 实际投产时间
     */
    public Date getActualproductDate() {
        return actualproductDate;
    }

    public void setActualproductDate(Date actualproductDate) {
        this.actualproductDate = actualproductDate;
    }

    /**
     * 预计投产时间
     */
    public Date getEstimatedproductDate() {
        return estimatedproductDate;
    }

    public void setEstimatedproductDate(Date estimatedproductDate) {
        this.estimatedproductDate = estimatedproductDate;
    }

    /**
     * 实际年产值
     */
    public String getActualValue() {
        return actualValue;
    }

    public void setActualValue(String actualValue) {
        this.actualValue = actualValue;
    }

    /**
     * 预计年产值
     */
    public String getEstimatedValue() {
        return estimatedValue;
    }

    public void setEstimatedValue(String estimatedValue) {
        this.estimatedValue = estimatedValue;
    }

    /**
     * 实际纳税值
     */
    public String getActualPayable() {
        return actualPayable;
    }

    public void setActualPayable(String actualPayable) {
        this.actualPayable = actualPayable;
    }

    /**
     * 预计纳税值
     */
    public String getEstimatedPayable() {
        return estimatedPayable;
    }

    public void setEstimatedPayable(String estimatedPayable) {
        this.estimatedPayable = estimatedPayable;
    }

    /**
     * 项目ID
     */
    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }
}
