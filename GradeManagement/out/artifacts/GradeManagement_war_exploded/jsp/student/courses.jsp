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
      <jsp:param value="2" name="select"/>
    </jsp:include>

    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-book"></i> 我的课程</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item active"><a href="<%= basePath%>student/courses">我的课程</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <p class="lead"><strong>已修学分：</strong>${student.credit}</p>
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="coursesTable">
                <thead>
                  <tr>
                    <th>序号</th>
                    <th>课程名称</th>
                    <th>学期</th>
                    <th>任课教师</th>
                    <th>学时</th>
                    <th>学分</th>
                    <th>考查类型</th>
                    <th>状态</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach items="${stuCourseList}" var="course" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${course.cName}</td>
                            <td>${course.cTerm}</td>
                            <td>${course.cTeacher}</td>
                            <td>${course.cHours}</td>
                            <td>${course.cCredit}</td>
                            <td>${course.cType}</td>
                            <td>${course.cStatus}</td>
                        </tr>
                    </c:forEach>
                </tbody>
              </table>
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
    <!-- The javascript plugin to display page loading on top-->
    <script src="<%= basePath%>resources/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="<%= basePath%>resources/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">
      $('#coursesTable').DataTable();
    </script>
  </body>
</html>