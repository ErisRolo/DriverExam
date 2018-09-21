<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pagePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改试题</title>
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
                    <i class="im-file3"></i> 修改试题
                </h1>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">编辑试题</h4>
                        </div>
                        <div class="panel-body" style="height: 550px;">
                            <form class="form-horizontal" action="${pagePath}/admin_modifyProblemSave.do" method="post">
                                <input type="hidden" id="problem_id" name="problem_id" value="${problem.id}">
                                <div class="form-group">
                                    <div class="col-md-offset-4 col-md-4" style="font-size: 30px; text-align: center;">
                                        修改试题
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-offset-4 col-md-4" align="center">
                                        <span style="color: red; font-weight: bold; font-size: 17px;">${message}</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="question" class="col-md-2 control-label">问题</label>
                                    <div class="col-md-8">
                                        <textarea class="form-control" rows="2" id="question" name="question"
                                                  placeholder="请输入问题内容..."
                                                  required="required">${problem.question}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="optionA" class="col-md-2 control-label">选项A</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" id="optionA" name="optionA"
                                               value="${problem.optionA}" placeholder="请输入选项A内容" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="optionB" class="col-md-2 control-label">选项B</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" id="optionB" name="optionB"
                                               value="${problem.optionB}" placeholder="请输入选项B内容" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="optionC" class="col-md-2 control-label">选项C</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" id="optionC" name="optionC"
                                               value="${problem.optionC}" placeholder="请输入选项C内容" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="optionD" class="col-md-2 control-label">选项D</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" id="optionD" name="optionD"
                                               value="${problem.optionD}" placeholder="请输入选项D内容" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="answer" class="col-md-2 control-label">答案</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" id="answer" name="answer"
                                               value="${problem.answer}" placeholder="请输入答案（如：A/B/C/D）"
                                               required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="difficulty" class="col-md-2 control-label">难度系数</label>
                                    <div class="col-md-8">
                                        <select name="difficulty" id="difficulty" class="form-control">
                                            <c:if test="${empty problem.difficulty || problem.difficulty eq '简单'}">
                                                <option value="简单" selected="selected">简单</option>
                                                <option value="中等">中等</option>
                                                <option value="困难">困难</option>
                                            </c:if>
                                            <c:if test="${problem.difficulty eq '中等'}">
                                                <option value="简单">简单</option>
                                                <option value="中等" selected="selected">中等</option>
                                                <option value="困难">困难</option>
                                            </c:if>
                                            <c:if test="${problem.difficulty eq '困难'}">
                                                <option value="简单">简单</option>
                                                <option value="中等">中等</option>
                                                <option value="困难" selected="selected">困难</option>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="knowledge" class="col-md-2 control-label">知识点</label>
                                    <div class="col-md-8">
                                        <select name="knowledge" id="knowledge" class="form-control">
                                            <c:forEach items="${knowledges}" var="knowledge">
                                                <c:choose>
                                                    <c:when test="${knowledge.name eq problem.knowledge}">
                                                        <option value="${knowledge.name}"
                                                                selected="selected">${knowledge.name}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${knowledge.name}">${knowledge.name}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
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
</body>
</html>