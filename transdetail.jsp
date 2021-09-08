<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/basic.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

<title>后台管理系统  |PERFUME TOWN</title>
</head>
<body>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<div class=top>
<p align="left"><div class="small"></div><img src="images/name2.jpg" alt="图标" height="80" width="180" align="left"></p>
</div>
<hr>
<%@ page import="java.util.*" %>
<%@ page import="vo.GoodsInCartVO" %>
<%@ page import="vo.TransactionVO" %>

<%!int id; %>
<%!Map<Integer,GoodsInCartVO> goods; %>
<%!List<TransactionVO> trans; %>
 <% 

         String str_id=request.getParameter("name");
		id=Integer.parseInt(str_id);
    %>
<% Object transy = (List<TransactionVO>)session.getAttribute("transinfo");
			if(transy!=null){
			trans=(List<TransactionVO>)transy;
			for(TransactionVO transvo:trans) {
			if(transvo.getId()==id){
				goods=transvo.getGoods();
				%>
<div class="center">

    <div class="col-md-3" style="text-align:center">
    <table class="table table-bordered" style="text-align:center">
   <tr><td><h5>订单编号<%=transvo.getId() %></h5></td></tr>
    
    <tr><td><h3><%=transvo.getUsername() %></h3></td></tr>
    </table>
    <button type="button" class="btn btn-primary btn-lg" onclick="window.location.href='managerhome.jsp'">返回</button>
    </div>


<div class="col-xs-8 vertical-tab-content">				
				<table class="table table-hover">
	<caption  style="text-align:center">订单详细信息</caption>
	<thead><tr><td >商品编号</td><td >商品名称</td><td >数量</td><td >价格</td></tr></thead>
				<%
				for(GoodsInCartVO vo:goods.values()) {
				%>
				<tr><td ><%=vo.getId() %></td>
					<td ><%=vo.getName() %></td>
					<td ><%=vo.getNum() %></td>
					<td >￥<%=vo.getPrice() %></td></tr>
				
				<% 
					
				}
				}
			}}
			%></table>
			</div>
</body>
</html>