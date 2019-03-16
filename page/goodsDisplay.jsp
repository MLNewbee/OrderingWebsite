<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>login</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<body>
	<form  action="addgoods" method="post">
		商品类型:<input type="text" name="kinds" ><br>
		商品名称:<input type="text" name="name" ><br> 
		商品单价:<input type="text" name="price"><br>
		商品销量:<input type="text" name="number"><br>
		<input type="submit" value="添加"/> 
	</form>
	<form action="deletegoods">
		商品id:<input type="text" name="id" ><br>
		<input type="submit" value="删除">
	</form>
</body>
</html>
