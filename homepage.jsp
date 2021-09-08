<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/basic.css" />
<link rel="stylesheet" type="text/css" href="css/basic2.css" />
<link rel="stylesheet" type="text/css" href="css/basic3.css" />
<link rel="stylesheet" type="text/css" href="css/search.css" />
<link rel="stylesheet" type="text/css" href="css/cun.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页| PERFUME TOWN</title>
<style>
.modal-backdrop {
  position:static;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: @zindex-modal-background;
  background-color: @modal-backdrop-bg;
  // Fade for backdrop
  &.fade { .opacity(0); }
  &.in { .opacity(@modal-backdrop-opacity); }
}
td {
border-style:none;
}
table {
border-style:none;
}
.center{
        width:100%;
		height:1600px;
		border:1px solid;
		line-height:2rem;
		font-size:1rem;
		float:left;
		opacity:0.85;
}
.tdd{
width:120px;
z-index:5;
}
a{
color:#615c5c;
}
a:link {color: #000000;text-decoration:none;}
a:visited {color: #000000;text-decoration: none;}
a:hover {color: #000000;text-decoration: none;}
a:active {color: #000000;text-decoration: none;}

input[type=checkbox] {
  -ms-transform: scale(1); /* IE */
  -moz-transform: scale(1); /* FireFox */
  -webkit-transform: scale(1); /* Safari and Chrome */
  -o-transform: scale(1); /* Opera */
  -ms-appearance: radio;
}
body {
 background-image: url(images/home.jpg);
 background-repeat: repeat;
   background-size:cover;
 font-family: "宋体";
 font-size: 12px;
 line-height: normal;
 font-weight: normal;
 color: #FFFFFF;
 background-attachment: fixed;
}
.center2{
        width:100%;
		height:300px;
		line-height:2rem;
		font-size:1rem;
		float:left;
		opacity:0.5;
}
</style>
<script>
function addone(id,num,page){
	alert("商品添加成功");
    var http=new XMLHttpRequest();
	http.open("get","addCart.do?id="+id+"&num="+num+"&page="+page);
	http.send();
}
function removeone(id,num,page){
	alert("商品移出成功");
    var http=new XMLHttpRequest();
	http.open("get","remove.do?id="+id+"&num="+num+"&page="+page);
	http.send();
}
function check_all(){
	var len=document.forms[3].elements.length;
	if(document.forms[3].checkall.checked==true){
		for(var i=0;i<len;i++){
			if(document.forms[3].elements[i].name=="sIds"){
				document.forms[3].elements[i].checked=true;
			}
		}
	}else{
	for(var i=0;i<len;i++){
			if(document.forms[3].elements[i].name=="sIds"){
				document.forms[3].elements[i].checked=false;
			}
		}
	
	}
}
function remove_one(){
	alert("商品移出成功");
	document.getElementById("f1").action="remove.do";
	document.forms[1].submit();

	
}
function add_one(){
	alert("商品添加成功");
	document.forms[1].submit();

	
}

</script>
</head>
<body>
<%@ page import="vo.UserVO" %>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
$(function (){
    $("[data-toggle='popover']").popover();
});
</script>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<div class="topcart">
<div class="perfume"><h1>P E R F U M E&nbsp;&nbsp;T O W N</h1></div></div><div class="topright" >
<table>
<tr>
<td class="tdd">
<%!UserVO user; %>
<%Object o=(UserVO)session.getAttribute("LOGGED_IN_USER");
if(o!=null){
	user=(UserVO)o;
%>
<font size="+1">
欢迎,
<%=user.getName() %>!</font>
<%
}else{
%><a href="login.jsp"><font size="+1">登录/注册</font></a><%} %></td>
<td class="tdd"><a href="goodschart.jsp"><font size="+1">我的购物袋</font></a></td>
<td class="tdd"><a href="logout.jsp"><font size="+1">注销</font></a></td>
</tr>
</table>
</div><div class="center2" >
</div><div class="center">
<div style="text-align:center">
<form action="page.act" method="post" >
	<font color=black size="+1"><span class="bar"><input placeholder="请输入商品名称" name="keyword"></span>
	<input type="hidden" name="page" value="1">
	<input class="bar" type="submit" value="SEARCH"><br/><br/>
	<input type="button" class="bar" data-toggle="modal" data-target="#myModal" value="快速购物">
	<input type="button" class="bar" data-toggle="modal" data-target="#myModal2" value="详细查询">
</font>
</form><br>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="z-index:9;">
		<div class="modal-content">
			<div class="modal-header">

				<h4 style="color:black" class="modal-title" id="myModalLabel">
					快速增加或移出商品
				</h4>
			</div>
			<div class="modal-body" >
				<form action="addCart.do" method="post" align="center" id="f1" style="color:black">
<span class="bar"><input placeholder="请输入商品编号" type="text" name="id"><br>
<input placeholder="请输入商品数量" type="text" name="num"><br></span>
<input type="hidden" name="page" value="1">
<input type="hidden" name="typ" value="1">
			</div>
			<div class="modal-footer" style="text-align:center">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<input type="submit" value="增加货物" onclick="add_one();" class="btn btn-primary">
<input type="button" value="减少货物" onclick="remove_one();" class="btn btn-primary"><br>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="z-index:9;">
		<div class="modal-content">
			<div class="modal-header">

				<h4 style="color:black" class="modal-title" id="myModalLabel">
					按照价格进行筛选
				</h4>
			</div>
			<div class="modal-body" >
				<form action="price.do" method="post" align="center" id="f2" style="color:black">
<span class="bar"><input placeholder="请输入查询内容（可为空）" type="text" name="keyword"><br><br></span>
<span class="bar2"><input placeholder="请输入最低价格" type="text" name="lowprice"><font size="+2">~</font><input placeholder="请输入最高价格" type="text" name="highprice"></span><br>
<input type="hidden" name="page" value="1">
<input type="hidden" name="typ" value="2">
			</div>
			<div class="modal-footer" style="text-align:center">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<input type="submit" value="查询" class="btn btn-primary">
<br>

				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<%@ page import="java.util.*" %>
<%@ page import="vo.GoodsInCartVO" %>
<%!List<GoodsInCartVO> arr; %>
<%!String keyword=""; %>
<%!int nowPage=1,totalPage=1; %>
<%!int exist; %>
<%
Object existt = request.getAttribute("exist");
if(existt != null) {
	Integer iExist = (Integer)request.getAttribute("exist");
	
	exist= iExist.intValue(); 
	if(exist==0){
		out.println("<script>alert('该商品不存在')</script>"); 
		
	}
}
%>
<%
Object ar = request.getAttribute("RECORDS");
if(ar != null) {
	arr = (List<GoodsInCartVO>)ar;
	keyword = (String)request.getAttribute("KEYWORD");
	Integer iPage = (Integer)request.getAttribute("PAGE");
	Integer iTotal = (Integer)request.getAttribute("TOTAL");
	
	nowPage = iPage.intValue(); 
	totalPage = iTotal.intValue();		
}
%>
<form action="addalot.do" method="get">
<table border="2" align="center">
<tr><td colspan="2" style="color:black"><input type="checkbox" name="checkall" onchange="check_all();" ><font size="+1">&nbsp;全选</font></td><tr>
<%! int index=0; %>
<%if(arr!=null){ 
index=0;%>
<%for(GoodsInCartVO vo:arr) { 
	index++;
if(index%2==1){
 out.println("<tr>");
}%>
<td>
<table>

<tr>
<td colspan="5" style="width:400px;height:400px;background:url(images/<%=vo.getImage()%>)no-repeat top left #000;background-size: 100% auto;">
</td>
</tr>
<tr>
<td>
<input type="checkbox" name="sIds" value=<%=vo.getId() %>></td>
<td class="tddh" align="center"> <a data-html ="true" data-trigger="hover" data-toggle="popover" title="<%=vo.getName() %>" data-content="商品编号：<%=vo.getId() %><br><br>价格：￥<%=vo.getPrice() %><br><br><%=vo.getDesc() %>" data-placement="auto left" >
<font size="+1"><%=vo.getName() %></font>
</a></td>
<td>
    <a href="javascript:void(0)" onclick="addone(<%=vo.getId() %>,1,1);" title="加入购物袋"><font size="+2">+</font></a> 
	</td>
	<td style="width:20px;height:20px;background:url(images/cart.png)no-repeat top left;background-size: 100% auto;">
	</td>
	<td>
	<a href="javascript:void(0)" onclick="removeone(<%=vo.getId() %>,1,1);" title="移出购物袋"><font size="+2">-</font></a> 
	</td>
</tr>	
</table>
</td>
<%if(index%2==0){
	 out.println("</tr>");
	}
	} }%>
<tr><td><input type="submit" value="一键添加" class="round_button button1 button2"></td></tr>
</table>
</form>
<p align="center">

</p>
<hr>
<p class="font2">
<%! int type; %>
<%! int lowprice; %>
<%! int highprice; %>
<%
Object low= request.getAttribute("LOWPRICE");
Object high= request.getAttribute("HIGHPRICE");
if(low != null) {
	Integer iLow= (Integer)request.getAttribute("LOWPRICE");
	Integer iHigh= (Integer)request.getAttribute("HIGHPRICE");
	lowprice=iLow.intValue();
	highprice=iHigh.intValue();}%>
<%
Object typp= request.getAttribute("type");
if(typp!= null) {
	Integer iType= (Integer)request.getAttribute("type");
	
	type=iType.intValue(); 
	if(type==1){ %>
当前第<%=nowPage%>页，共<%= totalPage%>页
<%if(nowPage != 1) {%>
<a href="page.act?keyword=<%=keyword %>&page=1">首页</a>
<a href="page.act?keyword=<%=keyword %>&page=<%=(nowPage-1)%>">上一页</a>
<%} %>
<%if(nowPage != totalPage) {%>
   <a href="page.act?keyword=<%=keyword %>&page=<%=(nowPage+1)%>">下一页</a>
   <a href="page.act?keyword=<%=keyword %>&page=<%=totalPage%>">末页</a>
<%} %><%}else if(type==2){ %>
当前第<%=nowPage%>页，共<%= totalPage%>页
<%if(nowPage != 1) {%>
<a href="price.do?keyword=<%=keyword %>&page=1&lowprice=<%=lowprice%>&highprice=<%=highprice%>">首页</a>
<a href="price.do?keyword=<%=keyword %>&page=<%=(nowPage-1)%>&lowprice=<%=lowprice%>&highprice=<%=highprice%>">上一页</a>
<%} %>
<%if(nowPage != totalPage) {%>
   <a href="price.do?keyword=<%=keyword %>&page=<%=(nowPage+1)%>&lowprice=<%=lowprice%>&highprice=<%=highprice%>">下一页</a>
   <a href="price.do?keyword=<%=keyword %>&page=<%=totalPage%>&lowprice=<%=lowprice%>&highprice=<%=highprice%>">末页</a>
<%} %>
<%} %><%}else{ %>
当前第<%=nowPage%>页，共<%= totalPage%>页
<%if(nowPage != 1) {%>
<a href="page.act?keyword=<%=keyword %>&page=1">首页</a>
<a href="page.act?keyword=<%=keyword %>&page=<%=(nowPage-1)%>">上一页</a>
<%} %>
<%if(nowPage != totalPage) {%>
   <a href="page.act?keyword=<%=keyword %>&page=<%=(nowPage+1)%>">下一页</a>
   <a href="page.act?keyword=<%=keyword %>&page=<%=totalPage%>">末页</a>
<%} %>

<%} %>
</p>
<br>

<a href="javascript:window.scrollTo(0,0);" ><font size="+3" color="white"><input type="button" value="↑" style="width:65px; height: 65px; border-radius:50%;border: none;background-color:black;position:fixed;bottom:20px;right:70px;outline:none;"></font></a>
</div>
</div>
<div class=bottom>
<div style="height:15px"></div>
<div class="class1 haha" style="text-align:left;" >
		<div id="a2"> </div>
		<div id="a3"><font size=1rem color="grey"><b>服务</b><br/><br/><br/><a href="">联系我们</a><br/><br/><br/><a href="">常见问题</a><br/><br/><br/><a href="">通用条款和条件</a><br/><br/><br/><a href="">售后服务</a><br/><br/><br/></font><br/></div>
		<div id="a3"><font size=1rem color="grey"><b>购物帮助</b><br/><br/><br/><a href="">免费标准配送</a><br/><br/><br/><a href="">免费礼品包装</a><br/><br/><br/><a href="">保养与维修</a><br/><br/><br/><a href="">支付相关</a></font><br/><br/></div>
		<div id="a3"><font size=1rem color="grey"><b>关于我们</b><br/><br/><br/><a href="">企业社会责任</a><br/><br/><br/><a href="">关于Perfume Town</a><br/><br/><br/><a href="">企业信息</a><br/><br/><br/><a href="">道德规范</a><br/><br/><br/><a href="">细则及条款</a><br/></font></div>
		<div id="a4"><font size=1rem color="grey"><br/><br/><br/><img src="images/weixin.jpg" alt= "" width="20%"><a class="thumb" ><b>联系我们</b><span><img width="100px" height="100px" src="images/connect.jpg" no-repeat top left>
		</span></a></font></div>
		<div id="a5"><p align="center"><font size=1rem color="grey"><b>购物帮助</b></font><br><br/><br><font size=1rem color="white">通过订阅，即代表您接受PERFUME TOWN的隐私<br><br>政策条款</font>
		<br><br><br/><br>
		<input type="text" placeholder="<%=user.getEmail()%>" class="email"><input type="button" value=">" class="email2">
		
		</p>
		
		</div>
	</div>
	
	<div class="class2" style=" text-align:left;">
		<div id="a1"><font size=1rem; color=grey><b>&emsp;&emsp;copyright © 2020 by 王佳琦 寸洁蓉</b></font></div>
		
	</div>
</body>
</html>