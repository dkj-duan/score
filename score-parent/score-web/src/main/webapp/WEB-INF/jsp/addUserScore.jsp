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

        <%--            u享--%>
        <div id="fff" >
            <!-- 内容主体区域 -->
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                <legend>用户积分添加</legend>
            </fieldset>
            <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/integral/add" method="post"
                  style="width: 800px;margin-left: 20%">
                <input type="hidden" name="userId" value="${user.userId}">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="userName" lay-verify="required" readonly="readonly" placeholder="请输入" autocomplete="off"
                               class="layui-input" value="${user.userName}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">用户总积分</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sumScore" lay-verify="required" readonly="readonly" placeholder="请输入" autocomplete="off"
                               class="layui-input" value="${sums[0].sumScore}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">新增积分</label>
                    <div class="layui-input-inline">
                        <input type="text" name="score" lay-verify="required"  placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">添加时间</label>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="text" name="createDate" id="date1" lay-verify="date" placeholder="请输入"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    <button type="button" id="exit" class="layui-btn" lay-submit="" lay-filter="demo1">返回</button>
                </div>
            </form>
        </div>

    </div>
</div>
</body>
</html>
