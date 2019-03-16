<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.eight.beans.Order" %>
<%@ page import="com.eight.beans.Goods" %>
<%@ page import="com.eight.beans.User" %>
<%@ page import="com.eight.daos.UserDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单列表</title>
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
		width:140px;
		height:auto;
		left: 160px;
		top:20px;
	}
	#containerl{
		position: absolute;
		top: 80px;
		width: 96%;
		background-color: white;
	}
	</style>
  </head>

 <body>
<div id="first">
	<h2 id="theme">购物订单</h2>
    <div id="cont0text">
	<a href="/structs2/jsp/firstpage.jsp">首页&gt;</a>
	<a href="/structs2/jsp/orderlist.jsp">购物订单&gt;</a>
	</div>
</div>

<div id="containerl">
<table width="100%"  border="0" align="center">
  <tr align="center" bgcolor="#EFEFEF" >
    <th width="62" height="40">序号</th>
    <th width="145">货物名称</th>
    <th width="66">数量</th>
    <th width="75">总金额</th>
    <th width="180">收货地址</th>
    <th width="87">下单时间</th>
    <th width="75">订单状态</th>
     <th width="75">是否签收</th>
    <th width="75">评价</th>
  </tr>
    <%
  List<Order> order_list = (List<Order>)session.getAttribute("all_orders");
  List<Goods> orders_goods_list = (List<Goods>)session.getAttribute("orders_goods");
  List<User> orders_user_list = (List<User>)session.getAttribute("orders_user");
  %>
  <% 
   int length = order_list.size();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   for(int i=0;i<length;i++){
  %>
   <tr align="center" bgcolor="#EFEFEF" >
    <td width="62" height="40"><%=(i+1)%></td>
    <%if(orders_goods_list.get(i)!=null){ %>
    <td width="145"><%=orders_goods_list.get(i).getName()%></td>
     <%}else{ %>
    <td width="145"></td>
    <%} %>
    <td width="66"><%=order_list.get(i).getAmount()%></td>
    <td width="75"><%=order_list.get(i).getSum()%></td>
    <%if(orders_user_list.get(i)!=null){ %>
    <td width="180"><%=orders_user_list.get(i).getAddress()%></td>
     <%}else{ %>
    <td width="180"></td>
    <%} %>
    <%if(order_list.get(i).getStart_time()!=null){ %>
    <td width="87"><%=order_list.get(i).getStart_time()%></td>
    <%}else{ %>
    <td width="87"></td>
    <%} %>
    <td width="75"><%=order_list.get(i).getStatus()%></td>
    <td width="75">
      <a href="ReceiveOrder?orderId=<%=order_list.get(i).getId() %>" style="color: #CC3399; text-decoration: none">签收</a>
    </td>
    <td width="75">
       <a href="CommentManageActionSelect?orderId=<%=order_list.get(i).getId() %>" style="color: #CC3399; text-decoration: none">详情</a>
    </td>
   </tr>
   <%
   }
    %>
</table>
</div>
</body>
</html>
