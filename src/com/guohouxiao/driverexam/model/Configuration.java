package com.guohouxiao.driverexam.model;

import java.io.Serializable;
import java.util.Date;

public class Configuration implements Serializable {

    /**
     * 配置ID
     */
    private String id;

    /**
     * 简单比例系数
     */
    private Integer simple;

    /**
     * 中等比例系数
     */
    private Integer medium;

    /**
     * 困难比例系数
     */
    private Integer difficulty;

    /**
     * 知识点
     */
    private String knowledge;

    /**
     * 操作者
     */
    private String operator;

    /**
     * 更新时间
     */
    private Date dateTime;

    /**
     * configuration
     */
    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getSimple() {
        return simple;
    }

    public void setSimple(Integer simple) {
        this.simple = simple;
    }

    public Integer getMedium() {
        return medium;
    }

    public void setMedium(Integer medium) {
        this.medium = medium;
    }

    public Integer getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(Integer difficulty) {
        this.difficulty = difficulty;
    }

    public String getKnowledge() {
        return knowledge;
    }

    public void setKnowledge(String knowledge) {
        this.knowledge = knowledge == null ? null : knowledge.trim();
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", simple=").append(simple);
        sb.append(", medium=").append(medium);
        sb.append(", difficulty=").append(difficulty);
        sb.append(", knowledge=").append(knowledge);
        sb.append(", operator=").append(operator);
        sb.append(", dateTime=").append(dateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

}