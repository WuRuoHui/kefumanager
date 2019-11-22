<%--
  Created by IntelliJ IDEA.
  User: WRH
  Date: 2019/11/16
  Time: 0:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/layui/layui.js"></script>
</head>
<body>
<div class="layui-tab" lay-filter="showContent" lay-allowclose="true" style="padding-top: 0px;">
    <ul class="layui-tab-title">
        <li class="layui-this" lay-id="11">公告</li>
        <li lay-id="22">用户管理</li>
        <li lay-id="33">权限分配</li>
        <li lay-id="44">商品管理</li>
        <li lay-id="55">订单管理</li>
    </ul>
<%--    <input type="button" id="add">--%>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <%--            <jsp:include page="adminIndex.jsp"/>--%>
            <iframe cellpadding="0px" height="100%" id="content-show" name="content-show" width="100%" border="0"
                    frameborder="0" src="/admin/adminIndex.html"></iframe>
        </div>
        <div class="layui-tab-item">
            <jsp:include page="adminIndex.jsp"/>
        </div>
        <div class="layui-tab-item">内容3</div>
        <div class="layui-tab-item">内容4</div>
        <div class="layui-tab-item">内容5</div>
    </div>
</div>
</body>
<script>
    //JavaScript代码区域
    layui.use(['element','jquery'], function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        var $ = layui.jquery;
        //监听导航点击
/*        element.on('nav(demo)', function(elem) {
            if ($("dd a").is(elem)) {
                alert(1)
                element.tabAdd('demo', {
                    title: '选项卡的标题',
                    content: '选项卡的内容',//支持传入html,
                    id: '选项卡标题的lay-id属性值'
                });
            }
        });*/
    });
</script>
</html>
