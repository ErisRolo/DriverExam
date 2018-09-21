package com.guohouxiao.driverexam.test;

import java.util.UUID;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * 测试类
 */
public class Test {

    private static final Logger logger = LogManager.getLogger(Test.class);

    public static void main(String[] args) {
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        logger.info("INFO = " + uuid);
    }
}
