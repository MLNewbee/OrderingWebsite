<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.eight.beans.User" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理用户</title>
    
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
	
	#first{
		position: absolute;
		top:0px;
		width: 96%;
		height:50px;
	}
	#theme{
		position: relative;
		left:30px;
		top:-8px;
	}
	#containerl{
		position: absolute;
		top: 70px;
		width: 85%;
		left:85px;
		background-color: white;
	}
	</style>

  </head>
  
  <body>
<div id="first">
	<h2 id="theme">用户管理</h2>
	</div>
<div id="containerl">
<table width="100%"  border="0" align="center">
  <tr align="center" bgcolor="#EFEFEF" >
    <th>用户名</th>
    <th>用户密码</th>
    <th>用户店铺名</th>
    <th>用户地址</th>
    <th>联系方式</th>
    <th>处理</th>
  </tr>
  <%  
    List<User> user_list = (List<User>)session.getAttribute("all_users");
  %>
  <% 
   int length = user_list.size();
   for(int i=0;i<length;i++){
   User user = user_list.get(i);
  %>
  <tr align="center" bgcolor="#EFEFEF" >
    <th><%=user_list.get(i).getUsername()%></th>
    <th><%=user_list.get(i).getPassword()%></th>
    <th><%=user_list.get(i).getCompany()%></th>
    <th><%=user_list.get(i).getAddress()%></th>
    <th><%=user_list.get(i).getPhonenum()%></th>
    <th>
    <a href="BanUser?userId=<%=user.getId()%>">禁用</a>
    </th>
  </tr>

  <%
  }
   %>
</table>
</div>
</body>
</html>
