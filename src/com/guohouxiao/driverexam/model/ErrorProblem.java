package com.guohouxiao.driverexam.model;

import java.io.Serializable;
import java.util.Date;

public class ErrorProblem implements Serializable {

    /**
     * 错题统计ID
     */
    private String id;

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 题目ID
     */
    private String problemId;

    /**
     * 难度系数
     */
    private String difficulty;

    /**
     * 知识点
     */
    private String knowledge;

    /**
     * 问题
     */
    private String question;

    /**
     * 答案
     */
    private String answer;

    /**
     * 次数
     */
    private Integer count;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * error_problem
     */
    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getProblemId() {
        return problemId;
    }

    public void setProblemId(String problemId) {
        this.problemId = problemId == null ? null : problemId.trim();
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty == null ? null : difficulty.trim();
    }

    public String getKnowledge() {
        return knowledge;
    }

    public void setKnowledge(String knowledge) {
        this.knowledge = knowledge == null ? null : knowledge.trim();
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question == null ? null : question.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userId=").append(userId);
        sb.append(", problemId=").append(problemId);
        sb.append(", difficulty=").append(difficulty);
        sb.append(", knowledge=").append(knowledge);
        sb.append(", question=").append(question);
        sb.append(", answer=").append(answer);
        sb.append(", count=").append(count);
        sb.append(", createTime=").append(createTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

}