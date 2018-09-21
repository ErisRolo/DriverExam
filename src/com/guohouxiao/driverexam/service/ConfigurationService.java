package com.guohouxiao.driverexam.service;

import com.guohouxiao.driverexam.model.Configuration;

/**
 * 配置
 */
public interface ConfigurationService {

    public Configuration getConfiguration();

    public void addConfiguration(Configuration configuration);

    public void updateConfiguration(Configuration configuration);

}
