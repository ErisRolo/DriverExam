<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pagePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎登录</title>
    <link href="${pagePath}/page/static/css/icons.css" rel="stylesheet"/>
    <link href="${pagePath}/page/static/css/bootstrap.css" rel="stylesheet"/>
    <link href="${pagePath}/page/static/css/plugins.css" rel="stylesheet"/>
    <link href="${pagePath}/page/static/css/main.css" rel="stylesheet"/>
</head>
<body class="login-page">
<div id="login" class="animated bounceIn">
    <div style="width: 100%; height: 50px; font-size: 35px; color: white; font-weight: bold; text-align: center; margin-top: -75px; margin-bottom: 50px;">
        驾校在线考试系统
    </div>
    <div class="login-wrapper">
        <ul id="myTab" class="nav nav-tabs nav-justified bn">
            <li><a href="${pagePath}/login.do" data-toggle="tab">欢迎登录</a></li>
        </ul>
        <div id="myTabContent" class="tab-content bn">
            <div class="tab-pane fade active in" id="log-in" style="padding-bottom: 30px;">
                <div class="seperator" style="margin-bottom: -15px;">
                    <hr>
                    <span style="color: red; font-size: 20px;">${message}</span>
                </div>
                <form class="form-horizontal mt10" action="${pagePath}/login.do" method="post" id="login-form"
                      role="form">
                    <div class="form-group">
                        <div class="col-md-12">
                            <select name="role" id="role" class="form-control left-icon">
                                <c:if test="${empty role || role eq '普通用户'}">
                                    <option value="普通用户" selected="selected">普通用户</option>
                                    <option value="管理员">管理员</option>
                                </c:if>
                                <c:if test="${role eq '管理员'}">
                                    <option value="普通用户">普通用户</option>
                                    <option value="管理员" selected="selected">管理员</option>
                                </c:if>
                            </select> <i class="im-github2 s16 left-input-icon"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" name="username" id="username" class="form-control left-icon"
                                   value="${username}" placeholder="用户名" required="required"> <i
                                class="ec-user s16 left-input-icon"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="password" name="password" id="password" class="form-control left-icon"
                                   placeholder="密码" required="required"> <i class="ec-locked s16 left-input-icon"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6" align="left">
                            <span class="help-block"><a href="${pagePath}/register.do"
                                                        style="cursor: pointer; text-decoration: none;"><small>没有账号？立即注册</small></a></span>
                        </div>
                        <div class="col-md-6" align="right">
                            <span class="help-block"><a href="javascript:alert('请联系管理员重置密码')"
                                                        style="cursor: pointer; text-decoration: none;"><small>忘记密码?</small></a></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <button class="btn btn-success col-md-12 col-sm-12 col-xs-12" type="submit">登录</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${pagePath}/page/static/js/pace.min.js"></script>
<script src="${pagePath}/page/static/js/jquery.min.js"></script>
<script src="${pagePath}/page/static/js/bootstrap.js"></script>
<script src="${pagePath}/page/static/js/jquery.icheck.js"></script>
<script src="${pagePath}/page/static/js/jquery.validate.js"></script>
<script src="${pagePath}/page/static/js/additional-methods.min.js"></script>
<script src="${pagePath}/page/static/js/login.js"></script>
</body>
</html>