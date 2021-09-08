<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript">
function manage(no){
	alert("处理完成");
	
var http=new XMLHttpRequest();
http.onreadystatechange=function(){
if(http.readyState==4&&http.status==200){
document.getElementById("state"+no).innerHTML=http.responseText;
document.getElementById("but"+no).innerHTML="";
}
}
http.open("get","state.do?id="+no);
http.send();
}

setInterval("document.getElementById('datetime').innerHTML=new Date().toLocaleString();", 1000);

</script>
<link rel="stylesheet" type="text/css" href="css/basic.css" />
<link rel="stylesheet" type="text/css" href="css/manager.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<title>后台管理系统  |PERFUME TOWN</title>
</head>
<body>
<%@ page import="java.util.*" %>
<%@ page import="vo.GoodsInCartVO" %>
<%@ page import="vo.UserVO" %>
<%@ page import="vo.TransactionVO" %>
<%!List<GoodsInCartVO> arr; %>
<%!List<UserVO> arruser; %>
<%!List<TransactionVO> trans; %>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<div class=top>
<p align="left"><div class="small"></div><img src="images/name2.jpg" alt="图标" height="80" width="180" align="left"></p>
欢迎，用户管理员！&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.act">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;<span id="datetime"></span>
</div>
<hr>
<div class="center">

<div style="height: 100px;">
    <div class="col-md-2">
        <ul class="nav nav-pills nav-stacked "  id="vtab">
            <li class="active"><a data-toggle="pill" href="#transinfo">订单管理</a></li>
    <li><a data-toggle="tab" href="#userinfo">用户管理</a></li>
   <li class="dropdown">
		<a href="#" id="myTabDrop1" class="dropdown-toggle" 
		   data-toggle="dropdown">商品管理
			<b class="caret"></b>
		</a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
			<li><a href="#goodsinfo" tabindex="-1" data-toggle="tab">商品详情</a></li>
			<li><a href="#manager" tabindex="-1" data-toggle="tab">修改商品</a></li>
		</ul>
	</li>
  </ul>

    </div>


<div class="tab-content vertical-tab-content col-xs-10 info">
	
	
	<div id="transinfo" class="tab-pane fade in active">
	<table class="table table-hover">
	<caption  style="text-align:center">订单信息</caption>
	<% Object transy = (List<TransactionVO>)session.getAttribute("transinfo");
			if(transy!=null){
			trans=(List<TransactionVO>)transy;
			%>
	<thead><tr><td >订单编号</td><td >用户名</td><td >状态</td><td >总价</td><td >查看详情</td><td >处理</td></tr></thead>
	<%for(TransactionVO transvo:trans) {
					%><tr><td ><%=transvo.getId() %></td>
					<td ><%=transvo.getUsername() %></td>
					<td >
					<span id="state<%=transvo.getId() %>"><%if(transvo.getState()==0){
						%>未处理<% 
					}else if(transvo.getState()==1){%>
						已处理
					<% }%></span>
					
					</td>
					<td >￥<%=transvo.getSummoney() %></td>
					<td ><a href="transdetail.jsp?name=<%=transvo.getId()%>">查看订单详情</a></td>
					<td ><span id="but<%=transvo.getId() %>"><%if(transvo.getState()==0){
						%><button type="button" class="btn btn-primary btn-sm" onclick="manage(<%=transvo.getId() %>);">处理</button><% 
					}else if(transvo.getState()==1){%>
						
					<% }%></span></td>
					</tr>
					<%
				}%>
	<%} %>
	</table>
	</div>
	
	<div id="userinfo" class="tab-pane fade">
	<table class="table table-hover">
	<caption  style="text-align:center">用户基本信息</caption>
	<% Object users = (List<UserVO>)session.getAttribute("users");
			if(users!=null){
			arruser=(List<UserVO>)users;
			%>
	<thead><tr><td >用户名</td><td >密码</td><td >邮件</td><td >年龄</td></tr></thead>
	<%for(UserVO uservo:arruser) {
					%><tr><td ><%=uservo.getName() %></td>
					<td ><%=uservo.getPwd() %></td>
					<td ><%=uservo.getEmail() %></td>
					<td ><%=uservo.getAge() %></td></tr>
					<%
				}%>
	<%} %>
	</table>
	</div>
	
	<div id="goodsinfo" class="tab-pane fade">
	<table class="table table-hover">
	<caption  style="text-align:center">商品基本信息</caption>
	<% Object a = (List<GoodsInCartVO>)session.getAttribute("goodsinfo");
			if(a!=null){
			arr=(List<GoodsInCartVO>)a;
			%>
	<thead><tr><td >商品编号</td><td >商品名称</td><td >品牌</td><td >价格</td></tr></thead>
	<%for(GoodsInCartVO goodsvo:arr) {
					%><tr><td ><%=goodsvo.getId() %></td>
					<td ><%=goodsvo.getName() %></td>
					<td ><%=goodsvo.getBrand() %></td>
					<td >￥<%=goodsvo.getPrice() %></td></tr>
					<%
				}%>
	<%} %>
	</table>
	</div>
	
	<div id="manager" class="tab-pane fade">
	<a href="function.jsp">进入修改主界面</a>
	</div>
</div>	
</div>
</body>
</html>