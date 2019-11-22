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

<form class="layui-form layui-form-pane" lay-filter="deptInfoEditFrom" id="deptInfoEditFrom">
<%--    <input id="oldid" name="oldid" value="1" hidden="hidden">--%>
    <hr>
    <div class="layui-form-item">
<%--        <label class="layui-form-label" hidden="hidden">部门编号</label>--%>
        <div class="layui-input-block" hidden="hidden">
            <input hidden="hidden" name="id" id="id" lay-filter="id" lay-verify="id|requerid" autocomplete="off"
                   class="layui-input" type="text">
        </div>
        <br> <label class="layui-form-label">部门名称</label>
        <div class="layui-input-block">
            <input name="name" id="name" lay-filter="name" lay-verify="required"
                   autocomplete="off" class="layui-input" type="text">
        </div>
    <br> <label class="layui-form-label">部门简称</label>
    <div class="layui-input-block">
        <input name="nikename" id="nikename" lay-filter="nikename" lay-verify="required"
               autocomplete="off" class="layui-input" type="text">
    </div>
    </div>
    <br>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="submitDeptInfo">立即提交</button>
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

        //监听提交
        form.on('submit(submitDeptInfo)', function (data) {
            $.post("/dept/deptInfoAdd",
                /*JSON.stringify(data.field),*/
                $('#deptInfoEditFrom').serialize(),
                function (addDeptInfoCallback) {
                    if (addDeptInfoCallback.code == "1") {
                        layer.msg("部门名称已存在", {
                            icon: 2,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        });
                    } else if (addDeptInfoCallback.code == "0") {
                        layer.msg("修改成功", {
                            icon: 6,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        }, function () {
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        });
                    } else {
                        layer.msg("修改失败", {
                            icon: 2,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        });
                    }
                });
            return false;
        });
    });
</script>
</body>
</html>