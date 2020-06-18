package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author Rain
 * @date 2020/6/1
 * @description
 */
@ApiModel(description = "数据字典")
public class DictDataRequest {
    @ApiModelProperty(name = "dictCode", example = "字典编码", position = 1)
    private Long dictCode;

    @ApiModelProperty(name = "dictSort", example = "字典排序", position = 5)
    private Long dictSort;

    @ApiModelProperty(name = "dictLabel", example = "字典标签", position = 2)
    private String dictLabel;

    @ApiModelProperty(name = "dictValue", example = "字典键值", position = 3)
    private String dictValue;

    @ApiModelProperty(name = "dictType", example = "字典类型", position = 4)
    private String dictType;

    /**
     * 字典编码
     */
    public Long getDictCode() {
        return dictCode;
    }

    public void setDictCode(Long dictCode) {
        this.dictCode = dictCode;
    }

    /**
     * 字典排序
     */
    public Long getDictSort() {
        return dictSort;
    }

    public void setDictSort(Long dictSort) {
        this.dictSort = dictSort;
    }

    /**
     * 字典标签
     */
    public String getDictLabel() {
        return dictLabel;
    }

    public void setDictLabel(String dictLabel) {
        this.dictLabel = dictLabel;
    }

    /**
     * 字典键值
     */
    public String getDictValue() {
        return dictValue;
    }

    public void setDictValue(String dictValue) {
        this.dictValue = dictValue;
    }

    /**
     * 字典类型
     */
    public String getDictType() {
        return dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType;
    }
}
