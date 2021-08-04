
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image">
        <div>
            <p class="app-sidebar__user-name">${admin.adName}</p>
            <p class="app-sidebar__user-designation">管理员</p>
        </div>
    </div>
    <ul class="app-menu">

        <c:if test="${param.select == '1'}" var="rtn1" scope="page">
            <li>
                <a class="app-menu__item active" href="<%= basePath%>admin/index">
                    <i class="app-menu__icon fa fa-user"></i>
                    <span class="app-menu__label">个人信息</span>
                </a>
            </li>
        </c:if>
        <c:if test="${!rtn1}" var="rtn1" scope="page">
            <li>
                <a class="app-menu__item" href="<%= basePath%>admin/index">
                    <i class="app-menu__icon fa fa-user"></i>
                    <span class="app-menu__label">个人信息</span>
                </a>
            </li>
        </c:if>

        <c:if test="${param.select == '2'}" var="rtn2" scope="page">
            <li>
                <a class="app-menu__item active" href="<%= basePath%>admin/department/all">
                    <i class="app-menu__icon fa fa-building"></i>
                    <span class="app-menu__label">院系管理</span>
                </a>
            </li>
        </c:if>
        <c:if test="${!rtn2}" var="rtn2" scope="page">
            <li>
                <a class="app-menu__item" href="<%= basePath%>admin/department/all">
                    <i class="app-menu__icon fa fa-building"></i>
                    <span class="app-menu__label">院系管理</span>
                </a>
            </li>
        </c:if>

        <c:if test="${param.select == '3'}" var="rtn3" scope="page">
            <li>
                <a class="app-menu__item active" href="<%= basePath%>admin/class/all">
                    <i class="app-menu__icon fa fa-user"></i>
                    <span class="app-menu__label">班级管理</span>
                </a>
            </li>
        </c:if>
        <c:if test="${!rtn3}" var="rtn3" scope="page">
            <li>
                <a class="app-menu__item" href="<%= basePath%>admin/class/all">
                    <i class="app-menu__icon fa fa-user"></i>
                    <span class="app-menu__label">班级管理</span>
                </a>
            </li>
        </c:if>

        <c:if test="${param.select == '4'}" var="rtn4" scope="page">
            <li>
                <a class="app-menu__item active" href="<%= basePath%>admin/student/all">
                    <i class="app-menu__icon fa fa-user"></i>
                    <span class="app-menu__label">学生管理</span>
                </a>
            </li>
        </c:if>
        <c:if test="${!rtn4}" var="rtn4" scope="page">
            <li>
                <a class="app-menu__item" href="<%= basePath%>admin/student/all">
                    <i class="app-menu__icon fa fa-user"></i>
                    <span class="app-menu__label">学生管理</span>
                </a>
            </li>
        </c:if>

        <c:if test="${param.select == '5'}" var="rtn5" scope="page">
            <li>
                <a class="app-menu__item active" href="<%= basePath%>admin/teacher/all">
                    <i class="app-menu__icon fa fa-user"></i>
                    <span class="app-menu__label">教师管理</span>
                </a>
            </li>
        </c:if>
        <c:if test="${!rtn5}" var="rtn5" scope="page">
            <li>
                <a class="app-menu__item" href="<%= basePath%>admin/teacher/all">
                    <i class="app-menu__icon fa fa-user"></i>
                    <span class="app-menu__label">教师管理</span>
                </a>
            </li>
        </c:if>

        <c:if test="${param.select == '6'}" var="rtn6" scope="page">
            <li>
                <a class="app-menu__item active" href="<%= basePath%>admin/course/all">
                    <i class="app-menu__icon fa fa-book"></i>
                    <span class="app-menu__label">课程管理</span>
                </a>
            </li>
        </c:if>
        <c:if test="${!rtn6}" var="rtn6" scope="page">
            <li>
                <a class="app-menu__item" href="<%= basePath%>admin/course/all">
                    <i class="app-menu__icon fa fa-book"></i>
                    <span class="app-menu__label">课程管理</span>
                </a>
            </li>
        </c:if>

<%--        <c:if test="${param.select == '7'}" var="rtn7" scope="page">--%>
<%--            <li>--%>
<%--                <a class="app-menu__item active" href="<%= basePath%>admin/classCourse">--%>
<%--                    <i class="app-menu__icon fa fa-book"></i>--%>
<%--                    <span class="app-menu__label">班级开课</span>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--        </c:if>--%>
<%--        <c:if test="${!rtn7}" var="rtn7" scope="page">--%>
<%--            <li>--%>
<%--                <a class="app-menu__item" href="<%= basePath%>admin/classCourse">--%>
<%--                    <i class="app-menu__icon fa fa-book"></i>--%>
<%--                    <span class="app-menu__label">班级开课</span>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--        </c:if>--%>

        <c:if test="${param.select == '8'}" var="rtn8" scope="page">
            <li>
                <a class="app-menu__item active" href="<%= basePath%>admin/score/all">
                    <i class="app-menu__icon fa fa fa-align-left"></i>
                    <span class="app-menu__label">成绩管理</span>
                </a>
            </li>
        </c:if>
        <c:if test="${!rtn8}" var="rtn8" scope="page">
            <li>
                <a class="app-menu__item" href="<%= basePath%>admin/score/all">
                    <i class="app-menu__icon fa fa fa-align-left"></i>
                    <span class="app-menu__label">成绩管理</span>
                </a>
            </li>
        </c:if>
    </ul>
</aside>