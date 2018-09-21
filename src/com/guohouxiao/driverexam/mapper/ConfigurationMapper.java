package com.guohouxiao.driverexam.mapper;

import com.guohouxiao.driverexam.model.Configuration;
import com.guohouxiao.driverexam.model.ConfigurationExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ConfigurationMapper {

    long countByExample(ConfigurationExample example);

    int deleteByExample(ConfigurationExample example);

    int deleteByPrimaryKey(String id);

    int insert(Configuration record);

    int insertSelective(Configuration record);

    List<Configuration> selectByExample(ConfigurationExample example);

    Configuration selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Configuration record, @Param("example") ConfigurationExample example);

    int updateByExample(@Param("record") Configuration record, @Param("example") ConfigurationExample example);

    int updateByPrimaryKeySelective(Configuration record);

    int updateByPrimaryKey(Configuration record);

}