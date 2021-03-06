<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pagePath" value="${pageContext.request.contextPath}"/>
<%
    response.setStatus(HttpServletResponse.SC_FORBIDDEN);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>权限不足</title>
    <link href="${pagePath}/page/static/css/icons.css" rel="stylesheet"/>
    <link href="${pagePath}/page/static/css/bootstrap.css" rel="stylesheet"/>
    <link href="${pagePath}/page/static/css/plugins.css" rel="stylesheet"/>
    <link href="${pagePath}/page/static/css/main.css" rel="stylesheet"/>
</head>
<body class="error-page">
<div class="container animated fadeInDown">
    <h1 class="error-number">403</h1>
    <h1 class="text-center mb25">权限不足，禁止访问</h1>
    <p class="text-center s24">您没有权限访问此请求，请联系管理员</p>
    <div class="text-center mt25">
        <div class="btn-group">
            <a href="javascript: history.go(-1)" class="btn btn-default btn-lg"><i class="en-arrow-left8"></i> 返回上一页</a>
            <a href="javascript:alert('请联系管理员')" class="btn btn-default btn-lg"><i class="en-mail"></i> 联系管理员</a>
        </div>
    </div>
</div>
<script src="${pagePath}/page/static/js/pace.min.js"></script>
<script src="${pagePath}/page/static/js/jquery.min.js"></script>
<script src="${pagePath}/page/static/js/bootstrap.js"></script>
</body>
</html>