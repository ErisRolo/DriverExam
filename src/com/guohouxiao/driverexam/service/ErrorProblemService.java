package com.guohouxiao.driverexam.service;

import java.util.List;

import com.guohouxiao.driverexam.model.ErrorProblem;

/**
 * 错误问题统计
 */
public interface ErrorProblemService {

    public List<ErrorProblem> getUserErrorProblem(String userId);

    public ErrorProblem getUserErrorProblem(String userId, String problemId);

    public void addErrorProblem(ErrorProblem errorProblem);

    public void updateErrorProblem(ErrorProblem errorProblem);

}
