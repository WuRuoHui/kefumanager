<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
</head>
<body>
<div style="padding-top:10px;text-align: center;">
    <form class="layui-form layui-form-pane" lay-filter="form1">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">部门</label>
                <div class="layui-input-inline">
                    <select name="deptInfoCategory" id="deptInfoCategory" lay-verify="required" style="width: 200px">
                        <option value="">请选择部门</option>
                    </select>
                </div>
                <label class="layui-form-label">游戏主包</label>
                <div class="layui-input-inline">
                    <select name="parentId" id="parentId" lay-verify="required" style="width: 200px">
                        <option value=""></option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">游戏名称</label>
                <div class="layui-input-inline">
                    <input id="name" name="name" autocomplete="off"
                           class="layui-input" type="text">
                </div>
                <div class="layui-input-inline" style="width: 220px">
                    <button type="button" class="layui-btn" id="queryDeptInfo">
                        <i class="layui-icon" style="font-size: 15px;">&#xe615; 查询 </i>
                    </button>
                    <!--  <button type="button" class="layui-btn layui-btn-danger" id="demo2"><i class="layui-icon" style="font-size:15px;">&#xe640; 批量删除</i></button>-->
                    <button type="button" class="layui-btn layui-btn" id="addGameCategoryInfo">
                        <i class="layui-icon" style="font-size: 15px;">&#xe654;添加</i>
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
<!--部门信息表格-->
<div style="text-align: center;">
    <div class="layui-inline">
        <table id="deptInfo" lay-filter="deptInfo"></table>
    </div>
</div>

<script src="/layui/layui.js"></script>
<script src="/jquery/jquery-2.1.0.min.js"></script>
<script type="text/html" id="operatBar">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/javascript">

</script>

<script>
    layui.use(['layer', 'jquery', 'form', 'table'], function () {
        var form = layui.form;
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;

        $.ajax({
            url: "/search/gameCategory",    //查询游戏分类信息
            type: "POST",
            dataType: "json",
            success: function (callback) {
                for (i = 0; i < callback.length; i++) {
                    $("#parentId").append("<option value=" + callback[i].id + ">" + callback[i].name + "</option>");
                }
                form.render("select");
            }
        });

        $.ajax({
            url: "/dept/deptInfoCategory",    //查询部门分类信息
            type: "POST",
            dataType: "json",
            success: function (data) {
                for (i = 0; i < data.length; i++) {
                    $("#deptInfoCategory").append("<option id='deptInfoCategoryOption' value=" + data[i].id + ">" + data[i].name + "</option>");
                }
                form.render("select");
            }
        });

        //部门信息数据表格
        var tableIns = table.render({
            elem: '#deptInfo',
            method: 'POST',
            skin: 'row', //行边框风格
            cellMinWidth: 20, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            even: true,//开启隔行背景
            width: 800,
            height: 400,
            url: '/search/game',
            page: true, //开启分页
            cols: [
                [ //表头
                    {
                        type: 'numbers',
                        title: '序号'
                    }, {
                    field: 'name',
                    title: '游戏名',
                    align:'center',
                },  {
                    field: 'parentName',
                    title: '父包名称',
                    align:'center',
                    templet:function (d) {
                        if (d.parentName==null) {
                            return "无";
                        }
                    }
                }, {
                    field: 'status',
                    title: '是否上架',
                    align:'center',
                    sort: true,
                    templet:function (d) {
                        if (d.status == 1) {
                            return "是";
                        } else {
                            return "否";
                        }
                    }
                }, {
                    field: 'created',
                    title: '创建时间',
                    align:'center',
                    sort: true,
                    minWidth: 150,
                    templet:function (d) {
                        var date = new Date(d.created);
                        var y = date.getFullYear();
                        var m = date.getMonth()+1;
                        var d = date.getDate();
                        return y+"-"+m+"-"+d;
                    }
                }, {
                    fixed: 'right',
                    align: 'center',
                    toolbar: '#operatBar',
                    title: '操作',
                    minWidth: 150
                }
                ]
            ]
        });
        //监听工具条，tool()中的内容是表格的lay-filter
        table.on('tool(deptInfo)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            if (layEvent === 'edit') { //编辑
                layer.open({
                    type: 2,
                    content: '/admin/deptInfoEdit', //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                    title: '修改成果分类信息',
                    shade:"#332224",
                    fixed: false,
                    // area: ['400px', '400px'],
                    maxmin: true, //最大化，最小化
                    success: function (layero, index) {
                        //给表单赋值
                        var body = layer.getChildFrame('body', index); //巧妙的地方在这里哦
                        body.contents().find("#id").val(data.id);
                        body.contents().find("#name").val(data.name);
                    },
                    end: function () {
                        tableIns.reload({
                            where: {
                                id: $("#id").val(),
                                name: $("#name").val()
                            }
                        })
                    }
                });
            } else if (layEvent === 'del') { //删除
                layer.confirm('确认要删除吗，删除后不能恢复',
                    {
                        title: "删除确认"
                    },
                    function (index) {
                        //obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                        layer.close(index);
                        $.ajax({
                            url: "/dept/deptInfoDelete",  //部门信息删除
                            type: "POST",
                            dataType: "json",
                            data: {"id": data.id},
                            success: function (deleteDeptInfoCallback) {
                                if (deleteDeptInfoCallback.code = "0") {
                                    layer.msg('删除成功', {
                                        icon: 6,
                                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                    }, function () {
                                        tableIns.reload()
                                    });
                                } else {
                                    layer.alert(deleteDeptInfoCallback.msg)
                                }
                            }
                        })
                    });
            }
        });

        //添加按钮
        $("#addGameCategoryInfo").click(function () {
            layer.open({
                type: 2,
                title: '添加游戏分类信息',
                shade: 0,
                fixed: false,
                area: ['400px', '400px'],
                maxmin: true, //最大化，最小化
                content: '/admin/gameCategoryInfoEdit',
                end: function () {
                    tableIns.reload({
                        where: {
                            id: $("#id").val(),
                            name: $("#name").val()
                        }
                    })
                }
            });
        });

        $("#queryDeptInfo").click(function () { //查询按钮
            tableIns.reload({
                url: "/search/game",
                where: {
                    deptId:$("#deptInfoCategory").val(),
                    parentId: $("#parentId").val(),
                    name: $("#name").val()
                },
                page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
        });

        /*$("#demo2").click(function () {
            var checkStatus = table.checkStatus('demo');
            var data = checkStatus.data;
            var length = data.length;
            if (length === 0) {
                layer.alert('请至少选择一条数据删除', {
                    title: '删除提示',
                    icon: 2
                }); //这时如果你也还想执行yes回调，可以放在第三个参数中
            } else {
                layer.confirm('是否批量删除' + length + '条数据,删除后不可恢复', {
                    icon: 3,
                    title: '删除提示'
                }, function (index) {

                    var ids = "";
                    for (var i = 0; i < length; i++) {
                        var id = data[i].id;
                        ids = ids + id + ";";
                    }
                    $.ajax({
                        url: 'MajorQuery',
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            "id": ids,
                            "methodname": "deletemulti"
                        },
                        success: function (data) {
                            if (data.success == "true") {
                                layer.msg(data.msg, {
                                    icon: 6,
                                    time: 1000 //1秒关闭（如果不配置，默认是3秒）
                                }, function () {

                                    $("#demo1").click();

                                });
                            } else {
                                layer.alert(data.msg);
                            }
                        }
                    });
                    layer.close(index);
                });
            }
        });*/
    });
</script>
</body>
</html>