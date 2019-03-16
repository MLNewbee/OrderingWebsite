<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'registe.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form  action="register" method="post">
    	<font id="user_name" color="black">用户名：&nbsp;&nbsp;&nbsp;</font><input type="text"  name="user_name"/><br/>
    	<font id="shop" color="black">店铺名称：</font><input type="text"  name="shop"/><br/>
    	<font id="user_password" color="black">密&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;&nbsp;</font><input type="password" name="user_password"/><br/>
   	    <font id="confirm_password" color="black">确认密码：</font><input type="password" name="confirm_password"/><br/>
   	    <font id="addr" color="black">地&nbsp;&nbsp;&nbsp;址：&nbsp;&nbsp;&nbsp;</font><input type="text" name="addr"/><br/>
   	    <font id="phone" color="black">联系方式：</font><input type="text" name="phone"/><br/>
    	<input id="logon" name="提交" type="submit" value="注册"  />
    </form>
        <form  action="login" method="post">
		用户名:<input type="text" name="user_name"><br>
		密码:<input type="text" name="user_password"><br> 
		<input type="submit" value="登录"> 
	</form>
  </body>
</html>
