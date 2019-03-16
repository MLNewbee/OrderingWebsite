<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
    
    <title>My JSP 'comment.jsp' starting page</title>
    
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
  <img src="images/Pie.jpg"><br>
    
 Star:   <font color="red"><%=session.getAttribute("star") %></font><br>
 Comment:<font color="black"><%=session.getAttribute("comment") %></font><br>
 <a href="/structs2/page/usermanage.jsp">Home</a><br>
  <a href="/structs2/page/updatecomment.jsp">Update</a><br>
   <a href="CommentManageActionDelete">Delete</a><br>

  </body>
</html>
