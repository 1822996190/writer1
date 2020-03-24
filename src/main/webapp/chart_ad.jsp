<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/1/25
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="templates/header.jsp" %>

<html>
<head>
    <title>管理-Acawriter</title>
    <script src="plugins/echarts/echarts.common.min.js"></script>
    <script src="js/chart.all.admin.js"></script>
</head>
<body style="background-color: #F2F2F2">
<div  style="padding-left: 160px">
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">管理搜索</div>
                <div class="layui-card-body">
                    <form class="layui-form layui-form-pane">
                        <div class="layui-form-item">

                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block" style="width: 50%">
                                <input class="layui-input" id="title-input" placeholder="输入用户名">
                            </div>

                        </div>
                        <div class="layui-form-item" lay-filter="myDiv">
                            <label class="layui-form-label">用户类型</label>
                            <div class="layui-input-block" style="width: 50%" >
                                <select id="xuanzhe"  lay-filter="mySelect">
                                    <option value="">请选择用户类型</option>
                                    <option value="admin">系统管理员</option>
                                    <option value="teacher">批改老师</option>
                                    <option value="student">学生</option>
                                </select>

                            </div>

                        </div>
                    </form>
                    <button id="title-search" class="layui-btn">Search</button>
                    <table id="demo" lay-filter="test" class="layui-table" lay-data="{id:'demo'}"></table>
                    <script type="text/html" id="barDemo">
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">修改用户</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">注销用户</a>
                    </script>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
</body>
</html>

<%@include file="templates/footer.jsp" %>