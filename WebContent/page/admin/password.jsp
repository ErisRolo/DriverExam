<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pagePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改密码</title>
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
            <li><a href="${pagePath}/admin_problem.do">题库管理<i class="im-file3"></i></a></li>
            <li><a href="${pagePath}/admin_configuration.do">配置管理<i class="im-cogs"></i></a></li>
            <li><a class="active" href="${pagePath}/admin_password.do">密码修改<i class="br-locked"></i></a></li>
        </ul>
    </div>
</div>
<div id="content">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 heading">
                <h1 class="page-header">
                    <i class="br-locked"></i> 修改密码
                </h1>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">修改密码</h4>
                        </div>
                        <div class="panel-body" style="height: 550px; padding-top: 100px;">
                            <div class="bg-white">
                                <form class="form-horizontal" action="${pagePath}/admin_password.do" method="post"
                                      onsubmit="return checkValue();">
                                    <div class="form-group">
                                        <div class="col-md-offset-4 col-md-4"
                                             style="font-size: 30px; text-align: center;">修改密码
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-offset-4 col-md-4" align="center">
                                            <span style="color: red; font-weight: bold; font-size: 17px;">${message}</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-md-4 control-label">原密码</label>
                                        <div class="col-md-4">
                                            <input class="form-control" type="password" id="password" name="password"
                                                   placeholder="请输入原密码" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="newPassword" class="col-md-4 control-label">新密码</label>
                                        <div class="col-md-4">
                                            <input class="form-control" type="password" id="newPassword"
                                                   name="newPassword" placeholder="请输入新密码" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="newPassword2" class="col-md-4 control-label">确认密码</label>
                                        <div class="col-md-4">
                                            <input class="form-control" type="password" id="newPassword2"
                                                   name="newPassword2" placeholder="请确认新密码" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-offset-4 col-md-4">
                                            <button class="btn btn-primary col-md-12" type="submit">提 交</button>
                                        </div>
                                    </div>
                                </form>
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
    function checkValue() {
        if ($("#password").val() == $("#newPassword").val() || $("#password").val() == $("#newPassword2").val()) {
            alert("新密码与旧密码不能相同");
            return false;
        } else if ($("#newPassword").val() != $("#newPassword2").val()) {
            alert("两次新密码不一致");
            return false;
        } else {
            return true;
        }
    }
</script>
</body>
</html>