<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.eight.beans.Order" %>
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
    
    <title>已出单网页</title>
    
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
body {
	background-color: #E3E3E3;
}
</style>
</head>
<style type="text/css">
		a{
		text-decoration: none;
		color:black;
	}
	#first{
		position: absolute;
		top:0px;
		width: 96%;
		height:50px;
		background-color: white;
	}
	#theme{
		position: relative;
		left:30px;
		top:-8px;
	}
    #cont0text{
		position:absolute;
		width:180x;
		height:auto;
		left: 160px;
		top:20px;
	}
	#tab{
		position: relative;
		width: 97%;
		top: 70px;
		background-color: white;
	}
	</style>
  </head>
  
    
<body>
<div id="first">
	<h2 id="theme">已出单</h2>
    <div id="cont0text">
	<a href="/structs2/jsp/firstpage.jsp">首页&gt;</a>
	<a>店铺订单&gt;</a>
	<a href="/structs2/jsp/outoforder.jsp">已出单&gt;</a>
	</div>
</div>
<div id="tab">
<table width="100%"  border="0" >
  <tr align="center" bgcolor="#EFEFEF">
    <th width="12%" height="45">已出单号</th>
    <th width="9%">收货人</th>
    <th width="18%">收货地址</th>
    <th width="13%">货物类型</th>
    <th width="10%">出货数量</th>
    <th width="11%">交易额</th>
    <th width="17%">出单时间</th>
    <th width="10%">订单状态</th>
  </tr>
  <%
  List<Order> solved_orders = (List<Order>)session.getAttribute("solved_orders");
  UserDao userDao = new UserDao();
  GoodsDao goodsDao = new GoodsDao();
  %>
  <% 
   int length = solved_orders.size();
   for(int i=0;i<length;i++){
  %>
  <tr align="center" bgcolor="#EFEFEF">
    <td width="12%" height="45"><%=solved_orders.get(i).getId()%></td>
    <%if(userDao.select(solved_orders.get(i).getConsumer())!=null){ %>
    <td  width="9%"><%=userDao.select(solved_orders.get(i).getConsumer()).getUsername()%></td>
    <td width="18%"><%=userDao.select(solved_orders.get(i).getConsumer()).getAddress() %></td>
    <%}else{ %>
    <td width="9%"></td>
    <td width="18%"></td>
    <%} %>
    <%if(goodsDao.select(solved_orders.get(i).getGoods())!=null){ %>
    <td width="13%"><%=goodsDao.select(solved_orders.get(i).getGoods()).getKinds() %></td>
     <%}else{ %>
    <td width="13%"></td>
    <%} %>
    <td width="10%"><%=solved_orders.get(i).getAmount()%></td>
    <td width="11%"><%=solved_orders.get(i).getSum()%></td>
    <%if(solved_orders.get(i).getStart_time()!=null){ %>
    <td width="17%"><%=solved_orders.get(i).getStart_time() %></td>
    <%}else{ %>
    <td width="17%"></td>
    <%} %>
    <td width="10%"><%=solved_orders.get(i).getStatus()%></td>
  </tr>
 <%
 }
  %>
</table>
</body>
</html>
