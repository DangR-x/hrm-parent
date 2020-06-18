package com.highnes.attractinvestment.entity;

import java.io.Serializable;

/**
 * @BelongsProject: attractinvestment
 * @BelongsPackage: com.highnes.attractinvestment.entity
 * @Author: ranlongjun
 * @CreateTime: 2020-05-15 11:41
 * @Description: 知识管理
 */
public class KnowledgeManage extends BaseEntity  implements Serializable {

    /**
     * 知识类型
     */
    private String knowledgeType;

    /**
     * 知识内容
     */
    private String text;

    /**
     * 附件
     */
    private String enclosure;

    public String getKnowledgeType() {
        return knowledgeType;
    }

    public void setKnowledgeType(String knowledgeType) {
        this.knowledgeType = knowledgeType;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getEnclosure() {
        return enclosure;
    }

    public void setEnclosure(String enclosure) {
        this.enclosure = enclosure;
    }
}
