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
    
    <title>待接单</title>
    
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
  <!--这是待接单网页-->

<body>
<div id="first">
	<h2 id="theme">接单处理</h2>
    <div id="cont0text">
	<a href="/structs2/jsp/firstpage.jsp">首页&gt;</a>
	<a>店铺订单&gt;</a>
	<a href="/structs2/jsp/pendingorder.jsp">待接单&gt;</a>
	</div>
</div>

<div id="tab">
<table width="100%" border="0px" >
  <tr align="center" bgcolor="#EFEFEF">
    <th width="8%" height="40">序号</th>
    <th width="15%">订货货物</th>
    <th width="10%">订货数量</th>
    <th width="10%">总金额</th>
    <th width="9%">订单人</th>
    <th width="12%">订单时间</th>
    <th width="20%">收件地址</th>
    <th width="20%">是否接单</th>
  </tr>
   <%
  List<Order> unsolved_orders = (List<Order>)session.getAttribute("unsolved_orders");
  UserDao userDao = new UserDao();
  GoodsDao goodsDao = new GoodsDao();
  %>
  <% 
   int length = unsolved_orders.size();
   for(int i=0;i<length;i++){
  %>
  <tr  align="center" bgcolor="#EFEFEF">
    <td width="8%" height="40"><%=(i+1)%></td>
    <%if(goodsDao.select(unsolved_orders.get(i).getGoods())!=null){ %>
    <td width="15%"><%=goodsDao.select(unsolved_orders.get(i).getGoods()).getName() %></td>
    <%}else{ %>
    <td width="15%"></td>
    <%} %>
    <td width="10%"><%=unsolved_orders.get(i).getAmount()%></td>
    <td width="10%"><%=unsolved_orders.get(i).getSum() %></td>
    <%if(userDao.select(unsolved_orders.get(i).getConsumer())!=null){ %>
    <td  width="9%"><%=userDao.select(unsolved_orders.get(i).getConsumer()).getUsername() %></td>
    <%}else{ %>
    <td width="9%"></td>
    <%} %>
    <%if(unsolved_orders.get(i).getStart_time()!=null){ %>
    <td  width="12%"><%=unsolved_orders.get(i).getStart_time() %></td>
    <%}else{ %>
     <td  width="12%"></td>
    <%
    }
     %>
    <%if(userDao.select(unsolved_orders.get(i).getConsumer())!=null){ %>
    <td  width="20%"><%=userDao.select(unsolved_orders.get(i).getConsumer()).getAddress() %></td>
    <%}else{ %>
    <td width="20%"></td>
    <%} %>
    <td align="center" style="cursor:pointer" >
    <a href="SendOrder?orderId=<%=unsolved_orders.get(i).getId() %>" style="color: #CC3399; text-decoration: none">接单</a>
   </td>
  </tr>
  <%
  }
   %>
</table>
  </body>
</html>
