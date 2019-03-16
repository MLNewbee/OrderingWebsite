<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.eight.beans.Order" %>
<%@ page import="com.eight.beans.Goods" %>
<%@ page import="com.eight.beans.User" %>
<%@ page import="com.eight.daos.UserDao" %>
<%@ page import="com.eight.daos.GoodsDao" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台订单详情</title>
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
    <th width="145">订单编号</th>
    <th width="146">订单内容</th>
    <th width="148">订单额</th>
    <th width="139">购货人</th>
    <th width="151">购货人地址</th>
    <th width="151">发货店铺</th>
    <th width="151">订单状态</th>
  </tr>
  <%
  List<Order> order_list = (List<Order>)session.getAttribute("all_orders");
  UserDao userDao = new UserDao();
  GoodsDao goodsDao = new GoodsDao();
  %>
  <% 
   int length = order_list.size();
   for(int i=0;i<length;i++){
  %>
   <tr align="center" bgcolor="#EFEFEF" >
    <th width="145"><%=(i+1) %></th>
    <%if(goodsDao.select(order_list.get(i).getGoods())!=null){ %>
    <th width="146"><%=goodsDao.select(order_list.get(i).getGoods()).getName()%></th>
    <%}else{ %>
    <th width="146"></th>
    <%
    }
     %>
    <th width="148"><%=order_list.get(i).getSum() %></th>
    <th width="139"><%=userDao.select(order_list.get(i).getConsumer()).getUsername() %></th>
    <th width="151"><%=userDao.select(order_list.get(i).getConsumer()).getAddress() %></th>
    <th width="151"></th>
    <th width="151"><%=order_list.get(i).getStatus() %></th>
  </tr>
 
  <%
  }
   %>
</table>
</div>
</body>
</html>
