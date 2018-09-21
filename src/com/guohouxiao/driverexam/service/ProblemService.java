package com.guohouxiao.driverexam.service;

import java.util.List;

import com.guohouxiao.driverexam.model.Problem;

/**
 * 题库
 */
public interface ProblemService {

    public List<Problem> getProblemAll();

    public List<Problem> getProblemAll(String difficulty);

    public Problem getProblem(String id);

    public void addProblem(Problem problem);

    public void updateProblem(Problem problem);

    public void deleteProblem(String id);

}
