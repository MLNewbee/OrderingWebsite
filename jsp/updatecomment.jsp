<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatecomment.jsp' starting page</title>
    
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
   <body>
     <h1>更改评论.....</h1>
<div id="div01">
  <form id="form1" name="form1" method="post" action="CommentManageActionUpdate">
    <textarea name="aComment.comment" id="text" cols="48" rows="7" placeholder="请输入你的评论" style="font-size: 24px"></textarea>
    <br/><br/>
    <label style="margin-left:50px;margin-top:40px;">Quality</label> 
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <label style="margin-left:150px;margin-top:40px;">Trans</label>
     <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <br/><br/><br/>
    <label style="margin-left:50px;margin-top:40px;">Attitude</label>
     <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <label style="margin-left:150px;margin-top:40px;">Desc</label>
     <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" />
    <input name="" type="radio" value="" /><br/>
    <input type="submit" style="margin-top:40px;margin-left:450px;width:100px;height:40px;font-size:20px;" onclick="goBack()"  value="提交"></input>
  </form>
  <input type="button" style="margin-top:50px;margin-left:200px;width:100px;height:40px;font-size:20px;" onclick="Control()"  value="返回"> </input>
</div>
  </body>
</html>
