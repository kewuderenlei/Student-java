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
        <jsp:param name="select" value="3"/>
    </jsp:include>

    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-align-left"></i> 成绩查询</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="<%= basePath%>student/score">成绩查询</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <form class="form-group col-md-12" action="<%= basePath%>student/score">
                <div class="row">
                    <div class="col-lg-2">
                        <label>学期</label>
                        <select class="form-control" name="term">
                            <option disabled selected>请选择学期</option>
                            <option>2016-2017(1)</option>
                            <option>2016-2017(2)</option>
                            <option>2017-2018(1)</option>
                            <option>2017-2018(2)</option>
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
                    <th>学期</th>
                    <th>课程名称</th>
                    <th>任课教师</th>
                    <th>学时</th>
                    <th>学分</th>
                    <th>考查类型</th>
                    <th>成绩</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach items="${stuScoreList}" var="score" varStatus="">
                        <tr>
                            <td>${score.term}</td>
                            <td>${score.name}</td>
                            <td>${score.teacher}</td>
                            <td>${score.hours}</td>
                            <td>${score.credit}</td>
                            <td>${score.type}</td>
                            <td>${score.score}</td>
                        </tr>
                    </c:forEach>
                  </tr>
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
    <!-- Data table plugin-->
    <script type="text/javascript" src="<%= basePath%>resources/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>resources/js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#scoreTable').DataTable();</script>
  </body>
</html>