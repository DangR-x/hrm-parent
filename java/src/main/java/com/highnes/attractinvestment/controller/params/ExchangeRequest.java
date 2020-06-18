package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * @author Rain
 * @date 2020/6/4
 * @description
 */
@ApiModel(description = "项目-政策兑现")
public class ExchangeRequest {

    @ApiModelProperty(name = "exchangeDetailsRequestList", value = "政策兑现")
    private List<ExchangeDetailsRequest> exchangeDetailsRequestList;

    public List<ExchangeDetailsRequest> getExchangeDetailsRequestList() {
        return exchangeDetailsRequestList;
    }

    public void setExchangeDetailsRequestList(List<ExchangeDetailsRequest> exchangeDetailsRequestList) {
        this.exchangeDetailsRequestList = exchangeDetailsRequestList;
    }
}
