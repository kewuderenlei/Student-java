<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>高校成绩管理系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="app sidebar-mini rtl">
<!-- Navbar-->
<jsp:include page="top.jsp"></jsp:include>

<!-- Sidebar menu-->
<jsp:include page="left.jsp">
    <jsp:param value="1" name="select"/>
</jsp:include>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-user"></i> 个人信息</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<%= basePath%>teacher/index">个人信息</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-6 col-lg-3">
            <div class="widget-small primary coloured-icon"><i class="icon fa fa-id-card fa-3x"></i>
                <div class="info">
                    <h4>教师号</h4>
                    <p><b>${teacher.teaId}</b></p>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="widget-small danger coloured-icon"><i class="icon fa fa-mars fa-3x"></i>
                <div class="info">
                    <h4>性别</h4>
                    <p><b>${teacher.teaSex}</b></p>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="widget-small info coloured-icon"><i class="icon fa fa-clock-o fa-3x"></i>
                <div class="info">
                    <h4>年龄</h4>
                    <p><b>${teacher.teaAge}</b></p>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="widget-small warning coloured-icon"><i class="icon fa fa-clock-o fa-3x"></i>
                <div class="info">
                    <h4>职称</h4>
                    <p><b>${teacher.teaSet}</b></p>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="widget-small info coloured-icon"><i class="icon fa fa-phone fa-3x"></i>
                <div class="info">
                    <h4>联系电话</h4>
                    <p><b>${teacher.teaPhone}</b></p>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- Essential javascripts for application to work-->
<script src="<%= basePath%>resources/js/jquery-3.2.1.min.js"></script>
<script src="<%= basePath%>resources/js/popper.min.js"></script>
<script src="<%= basePath%>resources/js/bootstrap.min.js"></script>
<script src="<%= basePath%>resources/js/main.js"></script>
</body>
</html>