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
<title>首页</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
<style type="text/css">
	body{
		background-color: #E3E3E3;
	}	
	#theme{
		position: fixed;
		left:30px;
		top:15px;
		z-index: 100;
	}
	#cont0text{
		position:fixed;
		width:140px;
		height:auto;
		left: 840px;
		top:15px;
		z-index: 100;
	}
	#toph{
		position: fixed;
		margin: auto;
		top: 0px;
		left: 8px;
		right: 15px;
		width: auto;
		height: 50px;
		background: white;
		z-index: 99;
	}
	
	#message{
		position: absolute;
		margin:auto;
		top: 75px;
		right: 15px;
		left: 830px;
		width: auto;
		height: 500px;
		border: 1px solid #000000;
	}
	#shops{
		position: absolute;
		margin: auto;
		top: 595px;
		left: 8px;
		right: 15px;
		width: auto;
		height: auto;
		border: 1px solid #000000;
		float: left;
	}
	#ashop{
		position: relative;
		margin: auto;
		height: 300px;
		width: 48%;
		float: left;
		margin-left:13px;
		margin-top:13px;
		border:2px solid black;
	}
	#shopphoto{
		margin: auto;
		position: absolute;
		width: 60%;
		height: 100%;
		
	}
	#shopform{
	margin: auto;
	position: absolute;
	margin-left: 60%;
	width: 39%;
	height: 298px;
	left:1%;
	border: 1px solid black;
	
	}
	#picture {
		position: absolute;
		margin:auto;
		top: 75px;
		left: 8px;
		height: 500px;
		width: 800px;
		overflow: hidden;
		white-space: nowrap;
	}
	
</style>
<script type="text/javascript">
	//var shopswidth=document.getElementById("shops").offsetWidth;//商品展览表的宽
	
</script>
<body>
<div id="toph">
<h2 id="theme">首页</h2>
	<form id="cont0text" style="border: 0px;">
		<input type="text" placeholder="请输入想要查询的内容" style="width: 200px;height: 24px;position: absolute;" />
		<input type="button" style="width: 70px;height: 28px;position: absolute;left: 215px;top:0px;" value="查询"/>
	</form>
</div>
<div id="picture" class="banner">

	<ul >
		<li class="slider-item" >
		<a href="#" ><img src="../img/first.jpg" alt="收纳箱" width="800" height="500" ><span class="slider-title" ><em>收纳箱</em></span></a>
		</li>
		<li class="slider-item" >
		<a href="#" >
		<img src="../img/second.jpg" alt="相框" width="800" height="500" ><span class="slider-title" ><em>相框</em></span></a>
		</li>
		<li class="slider-item" >
		<a href="#" >
		<img src="../img/third.jpg" alt="电脑" width="800" height="500" ><span class="slider-title" ><em>电脑</em></span></a>
		</li>
		<li class="slider-item" >
		<a href="#" >
		<img src="../img/forth.jpg" alt="至尊钻石" width="800" height="500" ><span class="slider-title" ><em>至尊钻石</em></span></a>
		</li>
		<li class="slider-item" >
		<a href="#" >
		<img src="../img/fifth.jpg" alt="手表" width="800" height="500" ><span class="slider-title" ><em>手表</em></span></a>
		</li>
	</ul>
	<div class="progress" ></div>
	<a href="javascript:void(0);" class="unslider-arrow04 prev"><img class="arrow" id="al" src="../img/arrowl.png" alt="prev" width="20" height="35" ></a>
	<a href="javascript:void(0);" class="unslider-arrow04 next"><img class="arrow" id="ar" src="../img/arrowr.png" alt="next" width="20" height="37" ></a>

</div>
<div id="message">
	
</div>

<div id="shops">
<%List<Goods> goods=(List<Goods>) session.getAttribute("all_goods"); 
  GoodsDao goodsDao=new GoodsDao();
  for(int i=0;i<goods.size();i++){%>
	<div id="ashop"  onclick="window.location.href='getGoodsId?goodsId=<%=goods.get(i).getId()%>&supplier=<%=goods.get(i).getSupplier()%>'">
		<div id="shopphoto">
		<%if(goods.get(i).getImg()!=null){ %>
	    <img src="<%=basePath+goods.get(i).getImg()%>" width="100%" height="100%" alt=""/> </div>
	    <%} %>
		<form id="shopform">
		<table width="100%" height="100px" bordercolor="#B7B7B7"  border="0px" cellspacing="0" cellpadding="1">
  <tbody>
   <tr>
   	  <td><h1><%=goods.get(i).getName()%></h1></td>
   </tr>
  </tbody>
</table>
     <table width="100%" height="100px" bordercolor="#B7B7B7" border="0px" cellspacing="0" cellpadding="1" style="margin-top: 50px;">
  <tbody>
   <tr>
      <td width="60%" style="color: red;"><h1><strong>￥<%=goods.get(i).getPrice()%></strong></h1></td>
      <td><p><%=goods.get(i).getNumber()%>人付款</p></td>
      </tr>
  </tbody>
</table>
     <table width="100%" height="50px" bordercolor="#B7B7B7" border="0px" cellspacing="0" cellpadding="1" style="margin-top: 10px;">
  <tbody>
  <tr>
      <td width="55%;"><p>&nbsp;<%=goodsDao.getSupplier(goods.get(i).getSupplier()).getCompany()%></p></td>
		<td><a href="getSupplier?supplier=<%=goods.get(i).getSupplier()%>"><input id="<%=i %>" type="button" value="进店>" onMouseOver="document.getElementById('<%=i %>').style.color='blue'" onMouseOut="document.getElementById('<%=i %>').style.color='black'" style="font-size: 18px;width: 80px;color: black;border: 0px;background-color:#E3E3E3;position:relative;z-index:10;"></a>
		</td>
	</tr> 
  </tbody>
</table>
</form>
	</div>
	<% }%>
</div>

</body>
<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/unslider.min.js"></script>
<script>
$(document).ready(function(e) {
	var progress = $(".progress"),li_width = $("#picture li").length;
    var unslider04 = $('#picture').unslider({
		dots: true,
		complete:function(index){//自己添加的，官方没有
			progress.animate({"width":(100/li_width)*(index+1)+"%"});
		}
	}),

	data04 = unslider04.data('unslider');
	$('.unslider-arrow04').click(function() {
        var fn = this.className.split(' ')[1];
        data04[fn]();
    });
});
</script>
</html>