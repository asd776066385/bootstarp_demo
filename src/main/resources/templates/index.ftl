<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap-table.min.css" />
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-table.min.js"></script>
    <script src="js/bootstrap-table-zh-CN.min.js"></script>
</head>

<body>
<div class="panel panel-default">
    <div class="panel-heading">
        查询条件
    </div>
    <div class="panel-body form-group" style="margin-bottom:0px;">
        <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">姓名：</label>
        <div class="col-sm-2">
            <input type="text" class="form-control" name="Name" id="search_name" />
        </div>
        <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">手机号：</label>
        <div class="col-sm-2">
            <input type="text" class="form-control" name="Name" id="search_tel" />
        </div>
        <div class="col-sm-1 col-sm-offset-4">
            <button class="btn btn-primary" id="search_btn">查询</button>
        </div>
    </div>
</div>
<table id="mytab" class="table table-hover"></table>
</body>
<script>
    $(document).ready(function () {
        $('#mytab').bootstrapTable({
            method: 'get',
            url: "get_data.json", //请求路径
            striped: true, //是否显示行间隔色
            pageNumber: 1, //初始化加载第一页
            pagination: true, //是否分页
            sidePagination: 'server', //server:服务器端分页|client：前端分页
            pageSize: 10, //单页记录数
            pageList: [10, 20, 30], //可选择单页记录数
            showRefresh: true, //刷新按钮
            queryParams: function (params) { //上传服务器的参数
                var temp = { //如果是在服务器端实现分页，limit、offset这两个参数是必须的
                    limit: params.limit, // 每页显示数量
                    page : (params.offset / params.limit) + 1, //当前页码
                    name: $('#search_name').val(),
                    tel: $('#search_tel').val()
                };
                return temp;
            },
            columns: [{
                checkbox: true,
                visible: true                  //是否显示复选框
            }, {
                title: 'id',
                field: 'id',
                sortable: true
            }, {
                title: '姓名',
                field: 'name',
                sortable: true
            }, {
                title: '手机号',
                field: 'tel',
            }, {
                title: '性别',
                field: 'sex',
                formatter: function (value, row, index) {
                    return value == 1 ? "男" : "女";
                }
            }, {
                title: '操作',
                field: 'id',
                formatter: function (value, row, index) {
                    return "<a class='btn btn-xs red' title='删除'><span class='glyphicon glyphicon-remove'>删除</span></a>";
                }
            }]
        })

        //查询按钮事件
        $('#search_btn').click(function () {
            $('#mytab').bootstrapTable('refresh', {
                url: ''
            });
        })

    });
</script>

</html>