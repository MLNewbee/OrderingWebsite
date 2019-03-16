<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.eight.beans.Goods" %>
<%@ page import="com.eight.daos.GoodsDao" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<title>商品详情</title>
<style type="text/css">
body {
	background-color: #E3E3E3;
}
</style>
<style>
	#first{
		width:1150px;
		height:50px;
		background-color: white;
	}
	#theme{
		position: relative;
		left:30px;
		top:8px;
	}
	#cont0text{
		position:absolute;
		width:140px;
		height:auto;
		left: 160px;
		top:35px;
	}
	
	#a{
		width: 500px;
		height: 530px;
		border:2px solid #000000;
		margin-left: 200px;
		float:left;
	}
	#b{
		margin-left: 2px;
		margin-top: 10px;
		width:492px;
		height:150px;
		float:left;
	}
	#c{
		margin-left: 2px;
		margin-top:-15px;
		width: 483px;
		height: 95px;
		float:left;
	}
	#d{
		margin-left: 2px;
		margin-top: 2px;
		width: 200px;
		height: 200px;
		float:left;
	}
	#form{
		
		margin-top: -250px;
		padding-left:260px; 
		width:100px;
		height:200px;
		border:#000000;
	}
	#img{
		padding-top: 2px;
		padding-left:10px; 
		width:283px;
		height:285px;
		border:#000000;
	}
	#button{
		width: 80px;
		height: 40px;
		background-color:#DCDCDC;
	}
	a{
		text-decoration: none;
		color:black;
	}
</style>
</head>


<body>
<div id="first">
	<h2 id="theme">商品详情</h2>
	<div id="cont0text">
	<a href="/structs2/jsp/firstpage.jsp">首页></a>
	<a href="/structs2/jsp/productdetails.jsp">商品详情></a>
	</div>
</div>
	
	<br/>
<div id="a">
<%int goodsId=(int)session.getAttribute("goods_id"); 
  GoodsDao goodsDao=new GoodsDao();
  Goods good=goodsDao.select(goodsId);%>
	<img id="img" src="../img/1.jpg">
	<div id="d">
		<table width="100%" height="285" bordercolor="#B7B7B7" border="1px" cellspacing="0" cellpadding="1">
  		<tbody>
    		<tr>
      		<td width="50"><p>商品类型： </p></td>
     		 <td width="40"><%=good.getKinds()%></td>
  		  </tr>
    		<tr>
     		 <td><p>商品名称：</p></td>
     		 <td><%=good.getName()%></td>
    		</tr>
   		 <tr>
      		<td><p>商品价格：</p></td>
      		<td><%=good.getPrice()%></td>
    		</tr>
    		<tr>
     		 <td height="32"><p>商品销量： </p></td>
    		  <td><%=good.getNumber()%></td>
   		 </tr>
 		 </tbody>
		</table>
		</div>
  <div id="b">
			<h3>&nbsp;用户评价</h3>
			<textarea id="c" style="font-size: 15px;">
1.用户1:
  这是一次美妙的购物体验
2.用户2:
  这是一次比用户1更加美妙的用户体验
3.用户3:
  这是一次比用户1用户2更加美妙的用户体验
			
			</textarea>
		</div>
  <a href= "/structs2/html/commoditypayment.html"> <button id="button" style="margin-left: 60px;margin-top: 30px">立即购买</button></a>
  <a href="/structs2/jsp/firstpage.jsp"><button id="button" style="margin-left: 200px;margin-top: 30px">返回上页</button></a>
	
</div>
</body>
</html>
