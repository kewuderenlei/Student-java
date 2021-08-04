<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar"
                                        src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg"
                                        alt="User Image">
        <div>
            <p class="app-sidebar__user-name">${teacher.teaName}</p>
            <p class="app-sidebar__user-designation">${teacher.type}</p>
        </div>
    </div>

    <ul class="app-menu">
        <c:if test="${param.select == '1'}" var="rtn1" scope="page">
            <li><a class="app-menu__item active" href="<%= basePath%>teacher/index"><i
                    class="app-menu__icon fa fa-user"></i><span class="app-menu__label">个人信息</span></a></li>
        </c:if>
        <c:if test="${!rtn1}" var="rtn1" scope="page">
            <li><a class="app-menu__item" href="<%= basePath%>teacher/index"><i
                    class="app-menu__icon fa fa-user"></i><span class="app-menu__label">个人信息</span></a></li>
        </c:if>

        <c:if test="${param.select == '2'}" var="rtn2" scope="page">
            <li><a class="app-menu__item active" href="<%= basePath%>teacher/courses"><i
                    class="app-menu__icon fa fa fa-book"></i><span class="app-menu__label">我的任课</span></a></li>
        </c:if>
        <c:if test="${!rtn2}" var="rtn2" scope="page">
            <li><a class="app-menu__item" href="<%= basePath%>teacher/courses"><i
                    class="app-menu__icon fa fa fa-book"></i><span class="app-menu__label">我的任课</span></a></li>
        </c:if>

        <c:if test="${param.select == '3'}" var="rtn3" scope="page">
            <li><a class="app-menu__item active" href="<%= basePath%>teacher/myStudent"><i
                    class="app-menu__icon fa fa-users"></i><span class="app-menu__label">我的学生</span></a></li>
        </c:if>
        <c:if test="${!rtn3}" var="rtn3" scope="page">
            <li><a class="app-menu__item" href="<%= basePath%>teacher/myStudent"><i
                    class="app-menu__icon fa fa-users"></i><span class="app-menu__label">我的学生</span></a></li>
        </c:if>

        <c:if test="${param.select == '4'}" var="rtn4" scope="page">
            <li><a class="app-menu__item active" href="<%= basePath%>teacher/score"><i
                    class="app-menu__icon fa fa-align-left"></i><span
                    class="app-menu__label">学生成绩</span></a></li>
        </c:if>
        <c:if test="${!rtn4}" var="rtn4" scope="page">
            <li><a class="app-menu__item" href="<%= basePath%>teacher/score"><i
                    class="app-menu__icon fa fa-align-left"></i><span
                    class="app-menu__label">学生成绩</span></a></li>
        </c:if>

        <c:if test="${param.select == '5'}" var="rtn5" scope="page">
            <li><a class="app-menu__item active" href="<%= basePath%>teacher/scoreInsert"><i
                    class="app-menu__icon fa fa-edit"></i><span
                    class="app-menu__label">成绩录入</span></a></li>
        </c:if>
        <c:if test="${!rtn5}" var="rtn5" scope="page">
            <li><a class="app-menu__item" href="<%= basePath%>teacher/scoreInsert"><i
                    class="app-menu__icon fa fa-edit"></i><span
                    class="app-menu__label">成绩录入</span></a></li>
        </c:if>
    </ul>
</aside>