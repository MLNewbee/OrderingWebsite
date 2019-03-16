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
<title>登录界面</title>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript"> 
$(document).ready(function(){
$("#denglu").click(function(){
    $("#getin").slideToggle("slow");
	$("#logon").slideToggle("slow");
  });
});
</script>

<script>
	
	function fun(){
		var userName=document.getElementById("username");
		var userPassword=document.getElementById("userpassword");
		
		if(userName.value==""){
			userName.setAttribute("placeholder","用户名不能为空");
		}
		else if(userPassword.value==""){
			userPassword.setAttribute("placeholder","密码不能为空");
		}
		
	}
</script>
<script>
	function t(){
		var userName=document.getElementById("username");
		var userPassword=document.getElementById("userpassword");

		$.ajax({
			url:"login_check",
			type:"post",
			data:{"user_name":$("#username").val(),
				  "password":$("#userpassword").val()},
			dataType:"json",
			success:function(data){
								if(userName.value==""){
									//window.alert("用户名不能为空");
								}
								else if(userPassword.value==""){
									//window.alert("密码不能为空");
									}
									else{
										if(data.backinfo==1){//后台返回的用户名不存在的标志
										window.alert("用户名不存在");
										}
										if(data.backinfo==2){//后台返回的用户名输入错误的标志
										window.alert("密码不正确");
										}
										if(data.backinfo==3){
										window.alert("没激活");
										}
										if(data.backinfo==4 && data.isManager==0){//后台返回的用户名输入错误的标志
										window.location="/structs2/html/Frame.html";
										}
   										if(data.backinfo==4 && data.isManager==1){
										window.location="/structs2/manegerhtml/frame.html";
										}
									}
						
					}
			});
		}
</script>
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
		width=100%;
	}
	#back_image{
	position: absolute;
	width: 100%;
	height: 100%;
	top: -7px;
	left: 00px;
	}
	#logon{
		position: absolute;
		width:400px;
		border:2px solid white;
		background:hsla(0,0%,16%,1.00);
		opacity: 0.3;
		margin-left: 950px;
		margin-top: 140px;
		height:400px;
		z-index: 1;
	}
		#getin{
		position: absolute;
		width: 340px;
		height:400px;
		margin-left: 990px;
		margin-top: 200px;
		opacity: 1;
		z-index: 3;
	}
	
	#advertisement{
		position:absolute;
		left:30%;
		top:0;
	}
	
	

	#username{
		width:200px;
		height:30px;
		position: relative;
		
		
	}
	#userpassword{
		width:200px;
		height:30px;
		position: relative;
		
		
	}
	
	#log_on{
		font-size: 20px;
		color:white;
	}
	#regist{
		font-size: 20px;
		color:black;
	}
	#tableh2{
		position: absolute;
		top:200px;
		left: 80px;
	}
	
	
	</style>
<body>
<div id="back_image" style="background-image: url( ../img/loginbackground.png);background-size: 100% 100%">
	<a id="denglu" style="position: absolute;left: 90%;top: 2%;font-size: 40px;color: white;font-family: '华文行楷';cursor: pointer;text-decoration: none;">登录</a>
 	
 	
	 <img style="position: absolute; left: 25px;top: 25px" src="../img/whiteorder.png"  alt="logo" />
 
 	<img id="tableh2" src="../img/advertisement.png"  />

		<form id="getin" action="demo_form.php" method="get" style="display: none">
			<font color="white" style="font-size: 15px">用户名：</font><br/>
			<input onBlur="fun()" style="width: 70%;height: 10%; border-radius: 20px;padding-left: 3px;margin-left: 40px;opacity: 0.6;" type="text" placeholder="请输入用户名" id="username" name="username"/><br/>

			<font color="white" style="font-size: 15px">密&nbsp;&nbsp;&nbsp;&nbsp;码：</font><br/>
			<input onBlur="fun()" style="width: 70%;height: 10%; border-radius: 20px;padding-left: 3px;margin-left: 40px;opacity: 0.6;" type="password" placeholder="请输入密码" id="userpassword" name="userpassword" />
			
			<a href="javaScript:;"><input id="log_on"  onclick="t()" style="width: 70%;height: 10%; border: 1px;background:#1161EE; margin-top:40px; margin-left:40px;border-radius: 20px;" type="button" value="登  录"/></a>
			
			<a href="/structs2/jsp/register.jsp"><input id="regist" style="width: 70%;height: 10%; border: 0px;background:white;margin-top:28px;margin-left:40px;border-radius: 20px;" type="button" value="注  册"/></a>
		</form>
 	<div id="logon" style="display: none">
	</div>	
</div>
</body>


</html>

