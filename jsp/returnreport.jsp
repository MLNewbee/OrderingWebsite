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
    
    <title>退货单</title>
    
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
		width:220px;
		height:auto;
		left: 160px;
		top:20px;
	}
	#tab{
		position: relative;
		top: 70px;
		width: 97%;
		background-color: white;
	}
	</style>
  </head>
    
<body>
<div id="first">
	<h2 id="theme">退货单</h2>
    <div id="cont0text">
	<a href="/structs2/jsp/firstpage.jsp">首页&gt;</a>
	<a>店铺订单&gt;</a>
	<a href="/structs2/jsp/returnreport.jsp">退货单&gt;</a>
	</div>
</div>
<div id="tab">
<table width="100%"  border="0">
  <tr align="center" bgcolor="#EFEFEF">
    <th width="9%" height="40">序号</th>
    <th width="15%">货物类型</th>
    <th width="10%">数量</th>
    <th width="11%">退货金额</th>
    <th width="9%">退货人</th>
    <th width="18%">发起时间</th>
   
    
  </tr>
<%
  List<Order> returned_orders = (List<Order>)session.getAttribute("returned_orders");
   UserDao userDao = new UserDao();
  GoodsDao goodsDao = new GoodsDao();
  %>
  <% 
   int length = returned_orders.size();
   for(int i=0;i<length;i++){
  %>
  <tr align="center" bgcolor="#EFEFEF">
     <th width="9%" height="40"><%=(i+1) %></th>
     <%if(goodsDao.select(returned_orders.get(i).getGoods())!=null){ %>
    <th width="15%"><%=goodsDao.select(returned_orders.get(i).getGoods()).getKinds() %></th>
     <%}else{ %>
    <td width="15%"></td>
    <%} %>
    <th width="10%"><%=returned_orders.get(i).getAmount() %></th>
    <th width="11%"><%=returned_orders.get(i).getSum() %></th>
    <%if(goodsDao.select(returned_orders.get(i).getGoods())!=null){ %>
    <th width="9%"><%=userDao.select(returned_orders.get(i).getConsumer()).getUsername()%></th>
     <%}else{ %>
    <td width="9%"></td>
    <%} %>
     <%if(returned_orders.get(i).getStart_time()!=null){ %>
    <th width="18%"><%=returned_orders.get(i).getStart_time() %></th>
    <%}else{ %>
    <th width="18%"></th>
    <%} %>
   
  </tr>
<%
}
 %>
</table>
</body>
</html>
