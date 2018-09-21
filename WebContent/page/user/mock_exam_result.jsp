<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pagePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>模拟考试结果</title>
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
                <a class="navbar-brand" href="${pagePath}/user_index.do"> <span class="text-slogan"><i
                        class="im-joomla text-logo-element animated bounceIn" style="color: white;"></i>驾校在线考试系统</span>
                </a>
            </div>
            <nav class="top-nav" role="navigation">
                <ul class="nav navbar-nav pull-left">
                    <li><a href="${pagePath}/user_info.do"> <img class="user-avatar"
                                                                 src="${pagePath}/page/static/img/user.png"
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
            <li><a href="${pagePath}/user_index.do">当前时间<i class="ec-clock"></i></a></li>
            <li><a href="${pagePath}/user_info.do">个人资料<i class="en-vcard"></i></a></li>
            <li><a href="${pagePath}/user_practice.do">顺序练习<i class="ec-pencil"></i></a></li>
            <li><a class="active" href="${pagePath}/user_mockExam.do">模拟考试<i class="im-file3"></i></a></li>
            <li><a href="${pagePath}/user_errorProblem.do">错题统计<i class="im-stats"></i></a></li>
            <li><a href="${pagePath}/user_password.do">密码修改<i class="br-locked"></i></a></li>
        </ul>
    </div>
</div>
<div id="content">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 heading">
                <h1 class="page-header">
                    <i class="im-file3"></i> 模拟考试
                </h1>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">考试结果</h4>
                        </div>
                        <div class="panel-body" style="height: 550px;">
                            <div class="col-md-offset-4 col-md-4"
                                 style="font-size: 30px; text-align: center; padding: 75px;">
                                模拟考试得分：<span style="color: red;"><fmt:formatNumber type="number" value="${score}"
                                                                                   pattern="0.00"
                                                                                   maxFractionDigits="2"/></span>&nbsp;分
                            </div>
                            <div class="col-md-offset-4 col-md-8">
                                <h3>
                                    错题：<span style="color: red;">${error}
                                <c:if test="${empty error}">无</c:if>
										</span>
                                </h3>
                            </div>
                            <div class="col-md-offset-4 col-md-4" style="padding: 75px;">
                                <button class="btn btn-primary col-md-offset-2 col-md-8" type="button"
                                        onclick="restart()">重新考试
                                </button>
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
<script type="text/javascript">
    function restart() {
        if (confirm("您确定要重新考试吗？")) {
            window.location.href = "${pagePath}/user_mockExam.do";
        }
    }
</script>
</body>
</html>