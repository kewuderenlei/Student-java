<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/toastr.min.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath%>resources/css/toastr.css">
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
            <h1><i class="fa fa-building"></i> 院系管理</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<%= basePath%>admin/department/all">院系管理</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <form class="form-group col-md-12" action="" id="form1" name="form1">
                    <div class="row">
                        <div class="col-lg-4">
                            <label>院系编号</label>
                            <input class="form-control" type="text" id="ID" name="ID" placeholder="请输入院系编号" required>
                        </div>
                        <div class="col-lg-4">
                            <label>院系名称</label>
                            <input class="form-control" type="text" id="name" name="name" placeholder="请输入院系名称"
                                   required>
                        </div>
                    </div>
                    <div class="tile-footer">
                        <button class="btn btn-primary" type="button" onclick="addSub()">添加</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <form class="tile" name="form2" id="form2">
                <div class="tile-body">
                    <table class="table table-hover table-bordered" id="scoreTable">
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="sel" name="sel" onclick="selectAll()"></th>
                            <th>序号</th>
                            <th>院系编号</th>
                            <th>院系名称</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${departmentList}" var="department" varStatus="status">
                            <tr>
                                <input type="hidden" id="sid" name="sid" value="${department.id}">
                                <input type="hidden" id="sid${department.id}" name="sid${department.id}"
                                       value="${department.id}">
                                <input type="hidden" id="size" name="size" value="${fn:length(departmentList)}">
                                <td><input type="checkbox" id="deptBox" name="deptBox" value="${department.id}"></td>
                                <td>${status.count}</td>
                                <td>${department.collId}
                                        <%--                                    <input class="form-control col-md-6" type="text" id="collNo${department.id}"--%>
                                        <%--                                           name="collNo${department.collId}" value="${department.collId}" required>--%>
                                </td>
                                <td>${department.collName}
                                        <%--                                    <input class="form-control col-md-6" type="text" id="collName${department.id}"--%>
                                        <%--                                           name="collName${department.collName}" value="${department.collName}"--%>
                                        <%--                                           required>--%>
                                </td>
                                <td>
                                        <%--                                    <input class="btn btn-primary" type="button" value="编辑"--%>
                                        <%--                                           onclick="upSub('${department.collId}', '${department.collName}', '${department.id}')"/>--%>

                                    <input id="popupEdit" class="btn btn-primary" data-toggle="modal"
                                           data-target="#editform" type="button" value="编辑" onclick="Values('${department.collId}', '${department.collName}', '${department.id}')"/>
                                    <button id="deptId" class="btn btn-danger"
                                            onclick="deleteSub('0', ${department.id})" type="button">删除
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="tile-footer">
                    <button class="btn btn-danger" type="button" onclick="deleteSub('1', null)">删除</button>
                </div>

                <!-- 模态框（Modal） -->
                <div class="modal fade" id="editform" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <%--                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--%>
                                <h4 class="modal-title" id="myModalLabel">编辑</h4>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="cid" id="cid">
                                院系编号：<input class="form-control col-md-6" type="text" name="cno" id="cno"/>
                                院系名称：<input class="form-control col-md-6" type="text" name="cname" id="cname"/>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" onclick="upSub()">提交更改</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal -->
                </div>
                <!-- 模态框（Modal）end -->

            </form>

        </div>
    </div>
</main>
<!-- Essential javascripts for application to work-->
<script src="<%= basePath%>resources/js/jquery-3.2.1.min.js"></script>
<script src="<%= basePath%>resources/js/popper.min.js"></script>
<script src="<%= basePath%>resources/js/bootstrap.min.js"></script>
<script src="<%= basePath%>resources/js/main.js"></script>
<script src="<%= basePath%>resources/js/toastr.min.js"></script>
<script type="text/javascript" src="<%= basePath%>resources/js/Ewin.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="<%= basePath%>resources/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%= basePath%>resources/js/plugins/dataTables.bootstrap.min.js"></script>

<script type="text/javascript">
    $('#scoreTable').DataTable();
    // $(function () {
        // $('#popupEdit').on('click', function(){
        //     $('#editform').modal('show');
        // });
        // $('#editform').on('show.bs.modal', function (event) {
        //     var modal = $(this);  //get modal itself
        //     var id = modal.attr("id");
        //     // modal.find('.modal-body #cno').val('1');
        //     // modal.find('.modal-body #cname').val('your message');
        // });
    // });
