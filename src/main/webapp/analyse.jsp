<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/1/22
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@include file="templates/header.jsp" %>


<html>
<head>
    <title>analyse</title>
</head>
<body>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header" id="to-edit"><i class="edit-analyse"></i>写作面板</div>
                <div class="layui-card-body">
                    <span><textarea id="txt" name="txt" class="layui-textarea" style="display: none">When I kept adjusting how I'd normally ask questions in day to day life, it felt exhausting because I had to put more energy into not only know what questions to ask but also how and when to ask those questions.</textarea></span>
                    <span>Grammar:
                    <input name="grammar" type="radio" value="analytical" checked="checked">analytical
                    <input name="grammar" type="radio" value="reflective">reflective
                    </span>
                    <div style="text-align: right">
                        <button class="layui-btn" id="send">提交</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header" id="to-feedback"><i class="feedback-analyse"></i>反馈面板</div>
                <div class="layui-card-body">
                    <span id="feedback"></span>
                </div>
            </div>
        </div>
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header" id="to-tips"><i class="tips-analyse"></i>提示面板</div>
                <div class="layui-card-body">
                    <span class="span-tips" id="tips"></span>
                </div>
            </div>
        </div>
    </div>
</div>

<%--工具集--%>
<script>
    layui.use(['util', 'layer'], function () {
        var util = layui.util;
        //固定块
        util.fixbar({
            bar1: false
            , css: {right: 50, bottom: 100}
            , bgcolor: '#393D49'
        });
    });
</script>

<script>
    layui.use('layedit', function () {
        var layedit = layui.layedit;
        //构建一个默认的编辑器
        var index = layedit.build('txt');
    });

</script>


<%--jquery提交ajax请求方式--%>
<script src="plugins/jquery.min.js"></script>

<script type="text/javascript" src="pages/analyse.getfeedback.js"></script>

</body>
</html>

<%@include file="templates/footer.jsp" %>