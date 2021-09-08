<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*"%>
    <%@ page import ="manager.ManagerDAO"%>
    <%@ page import ="manager.ManaVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

#a0{
				
				width: 100%;
				height: 50px;
			}
			.class2{
			    width:100%;
				height:50px;
				
			}
			#a01{
				
				width: 100%;
				height: 100px;
			}
			.class21{
			    width:100%;
				height:100px;
				
			}
			.class0{
			    width:100%;
				height:1300px;
				background:#f6f5ec;
				
			}
			.button1 {
   			
    		color: black;
    		border: 8px solid #228fbd; 
    		border-radius: 20px;
			}
</style>
</head>

<body>
<div class="class0" align="center" >
<br>
<div class="class2" style="text-align:center;" >
	<div id="a0">————————<font size=6rem; color=grey><b>查询结果</b></font>————————</div><br><br><br>
</div>
<br><hr />
<%!List<ManaVO>arr;%>
<% String id;%>
<%id=(String)request.getAttribute("id"); %>

<table id="goods"  style="width:50%;border:2px white solid">

	<tbody>
		<tr><th>id</th><th>name</th><th>desc</th><th>price</th><th>image</th><th>brand</th></tr>
	
	

<%Object goods=request.getAttribute("GOODS"); 
if(goods!=null){

arr=(List<ManaVO>)goods;

%>

<%for (ManaVO vo:arr){ %>
	<tr>
		<td><%=vo.getId() %></td>
		<td><%=vo.getName() %></td>
		<td><%=vo.getDesc() %></td>
		<td><%=vo.getPrice() %></td>
		<td><%=vo.getImage() %></td>
		<td><%=vo.getBrand() %></td>
	</tr>
</table>
<%} }%>

<br><a href="inquiry.html"><button class="button button1"><font size=5rem; color=black>返回</font></b></button></a><br><br><br><br>
<div><img src='picture/last.jpg' alt= "" width="100%"></div><hr /><br>
</div>
</body>
</html>