<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pagePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>错题统计</title>
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
            <li><a href="${pagePath}/user_mockExam.do">模拟考试<i class="im-file3"></i></a></li>
            <li><a class="active" href="${pagePath}/user_errorProblem.do">错题统计<i class="im-stats"></i></a></li>
            <li><a href="${pagePath}/user_password.do">密码修改<i class="br-locked"></i></a></li>
        </ul>
    </div>
</div>
<div id="content">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 heading">
                <h1 class="page-header">
                    <i class="im-stats"></i> 错题列表
                </h1>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div style="height: 560px;">
                            <table class="table table-bordered table-hover" style="table-layout: fixed;">
                                <thead>
                                <tr>
                                    <th class="col-md-1" style="text-align: center;">难易度</th>
                                    <th class="col-md-1" style="text-align: center;">知识点</th>
                                    <th class="col-md-1" style="text-align: center;">出现次数</th>
                                    <th class="col-md-5" style="text-align: center;">题目</th>
                                    <th class="col-md-1" style="text-align: center;">答案</th>
                                    <th class="col-md-2" style="text-align: center;">创建时间</th>
                                    <th class="col-md-1" style="text-align: center;">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pages.list}" var="errorProblem">
                                    <tr align="center">
                                        <td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${errorProblem.difficulty}</td>
                                        <td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${errorProblem.knowledge}</td>
                                        <td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${errorProblem.count}</td>
                                        <td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; text-align: left;">${errorProblem.question}</td>
                                        <td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${errorProblem.answer}</td>
                                        <td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                                            <fmt:formatDate value="${errorProblem.createTime}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a
                                                href="${pagePath}/user_problemDetails.do?problem_id=${errorProblem.problemId}"
                                                class="btn btn-primary btn-sm">查看试题</a></td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty pages.list}">
                                    <tr>
                                        <td colspan="7" align="center">没有数据</td>
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
                                            <li><a href="${pagePath}/user_errorProblem.do?page=1">首页</a></li>
                                            <c:if test="${pages.hasPreviousPage}">
                                                <li><a href="${pagePath}/user_errorProblem.do?page=${pages.pageNum-1}"
                                                       aria-label="Previous"> 上一页</a></li>
                                            </c:if>
                                            <c:if test="${!pages.hasPreviousPage}">
                                                <li><a href="javascript:;" aria-label="Previous"> 上一页</a></li>
                                            </c:if>
                                            <c:forEach items="${pages.navigatepageNums}" var="pageNum">
                                                <c:if test="${pageNum == pages.pageNum}">
                                                    <li class="active"><a
                                                            href="${pagePath}/user_errorProblem.do?page=${pageNum}">${pageNum}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${pageNum != pages.pageNum}">
                                                    <li>
                                                        <a href="${pagePath}/user_errorProblem.do?page=${pageNum}">${pageNum}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${pages.hasNextPage}">
                                                <li><a href="${pagePath}/user_errorProblem.do?page=${pages.pageNum+1}"
                                                       aria-label="Next"> 下一页</a></li>
                                            </c:if>
                                            <c:if test="${!pages.hasNextPage}">
                                                <li><a href="javascript:;" aria-label="Next"> 下一页</a></li>
                                            </c:if>
                                            <li><a href="${pagePath}/user_errorProblem.do?page=${pages.pages}">末页</a>
                                            </li>
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