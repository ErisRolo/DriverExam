package com.guohouxiao.driverexam.mapper;

import com.guohouxiao.driverexam.model.Problem;
import com.guohouxiao.driverexam.model.ProblemExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ProblemMapper {

    long countByExample(ProblemExample example);

    int deleteByExample(ProblemExample example);

    int deleteByPrimaryKey(String id);

    int insert(Problem record);

    int insertSelective(Problem record);

    List<Problem> selectByExample(ProblemExample example);

    Problem selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Problem record, @Param("example") ProblemExample example);

    int updateByExample(@Param("record") Problem record, @Param("example") ProblemExample example);

    int updateByPrimaryKeySelective(Problem record);

    int updateByPrimaryKey(Problem record);

}