<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
#top {
/*	width: 100%;
	height: 111px;
	background-repeat: no-repeat;
	background-position: center;
	background-color: #4dc2ea;
	position: relative;*/
}

#user {
	color: #fcff40;
	text-align: center;
	width: 160px;
	height: 25px;
	margin-top: 65px;
	position: absolute;
}

#loginout {
	color: #fcff40;
}
</style>
<body>
<%--	<%
  String str = request.getSession().getAttribute("access").toString();
  String access,name; 
  if(str.equals("1")){
	access = "管理员";
  }else if(str.equalsIgnoreCase("2")){
  	access = "教师";
  }else {
	access = "学生";
  }
  %>--%>
	<div id="top">
		<%--<div id="user">
			<p id="qx" hidden="hidden"><%=access%></p>
			<span><%=access %> : <%=request.getSession().getAttribute("username") %>&nbsp;&nbsp;</span>
			<a id="loginout" href='loginout.jsp' target="_parent">退出</a>
		</div>--%>
	</div>
<div class="layui-header">
	<div class="layui-logo">后台</div>
	<!-- 头部区域（可配合layui已有的水平导航） -->
	<ul class="layui-nav layui-layout-left">
		<li class="layui-nav-item"><a href="/admin/adminIndex.html" target="content-show">控制台</a></li>
		<li class="layui-nav-item"><a href="">商品管理</a></li>
		<li class="layui-nav-item"><a href="">用户</a></li>
		<li class="layui-nav-item">
			<a href="javascript:;">其它系统</a>
			<dl class="layui-nav-child">
				<dd><a href="">邮件管理</a></dd>
				<dd><a href="">消息管理</a></dd>
				<dd><a href="">授权管理</a></dd>
			</dl>
		</li>
	</ul>
	<ul class="layui-nav layui-layout-right">
		<li class="layui-nav-item">
			<a href="javascript:;">
				<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
				贤心
			</a>
			<dl class="layui-nav-child">
				<dd><a href="">基本资料</a></dd>
				<dd><a href="">安全设置</a></dd>
			</dl>
		</li>
		<li class="layui-nav-item"><a href="">退了</a></li>
	</ul>
</div>

<%--	<script src="../../jquery/jquery-3.2.1.min.js"></script>--%>
	<script>
    /*	$(function(){
    		if(($("#qx").text())=="Teacher"){
    			$("#top").css('background-image','url(images/guangdongshiyouhuag.jpg)');
    		}else if(($("#qx").text())=="Admin"){
    			$("#top").css('background-image','url(images/guangdongshiyouhuag.jpg)');
    		}else{
    			$("#top").css('background-image','url(images/guangdongshiyouhuag.jpg)');
    		}
    	
    	
    	});*/
    
    </script>
</body>

