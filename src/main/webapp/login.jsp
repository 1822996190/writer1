<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/2/18
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆-Acawriter</title>
    <!-- Normalize.css是一种CSS reset的替代方案。它在默认的HTML元素样式上提供了跨浏览器的高度一致性。
    相比于传统的CSS reset， Normalize.css是一种现代的、为HTML5准备的优质替代方案
目的：
保护有用的浏览器默认样式而不是完全去掉它们
一般化的样式：为大部分HTML元素提供
修复浏览器自身的bug并保证各浏览器的一致性
优化CSS可用性：用一些小技巧
解释代码：用注释和详细的文档来
-->
    <link rel="stylesheet" type="text/css" href="css/login/css/normalize.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/login/css/demo.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/style1.css"/>
    <!--必要样式-->
    <!-- 组件component.min.css是bootstrap经过压缩的css文件-->
    <link rel="stylesheet" type="text/css" href="css/login/css/component.min.css"/>
    <link rel="stylesheet" type="text/css" href="plugins/layui/css/layui.min.css"/>
    <script type="text/javascript" src="plugins/jquery.min.js"></script>
    <script type="text/javascript" src="plugins/layui/layui.min.js"></script>
</head>
<body>
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box">
                <h3 style="font-family: panel-">WelCome to AcaWriter</h3>

                <div class="input_outer">
                    <span class="u_user"></span>
                    <input name="username" class="text" style="color: #FFFFFF !important" type="text"
                           placeholder="Username">
                </div>
                <div class="input_outer">
                    <span class="us_uer"></span>
                    <input name="password" class="text"
                           style="color: #FFFFFF !important; position:absolute; z-index:100;"
                           type="password" placeholder="Password">
                </div>
                <div style="text-align: center">
                    <a href="register.jsp" class="layui-btn layui-btn-radius"
                            style="color: #FFFFFF;font-family: panel-;font-size: 26px">register
                    </a>
                    <button id="login" class="layui-btn layui-btn-normal layui-btn-radius"
                            style="color: #FFFFFF;font-family: panel-;font-size: 26px">login
                    </button>
                </div>

            </div>
        </div>
    </div>
</div><!-- /container -->
<!-- GSAP JS脚本动画 TweenLite.js EasePack.js  -->
<script src="css/login/js/TweenLite.js"></script>
<script src="css/login/js/EasePack.js"></script>
<!-- requestAnimationFrame(rAF)是浏览器用于定时循环操作的一个接口，类似于setTimeout，
主要用途是按帧对网页进行重绘。
rAF的优势，在于充分利用显示器的刷新机制，比较节省系统资源。显示器有固定的刷新频率（60Hz或75Hz），
也就是说，每秒最多只能重绘60次或75次，rAF的基本思想就是与这个刷新频率保持同步，
利用这个刷新频率进行页面重绘。此外，使用这个API，一旦页面不处于浏览器的当前标签，
就会自动停止刷新。这就节省了CPU、GPU和电力。
-->
<script src="css/login/js/rAF.min.js"></script>
<script src="css/login/js/demo-1.min.js"></script>
<script src="js/login.all.js"></script>
</body>
</html>
