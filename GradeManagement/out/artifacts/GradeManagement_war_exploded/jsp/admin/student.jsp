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
          <h1><i class="fa fa fa-user"></i> 学生管理</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="<%= basePath%>admin/student/all">学生管理</a></li>
        </ul>
      </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <form class="form-group col-md-12" action="<%= basePath%>admin/student/insert">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-3">
                                    <label>学号</label>
                                    <input class="form-control" type="text" name="insertID" placeholder="请输入学号" required>
                                </div>
                                <div class="col-lg-3">
                                    <label>学生姓名</label>
                                    <input class="form-control" type="text" name="insertName" placeholder="请输入学生姓名" required>
                                </div>
                                <div class="col-lg-3">
                                    <label>院系名称</label>
                                    <select class="form-control" name="insertDepartmentName" required>
                                        <option disabled selected>请选择院系</option>
                                        <c:forEach items="${departmentList}" var="department" varStatus="">
                                            <option>
                                                <td>${department.collName}</td>
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label>班级名称</label>
                                    <select class="form-control" name="insertClassName" required>
                                        <option disabled selected>请选择班级</option>
                                        <c:forEach items="${classList}" var="class1" varStatus="">
                                            <option>
                                                <td>${class1.claName}</td>
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-3">
                                    <label>性别</label>
                                    <select class="form-control" name="insertSex" required>
                                        <option disabled selected>请选择性别</option>
                                        <option>男</option>
                                        <option>女</option>
                                    </select>
                                </div>
                                <div class="col-lg-3">
                                    <label>年龄</label>
                                    <input class="form-control" type="number" name="insertAge" placeholder="请输入年龄" required>
                                </div>
                                <div class="col-lg-3">
                                    <label>地址</label>
                                    <input class="form-control" type="text" name="insertAddress" placeholder="请输入地址" required>
                                </div>
                            </div>
                        </div>
                        <div class="tile-footer"><button class="btn btn-primary" type="submit" >添加</button></div>
                    </form>
                </div>
            </div>
        </div>
<%--        <div class="row">--%>
<%--            <div class="col-md-12">--%>
<%--                <div class="tile">--%>
<%--                    <form class="form-group col-md-12" action="<%= basePath%>admin/student/all">--%>
<%--                        <div class="form-group">--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-lg-3">--%>
<%--                                    <label>学号</label>--%>
<%--                                    <input class="form-control" type="text" name="ID" placeholder="请输入学号">--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3">--%>
<%--                                    <label>学生姓名</label>--%>
<%--                                    <input class="form-control" type="text" name="name" placeholder="请输入学生姓名">--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3">--%>
<%--                                    <label>院系名称</label>--%>
<%--                                    <select class="form-control" name="departmentName">--%>
<%--                                        <option disabled selected>请选择院系</option>--%>
<%--                                        <c:forEach items="${departmentList}" var="department" varStatus="">--%>
<%--                                            <option>--%>
<%--                                                <td>${department.collName}</td>--%>
<%--                                            </option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3">--%>
<%--                                    <label>班级名称</label>--%>
<%--                                    <select class="form-control" name="className">--%>
<%--                                        <option disabled selected>请选择班级</option>--%>
<%--                                        <c:forEach items="${classList}" var="class1" varStatus="">--%>
<%--                                            <option>--%>
<%--                                                <td>${class1.claName}</td>--%>
<%--                                            </option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-lg-3">--%>
<%--                                    <label>地址</label>--%>
<%--                                    <input class="form-control" type="text" name="address" placeholder="请输入地址">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="tile-footer"><button class="btn btn-primary" type="submit" >查询</button></div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
        <div class="row">
            <div class="col-md-12">
                <form class="tile">
                    <div class="tile-body">
                        <table class="table table-hover table-bordered" id="scoreTable">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>学号</th>
                                <th>学生姓名</th>
                                <th>院系</th>
                                <th>班级</th>
                                <th>性别</th>
                                <th>年龄</th>
                                <th>地址</th>
                                <th>已修学分</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${studentList}" var="student" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${student.uid}</td>
                                    <td>${student.name}</td>
                                    <td>${student.collName}</td>
                                    <td>${student.claName}</td>
                                    <td>${student.sex}</td>
                                    <td>${student.age}</td>
                                    <td>${student.address}</td>
                                    <td>${student.credit}</td>
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