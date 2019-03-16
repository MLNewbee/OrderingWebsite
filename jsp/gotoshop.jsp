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
<title>进店</title>
<style type="text/css">
body {
	background-color: #E3E3E3;
}
</style>
</head>
<style type="text/css">
	#first{
		position: absolute;
		top:0px;
		width: 96%;
		height:50px;
		background-color: white;
	}
	#allshop{
		width: 1150px;
		height: auto;
		background: #E3E3E3;
		position: relative;
		top: 85px;
		border:1px solid black;
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
	#second{
		position: relative;
		top: 50px;
		width:97%;
		height:70px;
		background-color: white;
	}
	.third{
		padding-top: 10px;
		padding-left: 20px;
		width:550px;
		height:300px;
		float:left;
	}
	.forth{
		width:300px;
		height:300px;
		float:left;
		border:1px solid black;
	}
	.fifth{
		width:230px;
		height:300px;
		float:left;
		padding-left: 5px;
		border:1px solid black;
	}
	
	.ID{
		position: relative;
		top:-50px;
		left:-300px;
		opacity: 0;
		z-index: -20;
	}
	
	img{
		width:100%;
		height:100%;
	}
	a{
		text-decoration: none;
		color:black;
	}
	
	.attention{
		display: none;
		width:500px;
		height:300px;
		position: fixed;
		left:350px;
		top:200px;
		border:2px solid black;
		background:#E3E3E3;
		z-index: 3;
	}
	#form{
		position: relative;
	}
	
	
	.delet{
		display: none;
		width: 480px;
		height:150px;
		position:fixed;
		left:350px;
		top:200px;
		border:2px solid black;
		background:white;
		z-index: 3;
	}
	.revise{
		display: none;
		width:500px;
		height:300px;
		position: fixed;
		left:350px;
		top:200px;
		border:2px solid black;
		background:#E3E3E3;
		z-index: 3;
	}
	#form_2{
		position: relative;
	}
	
	#type_2{
		width:45%;
		height: 20px;
		position:relative;
		left:4%;
	}
	#name_2{
		width:45%;
		height: 20px;
		position:relative;
		left:4%;
	}
	#price_2{
		width:45%;
		height: 20px;
		position:relative;
		left:4%;
	}
	
	label{
            position: relative;
        }
        #fileinp{
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
        }
        
        #text{
            color: red;
        }
	
		#btn{
			margin-right: 5px;
            padding: 10px 10px;
            background: #00b0f0;
            color: #FFF;
            border: none;
            border-radius: 7px;
        }

	</style>
<body>
<%List<Goods> goods=(List<Goods>) session.getAttribute("all_goods"); 
  int supplier=(int) session.getAttribute("supplier"); 
  GoodsDao goodsDao=new GoodsDao();%>
<!--第一栏首页-->
<div id="first">
<h2 id="theme"><%=goodsDao.getSupplier(supplier).getCompany()%></h2>
<div id="cont0text">
	<a href="/structs2/jsp/firstpage.jsp">首页&gt;</a>
	</div>
</div>
<br/>
<!--中间搜索栏-->
<div id="second">
	<input style="width:350px;height:30px;margin-left:200px;margin-top: 20px;" type="search" placeholder="请输入商品类型/商品名称">
	<input style="width: 60px; height:30px;margin-bottom: 5px;" type="button" value="搜索">
	<a><input id="Add" style="width: 70px; height:30px;margin-left:300px;margin-bottom: 5px;" type="button" value="关注店铺"></a>
	</div>
	
<!--展示商品-->	
<div id="allshop">
<%
  for(int i=0;i<goods.size();i++){
  if(goods.get(i).getSupplier()==supplier){
  Goods good=goods.get(i);%>
<div class="third">
<div class="forth">
 <img style="position: absolute;width: 300px;height: 300px;" src="<%=basePath+goods.get(i).getImg()%>" alt=""/>
 </div>
<div class="fifth">
	<!--信息表格-->
<table width="100%" height="130px" bordercolor="#B7B7B7" border="0px" cellspacing="0" cellpadding="1">
  <tbody>
    <tr>
      <td width="20%"><p style="color: red;position: relative;left: 0px;top: -25px;font-size: 15px;" ><%=good.getKinds()%></p></td>
      <td width="80%"><h1><strong><%=good.getName()%></strong></h1></td>
    </tr>
  </tbody>
</table>

<table width="100%" height="50px" bordercolor="#B7B7B7" border="0px" cellspacing="0" cellpadding="1">
  <tbody>
    <tr>
      <td width="55%;"><h1 style="color: red;">￥<%=good.getPrice()%></h1></td>
      <td><%=good.getNumber()%>人付款</td>
    </tr>
  </tbody>
</table>

<!--删除/修改按钮以及商品ID-->
<form action="demo_form.php" method="get">
	<a href="/structs2/jsp/productdetails.jsp"><input id="Repair" style="width: 80px; height:30px;margin-left:130px;margin-top:25px;border: 0px;background: #E3E3E3;font-size: 17px;" onMouseOver="document.getElementById('Repair').style.color='blue'" type="button" value="详情"></a>
</form>
</div>

</div>

<%}} %>
</div>

</body>
</html>
