<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="/layui/css/layui.css" media="all">
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>

<body>
	<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="leftTag"
		lay-shrink="all">
		<li class="layui-nav-item layui-nav-itemed"><a
			href="javascript:;">首页</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="javascript:;" target="hsgmain">公告</a>
				</dd>
				<dd>
					<a href="javascript:;">关于软件</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="javascript:;">基本信息维护</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="javascript:;" id="deptInfo">部门信息</a>
				</dd>
				<dd>
					<a href="javascript:;" id="gameCategoryInfo">游戏分类信息</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="javascript:;">游戏管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="teacherAdd.jsp">联系方式添加</a>
				</dd>
				<dd>
					<a href="teacherQuery.jsp" target="content-show">联系方式查询</a>
				</dd>
				<dd>
					<a href="studentAdd.jsp" target="content-show">下载方式添加</a>
				</dd>
				<dd>
					<a href="studentQuery.jsp" target="content-show">下载方式查询</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="javascript:;">成果管理</a>
			<dl class="layui-nav-child">
				<dd>
					<a id = "tag" name="chengguo" href="javascript:;" target="content-show">成果查询</a>
				</dd>
				<dd>
					<a href="/admin/adminIndex.html" target="content-show">成果审核</a>
				</dd>
				<dd>
					<a href="QueryApplying.jsp" target="content-show">成果审核通过</a>
				</dd>
				<dd>
					<a href="QueryApplying.jsp" target="content-show">成果审核未通过</a>
				</dd>
			</dl></li>
	</ul>
	<a id="welcome"></a>
	<script src="/layui/layui.js" charset="utf-8"></script>
<%--	<script src="/layui/lay/modules/jquery.js"/>--%>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
			layui.use(['element','jquery'], function() {
				var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
				var $ = layui.jquery;

				//监听导航点击
				element.on('nav(leftTag)', function(elem) {
					// var tagName = elem.get(0).tagName;
					// console.log($("#tag").is(elem));
					if ($("dd a").is(elem)) {
						// "/admim/"+elem.attr("id")+".html"
						elem.attr("href","/admin/"+elem.attr("id")+".html")
						elem.attr("target","content-show")
					}
				});
			});
		</script>
</body>

</html>