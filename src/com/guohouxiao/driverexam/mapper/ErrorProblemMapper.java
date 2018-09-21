package com.guohouxiao.driverexam.mapper;

import com.guohouxiao.driverexam.model.ErrorProblem;
import com.guohouxiao.driverexam.model.ErrorProblemExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ErrorProblemMapper {

    long countByExample(ErrorProblemExample example);

    int deleteByExample(ErrorProblemExample example);

    int deleteByPrimaryKey(String id);

    int insert(ErrorProblem record);

    int insertSelective(ErrorProblem record);

    List<ErrorProblem> selectByExample(ErrorProblemExample example);

    ErrorProblem selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") ErrorProblem record, @Param("example") ErrorProblemExample example);

    int updateByExample(@Param("record") ErrorProblem record, @Param("example") ErrorProblemExample example);

    int updateByPrimaryKeySelective(ErrorProblem record);

    int updateByPrimaryKey(ErrorProblem record);

}