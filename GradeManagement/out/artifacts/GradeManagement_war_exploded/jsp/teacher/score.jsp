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
          <h1><i class="fa fa-align-left"></i> 学生成绩</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="<%= basePath%>teacher/score">学生成绩</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <form class="form-group col-md-12" action="<%= basePath%>teacher/score">
                <div class="row">
                    <div class="col-lg-2">
                        <label>学期</label>
                        <select class="form-control" name="term">
                            <option disabled selected>请选择学期</option>
                            <c:forEach items="${termList}" var="term" varStatus="">
                                <option>${term.tName}</option>
                            </c:forEach>
                        </select>
                    </div>
<%--                    <div class="col-lg-2">--%>
<%--                        <label>班级</label>--%>
<%--                        <select class="form-control" name="classNo">--%>
<%--                            <option disabled selected>请选择班级</option>--%>
<%--                            <option>软件工程1601</option>--%>
<%--                            <option>软件工程1602</option>--%>
<%--                            <option>软件工程1603</option>--%>
<%--                            <option>软件工程1604</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
                    <div class="col-lg-2">
                        <label>课程</label>
                        <select class="form-control" name="courseName">
                            <option disabled selected>请选择课程</option>
                            <c:forEach items="${courseList}" var="course" varStatus="">
                                <option>${course.cName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="tile-footer"><button class="btn btn-primary" type="submit">查询</button></div>
            </form>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="scoreTable">
                <thead>
                  <tr>
                    <th>序号</th>
                    <th>学期</th>
                    <th>学号</th>
                    <th>学生姓名</th>
                    <th>课程</th>
                    <th>成绩</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach items="${teaScoreList}" var="score" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${score.tName}</td>
                            <td>${score.sNo}</td>
                            <td>${score.sName}</td>
                            <td>${score.cName}</td>
                            <td>${score.score}</td>
                        </tr>
                    </c:forEach>
                </tbody>
              </table>
              <div class="offset-md-11" style="margin-top: 18px">平均成绩：${avgScore}</div>
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
    <!-- Data table plugin-->
    <script type="text/javascript" src="<%= basePath%>resources/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            var t = $('#scoreTable').DataTable( {
                "columnDefs": [ {
                    "searchable": false,
                    "orderable": false,
                    "targets": 0
                } ],
                "order": [[ 1, 'asc' ]]
            } );

            t.on( 'order.dt search.dt', function () {
                t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                    cell.innerHTML = i+1;
                } );
            } ).draw();
        } );
    </script>
  </body>
</html>