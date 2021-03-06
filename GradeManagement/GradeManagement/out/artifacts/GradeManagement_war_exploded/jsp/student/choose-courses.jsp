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
        <jsp:param value="4" name="select"/>
    </jsp:include>

    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa fa-edit"></i> 选课</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="<%= basePath%>student/classCourse">选课</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <form class="tile-body" id="chooseCourseForm" method="post">
              <input type="hidden" id="courseId" name="courseId" />
              <table class="table table-hover table-bordered" id="coursesTable">
                <thead>
                  <tr>
                    <th>学期</th>
                    <th>课程名称</th>
                    <th>任课教师</th>
                    <th>学时</th>
                    <th>学分</th>
                    <th>考查类型</th>
                    <th>选课</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach items="${courseList}" var="course" varStatus="status">
                        <tr name="${course}">
                            <td>${course.term}</td>
                            <td>${course.name}</td>
                            <td>${course.teacher}</td>
                            <td>${course.hours}</td>
                            <td>${course.credit}</td>
                            <td>${course.type}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${course.status == '已选'}">
                                        <a class="btn btn-danger" href="javascript:deleteCourse('<%=basePath%>', ${course.ID});">退选</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="btn btn-primary" href="javascript:chooseCourse('<%=basePath%>', ${course.ID});">选课</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
              </table>
            </form>
          </div>
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
    <script type="text/javascript">$('#coursesTable').DataTable();</script>
    <script type="text/javascript">
        function chooseCourse(basePath, courseId) {
            var id = document.getElementById("courseId");
            id.value = courseId;
            var chooseCourseForm = document.getElementById("chooseCourseForm");
            chooseCourseForm.setAttribute("action", basePath + "student/chooseCourse");
            chooseCourseForm.submit();
        }

        function deleteCourse(basePath, courseId) {
            var id = document.getElementById("courseId");
            id.value = courseId;
            var chooseCourseForm = document.getElementById("chooseCourseForm");
            chooseCourseForm.setAttribute("action", basePath + "student/deleteCourse");
            chooseCourseForm.submit();
        }
    </script>
  </body>
</html>