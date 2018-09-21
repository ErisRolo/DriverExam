package com.guohouxiao.driverexam.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.guohouxiao.driverexam.service.ErrorProblemService;
import org.springframework.stereotype.Service;

import com.guohouxiao.driverexam.mapper.ErrorProblemMapper;
import com.guohouxiao.driverexam.model.ErrorProblem;
import com.guohouxiao.driverexam.model.ErrorProblemExample;

/**
 * 错误问题统计
 */
@Service
public class ErrorProblemServiceImpl implements ErrorProblemService {

    @Resource
    private ErrorProblemMapper mapper;

    @Override
    public List<ErrorProblem> getUserErrorProblem(String userId) {
        ErrorProblemExample example = new ErrorProblemExample();
        ErrorProblemExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(userId);
        example.setOrderByClause("count DESC");
        return mapper.selectByExample(example);
    }

    @Override
    public ErrorProblem getUserErrorProblem(String userId, String problemId) {
        ErrorProblemExample example = new ErrorProblemExample();
        ErrorProblemExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(userId);
        criteria.andProblemIdEqualTo(problemId);
        example.setOrderByClause("count DESC");
        List<ErrorProblem> list = mapper.selectByExample(example);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public void addErrorProblem(ErrorProblem errorProblem) {
        mapper.insert(errorProblem);
    }

    @Override
    public void updateErrorProblem(ErrorProblem errorProblem) {
        mapper.updateByPrimaryKey(errorProblem);
    }

}
