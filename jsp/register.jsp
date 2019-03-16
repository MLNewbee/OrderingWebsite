<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"  src="/structs2/js/jquery-3.3.1.js"> </script>
<meta charset="utf-8">
<title>注册界面</title>
</head>
<style type="text/css">
	
	input::-webkit-input-placeholder { /* WebKit browsers */
  		color:black;
		font-weight: 8000;
		font-size: 14px;
	}
	input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
  		color:black;
		font-weight: 8000;
		font-size: 14px;
	}
	input::-moz-placeholder { /* Mozilla Firefox 19+ */
 		color:black;
		font-weight: 8000;
		font-size: 14px;
	}
	input:-ms-input-placeholder { /* Internet Explorer 10+ */
  		color:black;
		font-weight: 8000;
		font-size: 14px;
	}
	
	div{
		width:100%;
		height:629px;
	}
	#blank{
		position:relative;
		width:430px;
		height:560px;
		border:4px solid #8180CC;
		top:-470px;
		left:34%;
		background:black;
		z-index: 1;
		opacity: 0.2;
	}
	
	#form{
		position:relative;
		left:36%;
		top:10%;
		z-index: 2;
	}
	#user_name{
		width:250px;
		height:20px;
		position: relative;
		top:-2px;
		left:18px;
	}
	#shop{
		width:250px;
		height:20px;
		position: relative;
		top:-2px;
		left:18px;
	}
	#user_password{
		width:250px;
		height:20px;
		position: relative;
		top:-2px;
		left:18px;
	}
	#confirm_password{
		width:250px;
		height:20px;
		position: relative;
		top:-2px;
		left:18px;
	}
	#addr{
		width:250px;
		height:20px;
		position: relative;
		top:-2px;
		left:18px;
	}
	#phone{
		width:250px;
		height:20px;
		position: relative;
		top:-2px;
		left:18px;
	}
	
	#regist{
		font-size: 32px;
		color:white;
	}
	.size{
		font-size: 20px;
	}
	
	</style>
<script>
	
	function fun1(){
		var userName=document.getElementById("user_name");
        var reg=/^[a-zA-Z0-9\u4e00-\u9fa5_]{2,16}$/;
		if(userName.value==""){
			userName.setAttribute("placeholder","用户名不能为空");
		}
        else if(!reg.test(userName.value)){
			userName.value=null;
			userName.setAttribute("placeholder","用户名必须为2~16位");
        }
		else {
			return true;
		}
		return false;
	}
	function fun2(){
		var shopName=document.getElementById("shop");
        var reg=/^[a-zA-Z0-9\u4e00-\u9fa5_]{2,16}$/;
		if(shopName.value==""){
			shopName.setAttribute("placeholder","店铺名称不能为空");
		}
        else if(!reg.test(shopName.value)){
			shopName.value=null;
			shopName.setAttribute("placeholder","店铺名必须为2~16位");
		}
		else{
			return true;
		}
		return false;
	}
	function fun3(){
		var userPassword=document.getElementById("user_password");
        var reg=/^[a-zA-Z0-9_]{6,20}$/;
		if(userPassword.value==""){
			userPassword.setAttribute("placeholder","密码不能为空");
		}
        else if(!reg.test(userPassword.value)){
			userPassword.value=null;
			userPassword.setAttribute("placeholder","密码必须为6~20位且由字母和数字组成");
        }
		else{
			return true;
		}
		return false;
	}
	function fun4(){
		var userPassword=document.getElementById("user_password");
		var confirmPassword=document.getElementById("confirm_password");
		if(confirmPassword.value==""){
			
			confirmPassword.setAttribute("placeholder","确认密码不能为空");
		}
		else if(userPassword.value!=confirmPassword.value){
			confirmPassword.value=null;
			confirmPassword.setAttribute("placeholder","两次密码输入不一致");
		}
		else {
			return true;
		}
		return false;
	}
	function fun5(){
		var addr=document.getElementById("addr");
		if(addr.value==""){
			addr.setAttribute("placeholder","地址不能为空");
		}
		else{
			return true;
		}
		return false;		
	}
	function fun6(){
		var userPhone=document.getElementById("phone");
        var reg=/^[0-9_]{11}$/;
		if(userPhone.value==""){
			userPhone.setAttribute("placeholder","电话号码不能为空");
		}
        else if(!reg.test(userPhone.value)){
			userPhone.value=null;
			userPhone.setAttribute("placeholder","手机号必须为11位");
        }
		else{
			return true;
		}
		return false;
	}
	</script>

<body>
<div id="first" style="background-image: url( ../img/../img/background.jpg);background-size: 100% 100%;">
	<form id="form" action="demo_form.php" method="get">
    	<font class="size" color="white" >用户名&nbsp;&nbsp;&nbsp;：</font>
        <input id="user_name" onBlur="fun1()" type="text" placeholder="用户名2~16位" /><br/><br/><br/>
    	
   	  <font class="size" color="white">店铺名称：</font>
      <input placeholder="店铺名2~16位" onBlur="fun2()" type="text" id="shop"/><br/><br/><br/>
    	
   	  <font class="size" color="white">密&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;&nbsp;：</font>
      <input placeholder="密码6~20位" onBlur="fun3()" type="password" id="user_password"/><br/><br/><br/>
  	    
      <font class="size" color="white">确认密码：</font>
      <input placeholder="再次输入密码"  onBlur="fun4()" type="password" id="confirm_password"/><br/><br/><br/>
   	    
      <font class="size" color="white">地&nbsp;&nbsp;&nbsp;&nbsp;址&nbsp;&nbsp;&nbsp;：</font>
      <input type="text" placeholder="请输入地址" onBlur="fun5()" id="addr"/><br/><br/><br/>
   	    
      <font class="size" color="white">联系方式：</font>
      <input placeholder="请填写手机号" onBlur="fun6()" type="text" id="phone"/><br/><br/><br/>
   	    
   	  <a href="javaScript:;"><input id="regist" onclick="r()" style="width: 130px;height: 50px; border: 0px;background:  #276CD5;margin-top:20px;margin-left:25px;opacity:0.85" type="button" value="注  册" /></a>
   	  <a href="/structs2/jsp/login.jsp"><input style="width: 130px;height: 50px; border: 0px;background:  #E64698;opacity: 0.85; margin-top:20px;margin-left:70px;" id="logon" type="button" value="返  回"/></a>
   	  </form>
    <div id="blank"></div>
</div>
</body>
<script>
	function r(){
		var userName=document.getElementById("username");
		var userPassword=document.getElementById("password");

		$.ajax({
			url:"register_check",
			type:"post",
			data:{"user_name":$("#user_name").val(),
				  "password":$("#user_password").val(),
				  "confirm_password":$("#confirm_password").val(),
				  "phone":$("#phone").val(),
				  "shop":$("#shop").val(),
				  "addr":$("#addr").val()},
			dataType:"json",
			success:function(data){
										if(data.backinfo==1){//后台返回的用户名不存在的标志
										window.alert("用户名重复");
										}
										if(data.backinfo==3){
										window.location="/structs2/jsp/login.jsp";
										}
						
					}
			});
		}
</script>
</html>

