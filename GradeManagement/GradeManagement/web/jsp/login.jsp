<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();//项目的虚拟路径
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
//当前页面使用的协议,服务器的名字,所在的服务器使用的端口
%>
<!DOCTYPE html>
<html>·
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>高校成绩管理系统</title>
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Essential javascripts for application to work-->
    <script src="<%=basePath%>resources/js/jquery-3.2.1.min.js"></script>
    <script src="<%=basePath%>resources/js/popper.min.js"></script>
    <script src="<%=basePath%>resources/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>resources/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<%=basePath%>resources/js/plugins/pace.min.js"></script>

</head>
<body>
<section class="material-half-bg">
    <div class="cover"></div>
</section>
<section class="login-content">
    <div class="logo">
        <h1>高校成绩管理系统</h1>
    </div>
    <div class="login-box">
        <form class="login-form" action="LoginServlet" id="form1" name="form1" method="post">
            <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>登录</h3>
            <div class="form-group">
                <label class="control-label">登录类型</label>
                <select class="form-control"  name="role" id="role">
                    <option disabled selected>请选择登录类型</option>

                    <c:if test="${typelist != null && typelist != ''}" var="rtn" scope="page">
                        <c:forEach var="list" items="${typelist}">
                            <option value="${list.tName}">${list.tName}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
            <div class="form-group">
                <label class="control-label">用户名</label>
                <input class="form-control" type="text" name="username" placeholder="请输入用户名" autofocus required>
            </div>
            <div class="form-group">
                <label class="control-label">密码</label>
                <input class="form-control" type="password" name="userpwd" placeholder="请输入密码" required>
                <input type="hidden" name="flag" value="checkLogin">
            </div>
            <div class="form-group">
                <div class="text-center"><label  style="color: red">${message}</label></div>
            </div>

            <div class="form-group btn-container">
                <button class="btn btn-primary btn-block" type="submit" ><i class="fa fa-sign-in fa-lg fa-fw"></i>登录
                </button>
            </div>
        </form>
    </div>
</section>
</body>
</html>