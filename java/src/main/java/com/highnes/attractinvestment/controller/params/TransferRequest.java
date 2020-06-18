package com.highnes.attractinvestment.controller.params;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * @author Rain
 * @date 2020/6/2
 * @description
 */
@ApiModel(description = "移交信息")
public class TransferRequest {
    @ApiModelProperty(name = "transferDetailsRequestList", value = "移交信息")
    private List<TransferDetailsRequest> transferDetailsRequestList;

    public List<TransferDetailsRequest> getTransferDetailsRequestList() {
        return transferDetailsRequestList;
    }

    public void setTransferDetailsRequestList(List<TransferDetailsRequest> transferDetailsRequestList) {
        this.transferDetailsRequestList = transferDetailsRequestList;
    }
}
