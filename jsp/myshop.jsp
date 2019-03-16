<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.eight.beans.Goods"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<title>我的店铺</title>
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
		width:1150px;
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
	
	.add{
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

<!--第一栏首页-->
<div id="first">
<h2 id="theme">我的店铺</h2>
<div id="cont0text">
	<a href="/structs2/jsp/firstpage.jsp">首页&gt;</a>
	<a href="/structs2/jsp/myshop.jsp">我的店铺&gt;</a>
	</div>
</div>

<!--增加商品-->
<div id="add" class="add">
<form id="form" action="addgoods" method="post">
   	<table width="498" border="1" cellspacing="0" cellpadding="0" style="border: 2px solid white;">
  <tbody>
    <tr height="60px;">
		<td><font style="font-size: 25px;margin-left: 10px;">商品类型：</font>
      <input style="width: 300px;height: 25px; margin-bottom:15px; " type="text" autofocus  id="type" name="kinds"/></td>
    </tr>
    <tr height="60px;">
		<td><font style="font-size: 25px;margin-left: 10px;">商品名称：</font>
      <input style="width: 300px;height: 25px; margin-bottom:15px; " type="text" autofocus  id="name" name="name"/></td>
    </tr>
    <tr height="60px;">
		<td><font style="font-size: 25px;margin-left: 10px;">商品价格：</font>
      <input style="width: 300px;height: 25px; margin-bottom:15px; " type="text" autofocus  id="price" name="price"/></td>
    </tr>
 
  </tbody>
</table>

    	<input onClick="document.getElementById('add').style.display='none'" style="width: 100px;height: 50px; border: 0px;margin-top:30px;margin-left:80px;border-radius: 5px;background: #ff9232;color: white;font-size: 25px;" type="submit" value="确定"/>
		<input onClick="document.getElementById('add').style.display='none'" style="width: 100px;height: 50px; border: 0px;margin-top:10px;margin-left:130px;border-radius: 5px;background: #ff9232;color: white;font-size: 25px;" type="button" value="取消"/>
</form>
</div>

<br/>
<!--中间搜索栏-->
<div id="second">
	<input style="width:350px;height:30px;margin-left:200px;margin-top: 20px;" type="search" placeholder="请输入商品类型/商品名称">
	<input style="width: 60px; height:30px;margin-bottom: 5px;" type="button" value="搜索">
	<a><input id="Add" onClick="document.getElementById('add').style.display='block';" style="width: 70px; height:30px;margin-left:250px;margin-bottom: 5px;" type="button" value="增加商品"></a>
	</div>
	
<!--展示商品-->	
<div id="allshop">
<%List<Goods> goods=(List<Goods>) session.getAttribute("all_goods");
  int user_id=(int) session.getAttribute("user_id");
for(int i=0;i<goods.size();i++){
if(goods.get(i).getSupplier()==user_id){
Goods good=goods.get(i);%>
<div class="third">
<div class="forth">
 <!--商品图片-->
 <%if(goods.get(i).getImg()!=null){ %>
 <img style="position: absolute;width: 300px;height: 300px;" src="<%=basePath+goods.get(i).getImg()%>" alt=""/>
 <%} %>
<form action="upload?goodsId=<%=goods.get(i).getId()%>" enctype="multipart/form-data" method="post" onMouseOver="document.getElementById('<%=i %>').style.opacity='1'" onMouseOut="document.getElementById('<%=i %>').style.opacity='0'"  id="<%=i %>" style="width:300px;height: 300px;position: absolute;margin-left:0px;margin-top: 0px;display: block;opacity:0;">
  <table id="table" style="position: absolute; width: 192px; margin-left: 100px; margin-top: 100px;"  border="0" cellspacing="0" cellpadding="0">
  <tbody>
    <tr>
      <td>
      <label for="fileinp">
        <input type="button" id="btn" value="点我上传"  ><span id="text">&nbsp;</span>
        <input type="file" id="fileinp" name="filename">
</label>
      </td>
    </tr>
    <tr>
    	<input type="submit" value="提交" onClick="document.getElementById('<%=i %>').style.opacity='0'" style="position: absolute;top: 180px;left: 100px; font-size: 25px;border-radius: 10px;width: 75px;">
    </tr>
  </tbody>
</table>
 </form>
 </div>

<div class="fifth">
	<!--信息表格-->
<table width="100%" height="130px" bordercolor="#B7B7B7" border="0px" cellspacing="0" cellpadding="1">
  <tbody>
    <tr>
      <td width="20%"><p style="color: red;position: relative;left: 0px;top: -25px;font-size: 15px;" ><%=good.getKinds()%> </p></td>
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
	<a><input id="<%=i+"u" %>" style="width: 80px; height:30px;margin-left:0px;margin-top:25px;border: 0px;background: #E3E3E3;font-size: 17px;" onMouseOver="document.getElementById('<%=i+"u" %>').style.color='red'" onMouseOut="document.getElementById('<%=i+"u" %>').style.color='black'" onClick="document.getElementById('<%=i+"rivice" %>').style.display='block'" type="button" value="修改商品"></a>
	
	<a><input id="<%=i+"d" %>" style="width: 80px; height:30px;margin-left:50px;margin-top:7px;border: 0px;background: #E3E3E3;font-size: 17px;" onMouseOver="document.getElementById('<%=i+"d" %>').style.color='red'" onMouseOut="document.getElementById('<%=i+"d" %>').style.color='black'" onClick="document.getElementById('<%=i+"delete" %>').style.display='block';" type="button" value="删除商品"></a>
	 
</form>

<!--删除商品-->
<div  id="<%=i+"delete" %>" class="delet">
	<form action="deletegoods?goodsId=<%=good.getId()%>" method="post" id="form_2" >
	<h1 style="margin-left:90px">确定要删除该商品吗？</h1>
	<input id="log_on" onClick="document.getElementById('<%=i+"delete" %>').style.display='none'" style="width: 80px;height: 40px; border: 0px;margin-top:-10px;margin-left:90px;border-radius: 5px;background: #ff9232;font-size: 20px;" type="submit" value="确定"/>
	<input onClick="document.getElementById('<%=i+"delete" %>').style.display='none'" style="width: 80px;height: 40px; border: 0px;margin-top:10px;margin-left:140px;border-radius: 5px;background: #ff9232;font-size: 20px;" type="button" value="取消"/>
	</form>
</div>
<!--修改商品-->
<div  id="<%=i+"rivice" %>" class="revise">
	<form action="updategoods?goodsId=<%=good.getId()%>" method="post" id="form_2" >
   	<table width="498" border="1" cellspacing="0" cellpadding="0" style="border: 2px solid white;">
  <tbody>
    <tr height="60px;">
		<td><font style="font-size: 25px;margin-left: 10px;">商品类型：</font>
      <input style="width: 300px;height: 25px; margin-bottom:15px; " type="text" autofocus  id="type_2" name="kinds"/></td>
    </tr>
    <tr height="60px;">
		<td><font style="font-size: 25px;margin-left: 10px;">商品名称：</font>
      <input style="width: 300px;height: 25px; margin-bottom:15px; " type="text" autofocus  id="name_2" name="name"/></td>
    </tr>
    <tr height="60px;">
		<td><font style="font-size: 25px;margin-left: 10px;">商品价格：</font>
      <input style="width: 300px;height: 25px; margin-bottom:15px; " type="text" autofocus  id="price_2" name="price"/></td>
    </tr>
  </tbody>
</table>

    	<input onClick="document.getElementById('<%=i+"rivice" %>').style.display='none'" style="width: 100px;height: 50px; border: 0px;margin-top:30px;margin-left:80px;border-radius: 5px;background: #ff9232;color: white;font-size: 25px;" type="submit" value="确定"/>
		<input onClick="document.getElementById('<%=i+"rivice" %>').style.display='none'" style="width: 100px;height: 50px; border: 0px;margin-top:10px;margin-left:130px;border-radius: 5px;background: #ff9232;color: white;font-size: 25px;" type="submit" value="取消"/>
</form>
</div>

</div>
</div>

<%}} %>
</div>

</body>
</html>