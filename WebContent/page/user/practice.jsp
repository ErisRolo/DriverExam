<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pagePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>试题练习</title>
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
            <li><a class="active" href="${pagePath}/user_practice.do">顺序练习<i class="ec-pencil"></i></a></li>
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
                    <i class="ec-pencil"></i> 顺序练习
                </h1>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">试题练习</h4>
                        </div>
                        <div class="panel-body" style="height: 550px;">
                            <form class="form-horizontal" action="${pagePath}/user_practice.do" method="post">
                                <input type="hidden" id="page" name="page" value="0">
                                <div class="form-group">
                                    <div class="col-md-offset-4 col-md-4"
                                         style="font-size: 30px; text-align: center; padding: 25px;">
                                        试题内容
                                        <small>（${pages.pageNum}/${pages.pages}）</small>
                                    </div>
                                </div>
                                <c:forEach items="${pages.list}" var="problem">
                                    <div class="form-group">
                                        <div class="col-md-offset-3 col-md-9">
                                            <h4>
                                                Question：【${problem.difficulty}】（${problem.knowledge}）${problem.question}</h4>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-offset-4 col-md-4" align="center">
                                            <span style="color: red; font-weight: bold; font-size: 17px;">${message}</span>
                                        </div>
                                    </div>
                                    <input type="hidden" id="problem_id" name="problem_id" value="${problem.id}">
                                    <div class="form-group">
                                        <div class="col-md-offset-4 col-md-8">
                                            <c:choose>
                                                <c:when test="${problemValue eq 'A'}">
                                                    <label class="radio"> <input type="radio" name="problem_value"
                                                                                 value="A"
                                                                                 checked="checked">${problem.optionA}
                                                    </label>
                                                </c:when>
                                                <c:otherwise>
                                                    <label class="radio"> <input type="radio" name="problem_value"
                                                                                 value="A">${problem.optionA}</label>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${problemValue eq 'B'}">
                                                    <label class="radio"> <input type="radio" name="problem_value"
                                                                                 value="B"
                                                                                 checked="checked">${problem.optionB}
                                                    </label>
                                                </c:when>
                                                <c:otherwise>
                                                    <label class="radio"> <input type="radio" name="problem_value"
                                                                                 value="B">${problem.optionB}</label>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${problemValue eq 'C'}">
                                                    <label class="radio"> <input type="radio" name="problem_value"
                                                                                 value="C"
                                                                                 checked="checked">${problem.optionC}
                                                    </label>
                                                </c:when>
                                                <c:otherwise>
                                                    <label class="radio"> <input type="radio" name="problem_value"
                                                                                 value="C">${problem.optionC}</label>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${problemValue eq 'D'}">
                                                    <label class="radio"> <input type="radio" name="problem_value"
                                                                                 value="D"
                                                                                 checked="checked">${problem.optionD}
                                                    </label>
                                                </c:when>
                                                <c:otherwise>
                                                    <label class="radio"> <input type="radio" name="problem_value"
                                                                                 value="D">${problem.optionD}</label>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="form-group" style="margin-top: 50px;">
                                    <div class="col-md-offset-4 col-md-2">
                                        <button class="btn btn-primary col-md-12" type="button"
                                                onclick="checkSubmit(${pages.pageNum - 1},0)">上一题
                                        </button>
                                    </div>
                                    <div class="col-md-2">
                                        <button class="btn btn-primary col-md-12" type="button"
                                                onclick="checkSubmit(${pages.pageNum},1)">下一题
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
<script type="text/javascript">
    function checkSubmit(page, flag) {
        if (flag == 0) {
            $("#page").val(page);
            $("#problem_id").val("");
            $("form").submit();
        }
        if (flag == 1) {
            var value = $("input[type='radio']:checked").val();
            if (value == null) {
                alert("请选择当前题目的答案");
            } else {
                $("#page").val(page);
                $("form").submit();
            }
        }
    }
</script>
</body>
</html>