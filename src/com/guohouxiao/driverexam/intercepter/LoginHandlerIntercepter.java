package com.guohouxiao.driverexam.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 拦截器
 */
public class LoginHandlerIntercepter extends HandlerInterceptorAdapter {

    private static final Logger logger = LogManager.getLogger(LoginHandlerIntercepter.class);

    private static final String[] IGNORE_URI = {"/login.do", "/logout.do", "/register.do", "/authority.do", "/home.do"};

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        String type = (String) request.getSession().getAttribute("type");

        for (String s : IGNORE_URI) {
            if (uri.contains(s)) {
                return true;
            }
        }
        Object user = request.getSession().getAttribute("loguser");
        if (user == null) {
            logger.info("Session已失效，请重新登录。");
            response.setCharacterEncoding("UTF-8");
            response.sendRedirect("login.do");
            return false;
        } else {
            if (uri.contains(type)) {
                return true;
            } else {
                logger.info("当前用户没有权限访问此请求。");
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("authority.do");
                return false;
            }
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

}