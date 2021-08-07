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
        <jsp:param value="7" name="select"/>
    </jsp:include>

    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-book"></i> 班级开课</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="<%= basePath%>/admin/classCourse">班级开课</a></li>
        </ul>
      </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <form class="form-group col-md-12" action="<%= basePath%>/admin/insertClassCourse">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-3">
                                    <label>班级</label>
                                    <input class="form-control" type="text" name="insertClass" placeholder="请输入班级" required>
                                </div>
                                <div class="col-lg-3">
                                    <label>课程编号</label>
                                    <input class="form-control" type="text" name="insertCourse" placeholder="请输入课程编号" required>
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
                <div class="tile">
                    <form class="form-group col-md-12" action="<%= basePath%>/admin/classCourse">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-3">
                                    <label>学期</label>
                                    <select class="form-control" name="term">
                                        <option disabled selected>请选择学期</option>
                                        <option>2016-2017(1)</option>
                                        <option>2016-2017(2)</option>
                                        <option>2017-2018(1)</option>
                                        <option>2017-2018(2)</option>
                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label>班级</label>
                                    <input class="form-control" type="text" name="classNo" placeholder="请输入班级">
                                </div>
                                <div class="col-lg-3">
                                    <label>课程编号</label>
                                    <input class="form-control" type="text" name="ID" placeholder="请输入课程编号">
                                </div>
                                <div class="col-lg-3">
                                    <label>课程名称</label>
                                    <input class="form-control" type="text" name="name" placeholder="请输入课程名称">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-3">
                                    <label>教师姓名</label>
                                    <input class="form-control" type="text" name="teacher" placeholder="请输入教师姓名">
                                </div>
                            </div>
                        </div>
                        <div class="tile-footer"><button class="btn btn-primary" type="submit" >查询</button></div>
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
                                <th>学期</th>
                                <th>班级</th>
                                <th>课程编号</th>
                                <th>课程名称</th>
                                <th>任课教师</th>
                                <th>学时</th>
                                <th>学分</th>
                                <th>考查类型</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${classCourseList}" var="classCourse" varStatus="status">
                                <tr>
                                    <td>${classCourse.term}</td>
                                    <td>${classCourse.classNo}</td>
                                    <td>${classCourse.ID}</td>
                                    <td>${classCourse.name}</td>
                                    <td>${classCourse.teacher}</td>
                                    <td>${classCourse.hours}</td>
                                    <td>${classCourse.credit}</td>
                                    <td>${classCourse.type}</td>
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