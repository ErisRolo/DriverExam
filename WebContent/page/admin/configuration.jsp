<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pagePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>配置管理</title>
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
            <li><a class="active" href="${pagePath}/admin_configuration.do">配置管理<i class="im-cogs"></i></a></li>
            <li><a href="${pagePath}/admin_password.do">密码修改<i class="br-locked"></i></a></li>
        </ul>
    </div>
</div>
<div id="content">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 heading">
                <h1 class="page-header">
                    <i class="br-locked"></i> 配置管理
                </h1>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">修改配置</h4>
                        </div>
                        <div class="panel-body" style="height: 550px; padding-top: 75px;">
                            <div class="bg-white">
                                <form class="form-horizontal" action="${pagePath}/admin_configuration.do" method="post"
                                      onsubmit="return checkValue()">
                                    <input type="hidden" id="flag" name="flag" value="modify">
                                    <div class="form-group">
                                        <div class="col-md-offset-4 col-md-4"
                                             style="font-size: 30px; text-align: center;">修改配置
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-offset-4 col-md-4" style="text-align: center; height: 20px;">
                                            <span style="color: red; font-weight: bold; font-size: 17px;">${message}</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 control-label">难度比例： </label>
                                        <div class="col-md-5">
                                            <span style="color: red; font-size: 20px;">难度比例系数合计必须为10</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="simple" class="col-md-5 control-label">简单：</label>
                                        <div class="col-md-5">
                                            <input class="form-control input-mini" type="tel" id="simple" name="simple"
                                                   value="${configuration.simple}" placeholder="0 - 9"
                                                   required="required" maxlength="2"
                                                   onkeyup="this.value=this.value.replace(/\D/g,'')"
                                                   onfocus="this.value=this.value.replace(/\D/g,'')">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="medium" class="col-md-5 control-label">中等：</label>
                                        <div class="col-md-5">
                                            <input class="form-control input-mini" type="tel" id="medium" name="medium"
                                                   value="${configuration.medium}" placeholder="0 - 9"
                                                   required="required" maxlength="2"
                                                   onkeyup="this.value=this.value.replace(/\D/g,'')"
                                                   onfocus="this.value=this.value.replace(/\D/g,'')">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="difficulty" class="col-md-5 control-label">困难：</label>
                                        <div class="col-md-5">
                                            <input class="form-control input-mini" type="tel" id="difficulty"
                                                   name="difficulty" value="${configuration.difficulty}"
                                                   placeholder="0 - 9" required="required" maxlength="2"
                                                   onkeyup="this.value=this.value.replace(/\D/g,'')"
                                                   onfocus="this.value=this.value.replace(/\D/g,'')">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-5 control-label">知识点（可多选）：</label>
                                        <div class="col-md-5">
                                            <c:forEach items="${knowledges}" var="knowledge">
                                                <label class="checkbox-inline"> <c:choose>
                                                    <c:when test="${fn:contains(configuration.knowledge, knowledge.name)}">
                                                        <input type="checkbox" name="knowledge"
                                                               value="${knowledge.name}"
                                                               checked="checked">${knowledge.name}</c:when>
                                                    <c:otherwise>
                                                        <input type="checkbox" name="knowledge"
                                                               value="${knowledge.name}">${knowledge.name}</c:otherwise>
                                                </c:choose>
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-top: 50px;">
                                        <div class="col-md-offset-5 col-md-2">
                                            <button class="btn btn-primary col-md-12" type="submit">保存修改</button>
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
        var simple = parseInt($("#simple").val());
        var medium = parseInt($("#medium").val());
        var difficulty = parseInt($("#difficulty").val());
        if (!simple + medium + difficulty == 10) {
            alert("难度比例系数设置不合法");
            return false;
        }
        var value = $("input[type='checkbox']:checked").val();
        if (value == null) {
            alert("知识点至少勾选一个");
            return false;
        } else {
            return true;
        }
    }
</script>
</body>
</html>