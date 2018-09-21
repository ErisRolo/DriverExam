<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pagePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户管理</title>
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
            <li><a class="active" href="${pagePath}/admin_user.do">用户管理<i class="im-users"></i></a></li>
            <li><a href="${pagePath}/admin_problem.do">题库管理<i class="im-file3"></i></a></li>
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
                    <i class="im-users"></i> 用户列表 <a href="${pagePath}/admin_addUser.do" class="btn btn-primary"> <span
                        class="en-user-add"></span> 新增用户
                </a> <span style="color: red; font-weight: bold; font-size: 17px;">${message}</span>
                </h1>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div style="height: 560px;">
                            <table class="table table-bordered table-hover" style="table-layout: fixed;">
                                <thead>
                                <tr>
                                    <th class="col-md-2" style="text-align: center;">用户名</th>
                                    <th class="col-md-1" style="text-align: center;">角色</th>
                                    <th class="col-md-1" style="text-align: center;">性别</th>
                                    <th class="col-md-1" style="text-align: center;">年龄</th>
                                    <th class="col-md-1" style="text-align: center;">手机号</th>
                                    <th class="col-md-2" style="text-align: center;">地址</th>
                                    <th class="col-md-2" style="text-align: center;">注册时间</th>
                                    <th class="col-md-2" style="text-align: center;">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pages.list}" var="user">
                                    <tr align="center">
                                        <td>${user.username}</td>
                                        <td>${user.role}</td>
                                        <td>${user.sex}</td>
                                        <td>${user.age}</td>
                                        <td>${user.mobile}</td>
                                        <td>${user.address}</td>
                                        <td><fmt:formatDate value="${user.createTime}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td>
                                            <a href="${pagePath}/admin_resetPassword.do?user_id=${user.id}&page=${pages.pageNum}"
                                               class="btn btn-primary btn-sm"
                                               onclick="return confirm('确定将用户（${user.username}）密码重置吗？');"
                                               style="margin-right: 2px;">重置密码</a><a
                                                href="${pagePath}/admin_modifyUser.do?user_id=${user.id}"
                                                class="btn btn-info btn-sm" style="margin-right: 2px;">修改</a> <c:if
                                                test="${loguser.id eq user.id}">
                                            <a href="javascript:void(0);" class="btn btn-warning btn-sm"
                                               onclick="alert('不能删除当前登录账号！');">删除</a>
                                        </c:if> <c:if test="${loguser.id ne user.id}">
                                            <a href="${pagePath}/admin_deleteUser.do?user_id=${user.id}"
                                               class="btn btn-danger btn-sm"
                                               onclick="return confirm('确定删除该用户吗？');">删除</a>
                                        </c:if></td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty pages.list}">
                                    <tr>
                                        <td colspan="8" align="center">没有数据</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                        <c:if test="${!empty pages.list}">
                            <div class="row">
                                <div class="col-md-4" style="height: 30px;">当前第&nbsp;${pages.pageNum}&nbsp;页&nbsp;共有&nbsp;${pages.pages}&nbsp;页&nbsp;总计&nbsp;${pages.total}&nbsp;条记录</div>
                                <div class="col-md-6" style="height: 30px;">
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination">
                                            <li><a href="${pagePath}/admin_user.do?page=1">首页</a></li>
                                            <c:if test="${pages.hasPreviousPage}">
                                                <li><a href="${pagePath}/admin_user.do?page=${pages.pageNum-1}"
                                                       aria-label="Previous"> 上一页</a></li>
                                            </c:if>
                                            <c:if test="${!pages.hasPreviousPage}">
                                                <li><a href="javascript:void(0);" aria-label="Previous"> 上一页</a></li>
                                            </c:if>
                                            <c:forEach items="${pages.navigatepageNums}" var="pageNum">
                                                <c:if test="${pageNum == pages.pageNum}">
                                                    <li class="active"><a
                                                            href="${pagePath}/admin_user.do?page=${pageNum}">${pageNum}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${pageNum != pages.pageNum}">
                                                    <li>
                                                        <a href="${pagePath}/admin_user.do?page=${pageNum}">${pageNum}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${pages.hasNextPage}">
                                                <li><a href="${pagePath}/admin_user.do?page=${pages.pageNum+1}"
                                                       aria-label="Next"> 下一页</a></li>
                                            </c:if>
                                            <c:if test="${!pages.hasNextPage}">
                                                <li><a href="javascript:void(0);" aria-label="Next"> 下一页</a></li>
                                            </c:if>
                                            <li><a href="${pagePath}/admin_user.do?page=${pages.pages}">末页</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </c:if>
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