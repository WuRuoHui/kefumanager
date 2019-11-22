<%--
  Created by IntelliJ IDEA.
  User: WRH
  Date: 2019/11/15
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/layui/layui.js"></script>
    <script>
        //JavaScript代码区域
        layui.use(['element', 'jquery'], function () {
            var $ = layui.jquery;
            var element = layui.element;
            element.on('nav(leftTag)', function (elem) {
                if ($("dd a").is(elem)) {
                    alert(elem.tag)
                    element.tabAdd('showContent', {
                        title: '选项卡的标题',
                        content: '选项卡的内容',//支持传入html,
                        id: '选项卡标题的lay-id属性值'
                    });
                }
            });
        });
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <jsp:include page="top.jsp"/>
    <div style="width: 100%; height: 700px; background-color: #B0CFEB">
        <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="200" height=700px valign="top" style="background-color: #393D49">
                    <iframe height="100%" width="100%" border="0" frameborder="0" src="adminLeft.html"></iframe>
                </td>
                <td valign="top" height="100%" style="padding-top:0px;padding-left:5px; background-color: #FFFFFF">
                    <iframe cellpadding="0px" height="100%" id="content-show" name="content-show" width="100%"
                            border="0" frameborder="0" src="adminIndex.html"></iframe>
                </td>
            </tr>
        </table>
    </div>
    <jsp:include page="bottom.jsp"/>
</div>
</body>
</html>
