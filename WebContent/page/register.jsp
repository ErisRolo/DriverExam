<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pagePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户注册</title>
    <link href="${pagePath}/page/static/css/icons.css" rel="stylesheet"/>
    <link href="${pagePath}/page/static/css/bootstrap.css" rel="stylesheet"/>
    <link href="${pagePath}/page/static/css/plugins.css" rel="stylesheet"/>
    <link href="${pagePath}/page/static/css/main.css" rel="stylesheet"/>
</head>
<body class="login-page">
<div id="login" class="animated bounceIn">
    <div style="width: 100%; height: 50px; font-size: 35px; color: white; font-weight: bold; text-align: center; margin-top: -75px; margin-bottom: 25px;">
        驾校在线考试系统
    </div>
    <div class="login-wrapper">
        <ul id="myTab" class="nav nav-tabs nav-justified bn">
            <li><a href="${pagePath}/login.do" data-toggle="tab">新用户注册</a></li>
        </ul>
        <div id="myTabContent" class="tab-content bn">
            <div class="tab-pane fade active in" id="log-in" style="padding-bottom: 30px;">
                <div class="seperator" style="margin-bottom: -15px;">
                    <hr>
                    <span style="color: red; font-size: 20px;">${message}</span>
                </div>
                <form class="form-horizontal mt10" action="${pagePath}/register.do" method="post" id="login-form"
                      role="form" onsubmit="return check()">
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" name="username" id="username" class="form-control left-icon"
                                   value="${user.username}" placeholder="用户名" required="required"> <i
                                class="ec-user s16 left-input-icon"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="password" name="password" id="password" class="form-control left-icon"
                                   value="${user.password}" placeholder="密码" required="required"> <i
                                class="ec-locked s16 left-input-icon"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="password" name="password2" id="password2" class="form-control left-icon"
                                   value="${user.password}" placeholder="确认密码" required="required"> <i
                                class="ec-locked s16 left-input-icon"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <select name="sex" id="sex" class="form-control left-icon">
                                <c:if test="${empty user.sex || user.sex eq '男'}">
                                    <option value="男" selected="selected">男</option>
                                    <option value="女">女</option>
                                </c:if>
                                <c:if test="${user.sex eq '女'}">
                                    <option value="男">男</option>
                                    <option value="女" selected="selected">女</option>
                                </c:if>
                            </select> <i class="im-users2 s16 left-input-icon"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" name="age" id="age" class="form-control left-icon" value="${user.age}"
                                   placeholder="年龄" required="required" maxlength="2"
                                   onkeyup="this.value=this.value.replace(/\D/g,'')"
                                   onfocus="this.value=this.value.replace(/\D/g,'')"> <i
                                class="im-spinner4 s16 left-input-icon"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="tel" name="mobile" id="mobile" class="form-control left-icon"
                                   value="${user.mobile}" placeholder="手机号" required="required" maxlength="11"
                                   onkeyup="this.value=this.value.replace(/\D/g,'')"
                                   onfocus="this.value=this.value.replace(/\D/g,'')"> <i
                                class="en-mobile s16 left-input-icon"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" name="address" id="address" class="form-control left-icon"
                                   value="${user.address}" placeholder="地址" required="required"> <i
                                class="ec-location s16 left-input-icon"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <span class="help-block"><a href="${pagePath}/login.do"
                                                        style="cursor: pointer; text-decoration: none;"><small>已有账号！立即登录</small></a></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <button class="btn btn-success col-md-12 col-sm-12 col-xs-12" type="submit">注册</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${pagePath}/page/static/js/pace.min.js"></script>
<script src="${pagePath}/page/static/js/jquery.min.js"></script>
<script src="${pagePath}/page/static/js/bootstrap.js"></script>
<script src="${pagePath}/page/static/js/jquery.icheck.js"></script>
<script src="${pagePath}/page/static/js/jquery.validate.js"></script>
<script src="${pagePath}/page/static/js/additional-methods.min.js"></script>
<script src="${pagePath}/page/static/js/login.js"></script>
<script type="text/javascript">
    function check() {
        if ($("#password").val() == "" || $("#password2").val() == "") {
            return false;
        }
        if ($("#password").val() != $("#password2").val()) {
            alert("两次密码输入不一致");
            return false;
        }
        return true;
    }
</script>
</body>
</html>