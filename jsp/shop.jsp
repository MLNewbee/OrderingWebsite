<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.eight.beans.Goods" %>
<%@ page import="com.eight.daos.UserDao" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台货物管理</title>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <style type="text/css">
	
	#first{
		position: absolute;
		top:0px;
		width: 96%;
		height:50px;
	}
	#theme{
		position: relative;
		left:30px;
		top:-8px;
	}
	#containerl{
		position: absolute;
		top: 70px;
		width: 85%;
		left:85px;
		background-color: white;
	}
	</style>
  </head>
  <body>
<div id="first">
	<h2 id="theme">订单详情</h2>
	</div>
<div id="containerl">
<table width="100%"  border="0" align="center">
  <tr align="center" bgcolor="#EFEFEF" >
    <th width="145">货物名称</th>
    <th width="146">货物类型</th>
    <th width="148">货物定价</th>
    <th width="139">货物销量</th>
    <th width="151">处理</th>
  </tr>
  <%
  List<Goods> all_goods_list = (List<Goods>)session.getAttribute("all_goods");
  UserDao userDao = new UserDao();
  %>
  <% 
   int length = all_goods_list.size();
   for(int i=0;i<length;i++){
   Goods good = all_goods_list.get(i);
  %>
  <tr align="center" bgcolor="#EFEFEF" >
    <th width="145"><%=all_goods_list.get(i).getName() %></th>
    <th width="146"><%=all_goods_list.get(i).getKinds() %></th>
    <th width="148"><%=all_goods_list.get(i).getPrice() %></th>
    <th width="139"><%=all_goods_list.get(i).getNumber() %></th>
    <th width="151">
    <a href="ManagementDeleteGoods?goodsId=<%=good.getId()%>">删除</a>
    </th>
  </tr>
  <%
  }
   %>
</table>
</div>
</body>
</html>