</script>
<script type="text/javascript">
    toastr.options = { // toastr配置
        "closeButton": false, //是否显示关闭按钮
        "debug": false, //是否使用debug模式
        "progressBar": false, //是否显示进度条，当为false时候不显示；当为true时候，显示进度条，当进度条缩短到0时候，消息通知弹窗消失
        "positionClass": "toast-center-center",//显示的位置
        "showDuration": "500", //显示的动画时间
        "hideDuration": "1000", //消失的动画时间
        "timeOut": "2000", //展现时间
        "extendedTimeOut": "1000", //加长展示时间
        "showEasing": "swing", //显示时的动画缓冲方式
        "hideEasing": "linear", //消失时的动画缓冲方式
        "showMethod": "fadeIn", //显示时的动画方式
        "hideMethod": "fadeOut" //消失时的动画方式
    }

    function Values(cno, cname, cid) {
        $('#cid').val(cid);
        $('#cno').val(cno);
        $('#cname').val(cname);
    }

    //全选
    function selectAll() {
        var allsel = document.getElementsByName("deptBox");
        for (var i = 0; i < allsel.length; i++) {
            allsel[i].checked = !allsel[i].checked;
        }
    }

    //修改
    function upSub() {
        var vid = $('#cid').val();
        var vNo = $("#cno").val();
        var vName = $("#cname").val();

        if (vNo === "") {
            toastr.warning('请输入院系编号');
            return;
        }

        if (vName === "") {
            toastr.warning('请输入院系名称');
            return;
        }
        Ewin.confirm({message: "确认要修改吗？"}).on(function (e) {
            if (!e) {
                return;
            }

            $.ajax({
                type: 'POST',
                url: '<%= basePath%>admin/department/update',
                dataType: 'json',
                data: {
                    collNo: vNo,
                    collName: vName,
                    collId: vid,
                },
                success: function (result) {
                    if (!result.success) {
                        toastr.warning(result.message);
                    } else {
                        toastr.success(result.message);
                        setTimeout(function () {
                            window.location.reload();
                        }, 2000);
                    }
                }
            });
        });
    }

    //删除
    function deleteSub(type, value) {
        var subURL = '';
        // var vid = $('input[name="sid"]').val();
        if (type === '0') {
            subURL = '<%= basePath%>admin/department/delete';
            $('#sid').val(value);
        } else if (type === '1') {
            var vcount = 0;
            var allsel = document.getElementsByName("deptBox");
            for (var i = 0; i < allsel.length; i++) {
                if (allsel[i].checked) {
                    vcount++;
                }
            }
            if (vcount === 0) {
                toastr.warning('请选择要删除的记录!');
                return;
            }
            subURL = '<%= basePath%>admin/department/deleteSel';
        }

        Ewin.confirm({message: "确认要删除选择的数据吗？"}).on(function (e) {
            if (!e) {
                return;
            }
            $.ajax({
                type: 'POST',
                url: subURL,
                dataType: 'json',
                data: $('#form2').serialize(),
                success: function (result) {
                    if (!result.success) {
                        toastr.warning(result.message);
                    } else {
                        toastr.success(result.message);
                        setTimeout(function () {
                            window.location.reload();
                        }, 2000);
                    }
                }
            });
        });

    }

    //添加
    function addSub() {
        var vid = $('#ID').val();
        var vname = $('#name').val();
        if (vid === "") {
            toastr.warning('请输入院系编号!');
            return;
        }
        if (vname === "") {
            toastr.warning('请输入院系名称!');
            return;
        }

        $.ajax({
            type: 'POST',
            url: '<%= basePath%>admin/department/insert',
            dataType: 'json',
            data: $('#form1').serialize(),
            success: function (result) {
                if (!result.success) {
                    toastr.warning(result.message);
                } else {
                    toastr.success(result.message);
                    setTimeout(function () {
                        window.location.reload();
                    }, 2000);
                }
            }
        });
    }
</script>
</body>
</html>