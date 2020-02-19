<%--
  Created by IntelliJ IDEA.
  User: 段康家
  Date: 2020/1/7
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>积分管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css"
          charset="UTF-8"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js" type="text/javascript"
            charset="utf-8"></script>

    <script>
        $(function () {

            //JavaScript代码区域
            layui.use(['form', 'layedit', 'element', 'laydate', "table"], function () {
                var form = layui.form
                    , element = layui.element
                    , layer = layui.layer
                    , layedit = layui.layedit
                    , laydate = layui.laydate
                    , table = layui.table; //表格

                //加载时生效
                $.post(
                    "${pageContext.request.contextPath}/integral/selectAll",
                    "userId=${userId}",
                    function (data) {
                        var s = data;
                        //执行一个 table 实例
                        table.render({
                            elem: '#demo'
                            , cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增

                            , skin: 'line ' //表格风格 line （行边框风格）row （列边框风格）nob （无边框风格）

                            , even: true //隔行换色
                            , data: s
                            , title: '用户表'
                            , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                                layout: ['prev', 'page', 'next', 'skip'] //自定义分页布局
                                ,
                                groups: 3 //只显示 1 个连续页码
                                ,
                                first: "首页" //不显示首页
                                ,
                                last: "尾页" //不显示尾页
                            }
                            , limit: "10"
                            // ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                            , cols: [[ //表头
                                {
                                    hide: "userId", templet: function (values) {
                                        return values.user.userId;
                                    }
                                }
                                , {
                                    align:'center',field: 'userName', title: '用户名', width: 260, templet: function (values) {

                                        return values.user.userName;
                                    }
                                }
                                , {align:'center',field: 'score', title: '每日积分', width: 260}
                                , {align:'center',field: 'createDate', title: '积分增加时间', width: 265, templet: function (values) {

                                        return layui.util.toDateString(values.createDate, 'yyyy-MM-dd')
                                    }
                                }
                                , , {fixed: '', width: 112, align: 'center', toolbar: '#barDemo'}
                            ]]
                        });
                    },
                    "JSON"
                );


                //单击查询按钮时生效
                $("#sub").click(function () {

                    var val = $("#form").serialize();
                    $.post(
                        "${pageContext.request.contextPath}/integral/selectByTime",
                        val+"&userId=${userId}",
                        function (data) {
                            var s = data;
                            //执行一个 table 实例
                            table.render({
                                elem: '#demo'
                                , cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增

                                , skin: 'line ' //表格风格 line （行边框风格）row （列边框风格）nob （无边框风格）

                                , even: true //隔行换色
                                , data: s
                                , title: '用户表'
                                , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                                    layout: ['prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,
                                    groups: 3 //只显示 1 个连续页码
                                    ,
                                    first: "首页" //不显示首页
                                    ,
                                    last: "尾页" //不显示尾页
                                }
                                , limit: "10"
                                // ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                                , cols: [[ //表头
                                    {
                                        hide: "userId", templet: function (values) {
                                            return values.user.userId;
                                        }
                                    }
                                    , {
                                        align:'center',field: 'userName', title: '用户名', width: 260, templet: function (values) {

                                            return values.user.userName;
                                        }
                                    }
                                    , {align:'center',field: 'score', title: '每日积分', width: 260}
                                    , {align:'center',field: 'createDate', title: '积分增加时间', width: 265, templet: function (values) {

                                            return layui.util.toDateString(values.createDate, 'yyyy-MM-dd')
                                        }
                                    }
                                    , , {fixed: '', width: 112, align: 'center', toolbar: '#barDemo'}
                                ]]
                            });
                        },
                        "JSON"
                    );
                });

                //监听行工具事件
                table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                    var data = obj.data //获得当前行数据
                        , layEvent = obj.event; //获得 lay-event 对应的值
                    if (layEvent === 'detail') {
                        location.href = "${pageContext.request.contextPath}/integral/openAdd?userId="+data.user.userId;
                    } else if (layEvent === 'del') {
                        layer.confirm('真的删除吗？', function (index) {
                            obj.del(); //删除对应行（tr）的DOM结构
                            layer.close(index);
                            //向服务端发送删除指令
                        });
                    }
                });
                //日期
                laydate.render({
                    elem: '#date1',
                    lang: "en"
                });
                //日期
                laydate.render({
                    elem: '#date',
                    lang: "en"
                });
                form.render();
            });
            $("#exit").click(function () {

                location.href = "${pageContext.request.contextPath}/index.jsp";
            });
        });
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">积分管理</div>
    </div>

    <%--    主体--%>
    <div style="width: 60%;margin-left: 20%">

        <%--        动态表格--%>
        <div id="tttt">
            <form style="margin-left: 20%;margin-top: 2%" class="layui-form layui-form-pane" id="form">
                <h2 style="margin-left: 20%" class="layui-label">按时间段查询</h2>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="text" name="startTime" id="date" lay-verify="date" placeholder="开始时间"
                                   autocomplete="off" class="layui-input">
                        </div>
                        -
                    </div>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="text" name="endTime" id="date1" lay-verify="date" placeholder="截至时间"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <button type="button" class="layui-btn" id="sub">查询</button>
                    <button type="button" id="exit" class="layui-btn layui-btn-primary">返回</button>
                </div>
            </form>
            <table  class="layui-hide" id="demo" lay-filter="test"></table>
            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-xs layui-btn-xs" lay-event="detail">添加</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </script>
        </div>




    </div>
</div>
</body>
</html>
