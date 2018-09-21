package com.guohouxiao.driverexam.mapper;

import com.guohouxiao.driverexam.model.Knowledge;
import com.guohouxiao.driverexam.model.KnowledgeExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface KnowledgeMapper {

    long countByExample(KnowledgeExample example);

    int deleteByExample(KnowledgeExample example);

    int insert(Knowledge record);

    int insertSelective(Knowledge record);

    List<Knowledge> selectByExample(KnowledgeExample example);

    int updateByExampleSelective(@Param("record") Knowledge record, @Param("example") KnowledgeExample example);

    int updateByExample(@Param("record") Knowledge record, @Param("example") KnowledgeExample example);

}