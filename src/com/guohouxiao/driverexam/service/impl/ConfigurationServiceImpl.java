package com.guohouxiao.driverexam.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.guohouxiao.driverexam.mapper.ConfigurationMapper;
import com.guohouxiao.driverexam.model.ConfigurationExample;
import com.guohouxiao.driverexam.service.ConfigurationService;
import org.springframework.stereotype.Service;

import com.guohouxiao.driverexam.model.Configuration;

/**
 * 配置
 */
@Service
public class ConfigurationServiceImpl implements ConfigurationService {

    @Resource
    private ConfigurationMapper mapper;

    @Override
    public Configuration getConfiguration() {
        List<Configuration> list = mapper.selectByExample(new ConfigurationExample());
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public void addConfiguration(Configuration Configuration) {
        mapper.insert(Configuration);
    }

    @Override
    public void updateConfiguration(Configuration Configuration) {
        mapper.updateByPrimaryKey(Configuration);
    }

}
