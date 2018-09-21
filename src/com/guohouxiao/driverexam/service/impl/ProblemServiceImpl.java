package com.guohouxiao.driverexam.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.guohouxiao.driverexam.mapper.ProblemMapper;
import com.guohouxiao.driverexam.model.ProblemExample;
import org.springframework.stereotype.Service;

import com.guohouxiao.driverexam.model.Problem;
import com.guohouxiao.driverexam.service.ProblemService;

/**
 * 题库
 */
@Service
public class ProblemServiceImpl implements ProblemService {

    @Resource
    private ProblemMapper mapper;

    @Override
    public List<Problem> getProblemAll() {
        ProblemExample example = new ProblemExample();
        example.setOrderByClause("create_time DESC");
        return mapper.selectByExample(example);
    }

    @Override
    public List<Problem> getProblemAll(String difficulty) {
        ProblemExample example = new ProblemExample();
        example.setOrderByClause("create_time DESC");
        ProblemExample.Criteria criteria = example.createCriteria();
        criteria.andDifficultyEqualTo(difficulty);
        return mapper.selectByExample(example);
    }

    @Override
    public Problem getProblem(String id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public void addProblem(Problem problem) {
        mapper.insert(problem);
    }

    @Override
    public void updateProblem(Problem problem) {
        mapper.updateByPrimaryKey(problem);
    }

    @Override
    public void deleteProblem(String id) {
        mapper.deleteByPrimaryKey(id);
    }

}
