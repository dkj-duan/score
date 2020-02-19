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
                    "${pageContext.request.contextPath}/sum/selectByUserName",
                    "",
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
                                {hide: "userId",templet:function (values) {
                                    return values.user.userId;
                                    }}
                                , {align:'center',field: 'userName', title: '用户名', width: 285,templet:function (values) {

                                    return values.user.userName;
                                    }}
                                , {align:'center',field: 'sumScore', title: '用户总积分', width: 285}
                                , , {fixed: '', width: 112, align: 'center', toolbar: '#barDemo'}
                            ]]
                        });
                    },
                    "JSON"
                );

                //单击查询按钮时生效
                $("#sub").click(function () {

                    $("#tttt").show("3000");
                    $("#fff").hide("3000");
                    $("#uuuu").hide("3000");
                    var val = $("#form").serialize();
                    $.post(
                        "${pageContext.request.contextPath}/sum/selectByUserName",
                        val,
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
                                    {hide: "userId",templet:function (values) {
                                            return values.user.userId;
                                        }}
                                    , {align:'center',field: 'userName', title: '用户名', width: 285,templet:function (values) {

                                            return values.user.userName;
                                        }}
                                    , {align:'center',field: 'sumScore', title: '用户总积分', width: 285}
                                    , , {fixed: '', width: 112, align: 'center', toolbar: '#barDemo'}
                                ]]
                            });
                        },
                        "JSON"
                    );
                });

                //单击所有时生效
                $(".dda").click(function () {
                    $("#tttt").show("3000");
                    $("#fff").hide("3000");
                    $("#uuuu").hide("3000");
                    var val = $("#form").serialize();
                    $.post(
                        "${pageContext.request.contextPath}/sum/selectByUserName",
                        val,
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
                                    {hide: "userId",templet:function (values) {
                                            return values.user.userId;
                                        }}
                                    , {align:'center',field: 'userName', title: '用户名', width: 285,templet:function (values) {

                                            return values.user.userName;
                                        }}
                                    , {align:'center',field: 'sumScore', title: '用户总积分', width: 285}
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
                        location.href="${pageContext.request.contextPath}/integral/open?userId="+data.user.userId;
                    } else if (layEvent === 'del') {
                        location.href = "${pageContext.request.contextPath}/integral/openAdd?userId="+data.user.userId;
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
        });


        $(function () {
            $(".dd1").click(function () {
                $("#fff").show("3000");
                $("#uuuu").hide("3000");
                $("#tttt").hide("3000");
            });
            $(".dd2").click(function () {
                $("#uuuu").show("3000");
                $("#fff").hide("3000");
                $("#tttt").hide("3000");
            });

        });
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">积分管理</div>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="dda" href="javascript:;">用户排行</a>
                </li>
<%--                <li class="layui-nav-item">--%>
<%--                    <a href="javascript:;">用户管理</a>--%>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;">列表一</a></dd>--%>
<%--                        <dd><a href="javascript:;">列表二</a></dd>--%>
<%--                    </dl>--%>
<%--                </li>--%>
                <li class="layui-nav-item">
                    <dd class="dd1"><a href="javascript:;">添加用户</a></dd>
                </li>
            </ul>
        </div>
    </div>


    <%--    主体--%>
    <div class="layui-body">

        <%--        动态表格--%>
        <div id="tttt" style="width: 60%;margin-left: 20%">
            <form style="margin-left: 20%;margin-top: 2%" class="layui-form layui-form-pane" id="form" >
                <h2 style="margin-left: 20%" class="layui-label">用户查询</h2>
                <div class="layui-form-item">
                    <label class="layui-form-label">查询条件</label>
                    <div class="layui-input-inline">
                        <select name="judge" lay-verify="required">
                            <option value="1">用户名</option>
                            <option value="2">积分</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="select" lay-verify="required" placeholder="请输入" autocomplete="off"
                               id="userName" class="layui-input">
                    </div>
                    <button type="button" class="layui-btn" id="sub" >查询</button>
                </div>
            </form>
            <table class="layui-hide" id="demo" lay-filter="test"></table>
            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-xs layui-btn-xs" lay-event="detail">查看积分明细</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">添加每日积分</a>
            </script>
        </div>


        <%--            u享--%>
        <div id="fff" style="display: none">
            <!-- 内容主体区域 -->
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                <legend>用户添加</legend>
            </fieldset>
            <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/user/save" method="post" style="width: 800px;margin-left: 20%">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="userName" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
