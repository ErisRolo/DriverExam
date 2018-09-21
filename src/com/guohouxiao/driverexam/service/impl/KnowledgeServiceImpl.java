package com.guohouxiao.driverexam.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.guohouxiao.driverexam.service.KnowledgeService;
import org.springframework.stereotype.Service;

import com.guohouxiao.driverexam.mapper.KnowledgeMapper;
import com.guohouxiao.driverexam.model.Knowledge;
import com.guohouxiao.driverexam.model.KnowledgeExample;

/**
 * 知识点
 */
@Service
public class KnowledgeServiceImpl implements KnowledgeService {

    @Resource
    private KnowledgeMapper mapper;

    @Override
    public List<Knowledge> getKnowledgeAll() {
        KnowledgeExample example = new KnowledgeExample();
        example.setOrderByClause("create_time DESC");
        return mapper.selectByExample(example);
    }

}
