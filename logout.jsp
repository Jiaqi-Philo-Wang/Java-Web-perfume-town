<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/basic.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

<title>注销  |PERFUME TOWN</title>
</head>
<body>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<div class=top>
<p align="left"><div class="small"></div><img src="images/name2.jpg" alt="图标" height="80" width="180" align="left"></p>
</div>
<hr>
<%@page import="vo.UserVO" %>
<%
HttpSession sess=request.getSession();
UserVO vo=(UserVO) sess.getAttribute("LOGGED_IN_USER");
if(vo!=null){
String loguser=vo.getName();
%>
<p align="center"><font size=2px>
<%=loguser %>，您已经登录,确定要注销吗？</font><%} %>
</p>

<form action="logout.act" method="post">
		<table align="center" bordercolor="#000000" border="10">
			<tr>
				<td>请点我注销</td>	
				<td><input type="submit" value="确认注销"></td>
			</tr>
			</table>
</body>
</html>