package com.highnes.attractinvestment.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.highnes.attractinvestment.common.utils.LoginUtils;
import com.highnes.attractinvestment.common.utils.StringUtils;
import com.highnes.attractinvestment.config.GlobalConfig;
import com.highnes.attractinvestment.domain.SysUserResult;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Rain
 * @date 2020年3月9日
 * @description
 */
public abstract class BaseEntity<T> implements Serializable {

  private static final long serialVersionUID = 1L;

  /**
   * 实体编号
   */
  private String id;

  /**
   * 创建人员编码
   */
  private String createBy;
  /**
   * 创建人员姓名
   */
  @Excel(name = "create_name")
  private String createName;

  /**
   * 创建时间
   */
  private Date createDate;

  /**
   * 更新人员
   */
  private String updateBy;

  /**
   * 更新时间
   */
  private Date updateDate;

  /**
   * 备注
   */
  private String remarks;

  /**
   * 是否删除：0-否，1-是
   */
  @Excel(name = "del_flag")
  private String delFlag;

  private Integer pageNo;
  private Integer pageSize;
  /**
   * 所属公司
   */
  private String officeId;

  public BaseEntity() {
    super();
    setPageNo(1);
    setPageSize(Integer.parseInt(StringUtils.isBlank(GlobalConfig.getPageSize())?"10":GlobalConfig.getPageSize()));
    setDelFlag(DEL_FLAG_NORMAL);
  }

  public BaseEntity(String id) {
    this();
    this.id = id;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  public Date getUpdateDate() {
    return updateDate;
  }

  public void setUpdateDate(Date updateDate) {
    this.updateDate = updateDate;
  }

  public String getRemarks() {
    return remarks;
  }

  public void setRemarks(String remarks) {
    this.remarks = remarks;
  }

  @JsonIgnore
  public String getDelFlag() {
    return delFlag;
  }

  public void setDelFlag(String delFlag) {
    this.delFlag = delFlag;
  }

  @Override
  public String toString() {
    return ReflectionToStringBuilder.toString(this);
  }

  public void preInsert() {
    setId(StringUtils.uuid());
    SysUserResult sysUserResult = LoginUtils.getLogin();
    if (getCreateDate() == null) {
      setCreateBy(sysUserResult.getUserId());
      setCreateName(sysUserResult.getUserName());
      setCreateDate(new Date());
    }
    setUpdateBy(sysUserResult.getUserId());
    setUpdateDate(new Date());
  }

  public void preUpdate() {
    setUpdateDate(new Date());
  }

  /**
   * 删除标记（0：正常；1：删除；2：审核；）
   */
  public static final String DEL_FLAG_NORMAL = "0";
  public static final String DEL_FLAG_DELETE = "1";
  public static final String DEL_FLAG_AUDIT = "2";

  /**
   * 单位级别标识 (0: 总单位 1：总部门 2：分部门)
   */
  public static final String HEAD_OFFICE = "0";
  public static final String HEAD_DEPT = "1";
  public static final String FOOT_DEPT = "2";

  /**
   * 状态  (0 :正常 1：异常)
   */
  public static final String NORMAL_STATUS = "0";
  public static final String UNUSUALLY_STATUS = "1";

  @JsonIgnore
  public Integer getPageNo() {
    return pageNo;
  }

  public void setPageNo(Integer pageNo) {
    this.pageNo = pageNo;
  }

  @JsonIgnore
  public Integer getPageSize() {
    return pageSize;
  }

  public void setPageSize(Integer pageSize) {
    this.pageSize = pageSize;
  }

  public String getOfficeId() {
    return officeId;
  }

  public void setOfficeId(String officeId) {
    this.officeId = officeId;
  }

  public String getCreateBy() {
    return createBy;
  }

  public void setCreateBy(String createBy) {
    this.createBy = createBy;
  }

  public String getUpdateBy() {
    return updateBy;
  }

  public void setUpdateBy(String updateBy) {
    this.updateBy = updateBy;
  }

  public String getCreateName() {
    return createName;
  }

  public void setCreateName(String createName) {
    this.createName = createName;
  }
}
