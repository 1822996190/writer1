layui.use(['table','form'], function () {
    layui.form.render('select','myDiv');
    var table = layui.table;
    var $=layui.$;
    var role=$("#xuanzhe").val();
    //加载表格
    table.render({
        elem: '#demo',
        height: 312,
        url: 'query',
        page: true,
        cols: [[
            {field: 'id', title: 'ID', align: 'center', width: 100, unresize: true, sort: true, fixed: 'left'},
            {field: 'username', title: '用户名', align: 'center'},
            {field: 'role_permission', title: '用户类型', align: 'center'},
            {field: 'is_valid', title: '注销状态', align: 'center'},
            {field: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
        ]]
    });
    //表格中的操作，查看和删除
    table.on('tool(test)', function (obj) {
        var layEvent = obj.event;
        var data = obj.data;
        var tr = obj.tr;
        if (layEvent == 'del') {
            layer.confirm('确定删除该行吗？', {offset: '200px'}, function (index) {
                obj.del();
                layer.close(index);
                $.ajax({
                    type: 'delete'
                    , url: 'reflective'
                    , data: {
                        'id': data.id
                    }
                    , success: function (rst) {
                        if (rst == '1')
                            layer.msg('删除成功', {offset: '200px'});
                        else layer.msg('失败', {offset: '200px'});
                    }
                });
            });
        } else if (layEvent === 'detail') {
            layer.alert(data.content, {title: data.title, offset: '200px'})
        }
    });
    //表格中的模糊查询
    $('#title-search').click(function () {
        var title = $("#title-input").val();
        var date_time = $("#date-time").val();
        var start_date = date_time.substring(0, 19);
        var end_date = date_time.substring(22, 41);
        table.reload('demo', {
            url: 'reflective/fuzzy',
            where: {
                "title": title,
                "start_date": start_date,
                "end_date": end_date,
            }
        });
    });


});


