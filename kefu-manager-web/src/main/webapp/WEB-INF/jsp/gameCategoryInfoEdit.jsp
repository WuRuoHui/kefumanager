<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
</head>
<body>

<form class="layui-form layui-form-pane" lay-filter="gameInfoEditFrom" id="gameInfoEditFrom">
    <%--    <input id="oldid" name="oldid" value="1" hidden="hidden">--%>
    <hr>
    <div class="layui-form-item">
        <label class="layui-form-label">部门名称</label>
        <div class="layui-input-inline">
            <select name="deptId" id="deptId" lay-filter="deptId" lay-verify="required" style="width: 200px">
                <option value="">请选择部门</option>
            </select>
        </div>
        <br> <label class="layui-form-label">是否父包</label>
        <div class="layui-input-block">
            <input type="checkbox" name="isParent" lay-filter="isParent" lay-skin="switch" lay-text="是|否"
                   checked="checked" value="1">
        </div>
        <br> <label class="layui-form-label">父包名称</label>
        <div class="layui-input-block">
            <select name="parentName" id="parentName" lay-filter="parentName" style="width: 200px">
                <option value="">请选择父包</option>
            </select>
        </div>
        <br> <label class="layui-form-label">游戏名称</label>
        <div class="layui-input-block">
            <input name="name" id="name" lay-filter="name" lay-verify="required"
                   autocomplete="off" class="layui-input" type="text">
        </div>
    </div>
    <br>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="submitGameCategoryInfo">立即提交</button>
            <button type="button" class="layui-btn" id="cancle">取消</button>
        </div>
    </div>
</form>

<script src="/layui/layui.js"></script>
<script src="/jquery/jquery-2.1.0.min.js"></script>

<script type="text/javascript">
    layui.use(['form', 'layer'], function () {
        var form = layui.form;
        var layer = layui.layer;

        $.ajax({
            url: "/dept/deptInfoCategory",    //查询部门分类信息
            type: "POST",
            dataType: "json",
            success: function (data) {
                for (i = 0; i < data.length; i++) {
                    $("#deptId").append("<option id='deptInfoCategoryOption' value=" + data[i].id + ">" + data[i].name + "</option>");
                }
                form.render("select");
            }
        });

        form.on('switch(isParent)', function (data) {
            if (!data.elem.checked) {
                $.ajax({
                    url: "/search/gameCategory",    //查询游戏分类信息
                    type: "POST",
                    dataType: "json",
                    success: function (callback) {
                        for (i = 0; i < callback.length; i++) {
                            $("#parentName").append("<option value=" + callback[i].id + ">" + callback[i].name + "</option>");
                        }
                        form.render("select");
                    }
                });
            }
        });

        form.verify({
            id: function (value, item) { //value：表单的值、item：表单的DOM对象
                if (!/^\d{4}$/.test(value)) {
                    return '请输入4位数字';
                }
            }
        });
        //监听提交
        form.on('submit(submitGameCategoryInfo)', function (data) {
            $.post("/game/gameInfoAdd",
                /*JSON.stringify(data.field),*/
                $('#gameInfoEditFrom').serialize(),
                function (addGameInfoCallback) {
                    if (addGameInfoCallback.code == "1") {
                        layer.msg("游戏名称已存在", {
                            icon: 2,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        });
                    } else if (addGameInfoCallback.code == "0") {
                        layer.msg("操作成功", {
                            icon: 6,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        }, function () {
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        });
                    } else {
                        layer.msg("操作失败", {
                            icon: 2,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        });
                    }
                });
            return false;
        });

        /*   $("#cancle").click(function () {
               layer.confirm('是否取消添加', {
                   icon: 3,
                   title: '添加提示'
               }, function () {
                   var index = parent.layer.getFrameIndex(window.name);
                   parent.layer.close(index);
               });
           });*/
    });
</script>
</body>
</html>