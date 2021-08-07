<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
//    String select = request.getParameter("select");
//    System.out.println(select);
%>

<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar"
                                        src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg"
                                        alt="User Image">
        <div>
            <p class="app-sidebar__user-name">${student.name}</p>
            <p class="app-sidebar__user-designation">${student.type}</p>
        </div>
    </div>

    <ul class="app-menu">
        <c:if test="${param.select == '1'}" var="rtn1" scope="page">
            <li><a class="app-menu__item active" href="<%= basePath%>student/index"><i
                    class="app-menu__icon fa fa-user"></i><span class="app-menu__label">个人信息</span></a></li>
        </c:if>
        <c:if test="${!rtn1}" var="rtn1" scope="page">
            <li><a class="app-menu__item" href="<%= basePath%>student/index"><i
                    class="app-menu__icon fa fa-user"></i><span class="app-menu__label">个人信息</span></a></li>
        </c:if>

        <c:if test="${param.select == '2'}" var="rtn2" scope="page">
            <li><a class="app-menu__item active" href="<%= basePath%>student/courses"><i
                    class="app-menu__icon fa fa fa-book"></i><span class="app-menu__label">我的课程</span></a></li>
        </c:if>
        <c:if test="${!rtn2}" var="rtn2" scope="page">
            <li><a class="app-menu__item" href="<%= basePath%>student/courses"><i
                    class="app-menu__icon fa fa fa-book"></i><span class="app-menu__label">我的课程</span></a></li>
        </c:if>

        <c:if test="${param.select == '3'}" var="rtn3" scope="page">
            <li><a class="app-menu__item active" href="<%= basePath%>student/score"><i
                    class="app-menu__icon fa fa-align-left"></i><span class="app-menu__label">成绩查询</span></a></li>
        </c:if>
        <c:if test="${!rtn3}" var="rtn3" scope="page">
            <li><a class="app-menu__item" href="<%= basePath%>student/score"><i
                    class="app-menu__icon fa fa-align-left"></i><span class="app-menu__label">成绩查询</span></a></li>
        </c:if>

        <c:if test="${param.select == '4'}" var="rtn4" scope="page">
            <li><a class="app-menu__item active" href="<%= basePath%>student/classCourse"><i
                    class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">选课</span></a></li>
        </c:if>
        <c:if test="${!rtn4}" var="rtn4" scope="page">
            <li><a class="app-menu__item" href="<%= basePath%>student/classCourse"><i
                    class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">选课</span></a></li>
        </c:if>
    </ul>
</aside>
