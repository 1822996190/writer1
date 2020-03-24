//按回车快速登陆
$(document).keypress(function (e) {
    if (e.which == 13)
        $('#login').click();
});

//加载弹出层组件
layui.use('layer', function () {
    var layer = layui.layer;
    var username = '', password = '';
    //登录请求
    $("#login").click(function () {

        username = $(" input[ name='username' ] ").val();
        password = $(" input[ name='password' ] ").val();
        if (username == "" || password == "") {
            layer.msg("用户名或密码不能为空！");
            return;
        }
        var data = {
            'username': username,
            'password': password
        };
        $.ajax({
            type: 'post'
            , url: 'login1'
            , contentType: 'application/json;charset=utf-8'
            , data: JSON.stringify(data)
            , success:
                function (rst) {
                    //登录成功或访问量+1
                    if (rst == 10) {
                        layer.msg('用户已被注销,请找管理员');
                    } else if(rst== 1){
                        $.ajax({
                            type: 'post'
                            , url: 'visits'
                            ,data:{}
                            , success:
                                function () {
                                    $.ajax({
                                        type: 'post'
                                        , url: 'login'
                                        , contentType: 'application/json;charset=utf-8'
                                        , data: JSON.stringify(data)
                                        , success:
                                            function (msg) {
                                                if("admin"==msg){
                                                    window.location.href = 'home_admin.jsp';
                                                }else if ("teacher" ==msg){
                                                    window.location.href = 'home_teacher.jsp';
                                                }else{
                                                    window.location.href = 'home_student.jsp';
                                                }
                                                // window.location.href = 'home.jsp';
                                            }
                                    });
                                    // window.location.href = 'home.jsp';
                                }
                        });
                    }else{
                        layer.msg('用户名或密码错误');
                    }
                }
        });

       /*$.ajax({
            type: 'post'
            , url: 'login'
            , contentType: 'application/json;charset=utf-8'
            , data: JSON.stringify(data)
            , success:
                function (rst) {
                    //登录成功或访问量+1
                    if (rst == 1) {
                        $.ajax({
                            type: 'post'
                            , url: 'visits'
                            ,data:{}
                            , success:
                                function () {
                                    window.location.href = 'home.jsp';
                                }
                        });
                    } else {
                        layer.msg('用户名或密码错误');
                    }
                }
        });*/
    });

});
