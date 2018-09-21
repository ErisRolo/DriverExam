<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pagePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改信息</title>
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
            <li><a class="active" href="${pagePath}/user_info.do">个人资料<i class="en-vcard"></i></a></li>
            <li><a href="${pagePath}/user_practice.do">顺序练习<i class="ec-pencil"></i></a></li>
            <li><a href="${pagePath}/user_mockExam.do">模拟考试<i class="im-file3"></i></a></li>
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
                    <i class="en-vcard"></i> 修改资料
                </h1>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">编辑个人资料</h4>
                        </div>
                        <div class="panel-body" style="height: 550px; padding-top: 55px;">
                            <form class="form-horizontal" action="${pagePath}/user_modifyUserSave.do" method="post">
                                <div class="form-group">
                                    <div class="col-md-offset-4 col-md-4" style="font-size: 30px; text-align: center;">
                                        修改个人资料
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-offset-4 col-md-4" align="center">
                                        <span style="color: red; font-weight: bold; font-size: 17px;">${message}</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="username" class="col-md-4 control-label">用户名</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" value="${user.username}"
                                               readonly="readonly">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="sex" class="col-md-4 control-label">性别</label>
                                    <div class="col-md-4">
                                        <select name="sex" id="sex" class="form-control">
                                            <c:if test="${empty user.sex || user.sex eq '男'}">
                                                <option value="男" selected="selected">男</option>
                                                <option value="女">女</option>
                                            </c:if>
                                            <c:if test="${user.sex eq '女'}">
                                                <option value="男">男</option>
                                                <option value="女" selected="selected">女</option>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="age" class="col-md-4 control-label">年龄</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="age" name="age" value="${user.age}"
                                               placeholder="请输入年龄" required="required" maxlength="2"
                                               onkeyup="this.value=this.value.replace(/\D/g,'')"
                                               onfocus="this.value=this.value.replace(/\D/g,'')">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="mobile" class="col-md-4 control-label">手机号</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="mobile" name="mobile"
                                               value="${user.mobile}" placeholder="请输入手机号" required="required"
                                               maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')"
                                               onfocus="this.value=this.value.replace(/\D/g,'')">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="address" class="col-md-4 control-label">地址</label>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="address" name="address"
                                               value="${user.address}" placeholder="请输入地址" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-offset-4 col-md-2">
                                        <button class="btn btn-success col-md-12" type="submit">保存</button>
                                    </div>
                                    <div class="col-md-2">
                                        <button class="btn btn-danger col-md-12" type="button"
                                                onclick="javascript:history.go(-1);">返回
                                        </button>
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
<script src="${pagePath}/page/static/js/pace.min.js"></script>
<script src="${pagePath}/page/static/js/jquery.min.js"></script>
<script src="${pagePath}/page/static/js/bootstrap.js"></script>
<script src="${pagePath}/page/static/js/time.js"></script>
<script src="${pagePath}/page/static/js/city.js"></script>
</body>
</html>