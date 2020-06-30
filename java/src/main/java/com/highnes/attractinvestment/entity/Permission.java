package com.highnes.attractinvestment.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Rain
 * @date 2020/6/29
 * @description
 * 权限表
 */
public class Permission implements Serializable {

    private Long id;
    //父级权限
    private Long pid;
    //权限名称
    private String name;
    //描述
    private String value;
    //图标
    private String icon;
    //几级权限
    private Integer type;
    //路径
    private String uri;
    //重要性
    private Integer status;
    //创建时间
    private Date createTime;
    //是否可用 0不可用， 1可用
    private Integer sort;

    public Permission() {
    }

    public Permission(Long id, Long pid, String name, String value, String icon, Integer type, String uri, Integer status, Date createTime, Integer sort) {
        this.id = id;
        this.pid = pid;
        this.name = name;
        this.value = value;
        this.icon = icon;
        this.type = type;
        this.uri = uri;
        this.status = status;
        this.createTime = createTime;
        this.sort = sort;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "id=" + id +
                ", pid=" + pid +
                ", name='" + name + '\'' +
                ", value='" + value + '\'' +
                ", icon='" + icon + '\'' +
                ", type=" + type +
                ", uri='" + uri + '\'' +
                ", status=" + status +
                ", createTime=" + createTime +
                ", sort=" + sort +
                '}';
    }
}
