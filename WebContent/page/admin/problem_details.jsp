<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pagePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>预览试题</title>
    <link href="${pagePath}/page/static/css/icons.css" rel="stylesheet"/>
    <link href="${pagePath}/page/static/css/bootstrap.css" rel="stylesheet"/>
    <link href="${pagePath}/page/static/css/plugins.css" rel="stylesheet"/>
    <link href="${pagePath}/page/static/css/main.css" rel="stylesheet"/>
</head>
<body>
<div id="header">
    <div class="container-fluid">
        <div class="navbar">
            <div class="navbar-header">
                <a class="navbar-brand" href="${pagePath}/admin_index.do"> <span class="text-slogan"><i
                        class="im-joomla text-logo-element animated bounceIn" style="color: white;"></i>驾校在线考试系统</span>
                </a>
            </div>
            <nav class="top-nav" role="navigation">
                <ul class="nav navbar-nav pull-left">
                    <li><a href="${pagePath}/admin_index.do"> <img class="user-avatar"
                                                                   src="${pagePath}/page/static/img/admin.png"
                                                                   alt="head img"> ${loguser.username} [${loguser.role}]
                    </a></li>
                </ul>
                <ul class="nav navbar-nav pull-right">
                    <li><a href="javascript:void(0);"><i class="ec-clock"></i> <span id="time"></span></a></li>
                    <li><a href="${pagePath}/logout.do"><i class="en-logout"></i> 退出登录</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<div id="sidebar">
    <div class="sidebar-inner">
        <ul id="sideNav" class="nav nav-pills nav-stacked">
            <li><a href="${pagePath}/admin_index.do">当前时间<i class="ec-clock"></i></a></li>
            <li><a href="${pagePath}/admin_user.do">用户管理<i class="im-users"></i></a></li>
            <li><a class="active" href="${pagePath}/admin_problem.do">题库管理<i class="im-file3"></i></a></li>
            <li><a href="${pagePath}/admin_configuration.do">配置管理<i class="im-cogs"></i></a></li>
            <li><a href="${pagePath}/admin_password.do">密码修改<i class="br-locked"></i></a></li>
        </ul>
    </div>
</div>
<div id="content">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 heading">
                <h1 class="page-header">
                    <i class="im-file3"></i> 预览试题 <a href="javascript: history.go(-1)" class="btn btn-primary"> <span
                        class="im-undo"></span> 返回
                </a>
                </h1>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">试题内容</h4>
                        </div>
                        <div class="panel-body" style="height: 550px;">
                            <div class="form-group">
                                <div class="col-md-offset-4 col-md-4"
                                     style="font-size: 30px; text-align: center; padding: 25px;">预览试题
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-3 col-md-9">
                                    <h4>Question：【${problem.difficulty}】（${problem.knowledge}）${problem.question}</h4>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-4 col-md-8">
                                    <label class="radio"> <input type="radio" name="${problem.id}"
                                                                 value="A">${problem.optionA}
                                    </label> <label class="radio"> <input type="radio" name="${problem.id}"
                                                                          value="B">${problem.optionB}
                                </label> <label class="radio"> <input type="radio" name="${problem.id}"
                                                                      value="C">${problem.optionC}
                                </label> <label class="radio"> <input type="radio" name="${problem.id}"
                                                                      value="D">${problem.optionD}
                                </label>
                                </div>
                            </div>
                            <div class="form-group" style="margin-top: 50px;">
                                <div class="col-md-offset-4 col-md-2">
                                    <button class="btn btn-success col-md-12" type="button">提交</button>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-danger col-md-12" type="button">返回</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pagePath}/page/static/js/pace.min.js"></script>
<script src="${pagePath}/page/static/js/jquery.min.js"></script>
<script src="${pagePath}/page/static/js/bootstrap.js"></script>
<script src="${pagePath}/page/static/js/time.js"></script>
</body>
</html>