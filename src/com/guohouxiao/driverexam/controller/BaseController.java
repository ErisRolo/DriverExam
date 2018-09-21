package com.guohouxiao.driverexam.controller;

import com.guohouxiao.driverexam.service.ConfigurationService;
import com.guohouxiao.driverexam.service.ErrorProblemService;
import com.guohouxiao.driverexam.service.KnowledgeService;
import com.guohouxiao.driverexam.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.guohouxiao.driverexam.service.ProblemService;

/**
 * 公共
 */
@Controller
@Scope(value = "prototype")
public class BaseController {

    @Autowired
    protected ErrorProblemService errorProblemService;
    @Autowired
    protected ProblemService problemService;
    @Autowired
    protected UserService userService;
    @Autowired
    protected ConfigurationService configurationService;
    @Autowired
    protected KnowledgeService knowledgeService;

}
