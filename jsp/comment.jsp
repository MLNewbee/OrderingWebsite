<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>已评论界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <style type="text/css">
#div01{
	margin-left:100px;
	width:600px;
	height:350px;
	border:5px solid #666;
}
</style>
<script type="text/javascript">
function change(){
	//window.alert("Change Successfully");
	//window.history.back();
	window.location="/structs2/jsp/updatecomment.jsp";
}
function deletecomment(){
    window.alert("Delete Successfully");
     window.location="CommentManageActionDelete";
}
function goBack(){
	window.history.back();
}
</script>
  <body>
<h1>你的评价:</h1>
<div id="div01">
  <form id="form1" name="form1" method="post">
    <textarea name="text" id="text" cols="48" rows="9" style="font-size: 24px"><%=session.getAttribute("comment") %></textarea>
    <input type="button" style="margin-top:40px;margin-left:450px;width:100px;height:40px;font-size:20px;" onclick="change()"  value="修改评论"></input>
    <input type="button" style="margin-top:40px;margin-left:300px;width:100px;height:40px;font-size:20px;" onclick="deletecomment()"  value="删除评论"></input>
  <input type="button" style="margin-top:-40px;margin-left:150px;width:100px;height:40px;font-size:20px;" onclick="goBack()"  value="返回"> </input>
  </form>
   </div>
  </body>
</html>
