<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini rtl">
    <!-- Navbar-->
    <jsp:include page="top.jsp"></jsp:include>

    <!-- Sidebar menu-->
    <jsp:include page="left.jsp">
        <jsp:param value="5" name="select"/>
    </jsp:include>

    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-user"></i> 教师管理</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="<%= basePath%>admin/teacher/all">教师管理</a></li>
        </ul>
      </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <form class="form-group col-md-12" action="<%= basePath%>admin/teacher/insert">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-3">
                                    <label>教师编号</label>
                                    <input class="form-control" type="text" name="ID" placeholder="请输入教师编号" required>
                                </div>
                                <div class="col-lg-3">
                                    <label>教师姓名</label>
                                    <input class="form-control" type="text" name="name" placeholder="请输入教师姓名" required>
                                </div>
                                <div class="col-lg-3">
                                    <label>性别</label>
                                    <select class="form-control" name="sex" required>
                                        <option disabled selected>请选择性别</option>
                                        <option>男</option>
                                        <option>女</option>
                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label>年龄</label>
                                    <input class="form-control" type="number" name="age" placeholder="请输入年龄" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-3">
                                    <label>职称</label>
                                    <select class="form-control" name="title" required>
                                        <option disabled selected>请选择班级</option>
                                        <c:forEach items="${positionList}" var="position" varStatus="">
                                            <option>
                                                <td>${position.pName}</td>
                                            </option>
                                        </c:forEach>
                                    </select>
<%--                                    <input class="form-control" type="text" name="title" placeholder="请输入职称" required>--%>
                                </div>
                                <div class="col-lg-3">
                                    <label>联系电话</label>
                                    <input class="form-control" type="text" name="phone" placeholder="请输入联系电话" required>
                                </div>
                            </div>
                        </div>
                        <div class="tile-footer"><button class="btn btn-primary" type="submit" >添加</button></div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form class="tile">
                    <div class="tile-body">
                        <table class="table table-hover table-bordered" id="scoreTable">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>教师编号</th>
                                <th>教师姓名</th>
                                <th>性别</th>
                                <th>年龄</th>
                                <th>职称</th>
                                <th>联系电话</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${teacherList}" var="teacher" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${teacher.teaId}</td>
                                    <td>${teacher.teaName}</td>
                                    <td>${teacher.teaSex}</td>
                                    <td>${teacher.teaAge}</td>
                                    <td>${teacher.teaSet}</td>
                                    <td>${teacher.teaPhone}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="<%= basePath%>resources/js/jquery-3.2.1.min.js"></script>
    <script src="<%= basePath%>resources/js/popper.min.js"></script>
    <script src="<%= basePath%>resources/js/bootstrap.min.js"></script>
    <script src="<%= basePath%>resources/js/main.js"></script>
    <!-- Data table plugin-->
    <script type="text/javascript" src="<%= basePath%>resources/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#scoreTable').DataTable();</script>
  </body>
</html>