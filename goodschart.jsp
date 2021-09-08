<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/basic.css" />
<link rel="stylesheet" type="text/css" href="css/basic2.css" />
<link rel="stylesheet" type="text/css" href="css/basic3.css" />
<link rel="stylesheet" type="text/css" href="css/csshome.css" />
<link rel="stylesheet" type="text/css" href="css/cun.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物袋 |PERFUME TOWN</title>
<style>
body {
 background-image: url(images/background.jpg);
 background-repeat: no-repeat;
 font-family: "宋体";
 font-size: 12px;
 line-height: normal;
 font-weight: normal;
 color: #FFFFFF;
 background-attachment: fixed;
}

.center{
        width:100%;
		height:1000px;
		border:1px solid;
		line-height:2rem;
		font-size:1rem;
		float:left;
		background-color:white;
		text-align:center;
}
.center2{
        width:100%;
		height:300px;
		border:1px solid;
		line-height:2rem;
		font-size:1rem;
		float:left;
		text-align:center;
		line-height:350px;
}
table {
color:black;
}
td{
border-bottom: solid #9a8a8a6e;
}
.lis td{
border-bottom: none;
}
.liss{
border-bottom: solid #9a8a8a6e;
}
</style>
<script type="text/javascript">
function not_completed(){
	
alert("订单提交完毕，等待处理！");
var http=new XMLHttpRequest();
http.open("get","transaction.do");
http.send();

}
function check_all(){
	var len=document.forms[0].elements.length;
	if(document.forms[0].checkall.checked==true){
		for(var i=0;i<len;i++){
			if(document.forms[0].elements[i].name=="shop"){
				document.forms[0].elements[i].checked=true;
			}
		}
	}else{
	for(var i=0;i<len;i++){
			if(document.forms[0].elements[i].name=="shop"){
				document.forms[0].elements[i].checked=false;
			}
		}
	
	}
}
</script>
</head>
<body>
<%@ page import="java.util.*" %>
<%@ page import="vo.GoodsInCartVO" %>
<%@ page import="vo.UserVO" %>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<div class="topcart">
<div class="perfume"><h1>P E R F U M E&nbsp;&nbsp;T O W N</h1></div>
</div>
<div class="center2">
<%!UserVO user; %>
<%Object o=(UserVO)session.getAttribute("LOGGED_IN_USER");
if(o!=null){
	user=(UserVO)o;
%>
<font size="+1">
<h1>
<%=user.getName() %>的购物车</h1></font>
<%
}%>
</div>
<div class="littleflag">
<img class="iconflag" alt="icon" src="images/flag.png">
</div>
<div class="center">
<div class="centerhelp"></div>
<div class="centerin">
<div class="centerinleft">
<form action="" method="post">
<%!int count=0; %>
<%!double counte=0; %>
<%!int sum=0; %>
<%!int endgood; %>
<%!int endPage; %>
	<%!Map<Integer,GoodsInCartVO> goods; %>
	<%!List<GoodsInCartVO> lis=new ArrayList<GoodsInCartVO>(); %>
	<%!GoodsInCartVO vo; %>
		<table  align="center">
		<font color="black">
		<%!int nowPage=1; %>
		<%Object now =request.getAttribute("nowPage"); %>
		<% if(now!=null){
		Integer iPage=(Integer)now;
		
		nowPage = iPage.intValue();
		}
		%>
		<%Object ooo = (Map<Integer, GoodsInCartVO>) session.getAttribute("GOODS_IN_CART");
		if(ooo!=null){
			%><tr><td colspan="5"><input type="checkbox" name="checkall" onchange="check_all();" >&nbsp;&nbsp;全选</td><tr><% 
			goods=(Map<Integer, GoodsInCartVO>) ooo;
			for(GoodsInCartVO vo:goods.values()) {
				lis.add(vo);
				counte+=1;
				count+=vo.getNum();
				sum+=vo.getNum()*vo.getPrice();
				
			}
			endgood=3*nowPage;
			if(endgood<lis.size()){
				endPage=endgood;
			}else{
				endPage=lis.size();
				
			}
			for(int i=3*nowPage-3;i<endPage;i++){	
				vo=lis.get(i);
				%>
		<tr>
			<td rowspan="2"><input type="checkbox" name="shop" value="<%=vo.getId() %>"></td> 
			<td rowspan="2" style="width:150px;height:150px;background:url(images/<%=vo.getImage()%>)no-repeat top left;background-size: 100% auto;"></td>
			<td><%=vo.getName() %></td>
			<td>数量：<%=vo.getNum() %></td>
			<td>￥<%=vo.getNum()*vo.getPrice() %></td>
				</tr><tr>
		<td>

		</td>
				<td>
    <a href="addCart.do?id=<%=vo.getId() %>&num=1&page=2" title="加入购物袋"><font size="+2">+</font></a> 
	</td>
	
	<td>
	<a href="remove.do?id=<%=vo.getId() %>&num=1&page=2" title="移出购物袋"><font size="+2">-</font></a> 
	</td></tr><br/>
	<%!int totalPage; %>
	<%totalPage=(int)Math.ceil(counte/3); %>
				<%
			}%><tr><td><a href="clearCart.do?why=1">清空购物车</a></td><td ></td><td>
			当前第<%=nowPage%>页，共<%= totalPage%>页
			<%if(nowPage== 1&nowPage!=totalPage) {%>
			<td></td>
			<td><a href="cartpage.do?&page=<%=(nowPage+1)%>">下一页</a></td>
			<%}else if(nowPage== 1&nowPage==totalPage){
				%><td></td><td></td><% 
			}else if(nowPage == totalPage) {%>
			<td><a href="cartpage.do?&page=<%=(nowPage-1)%>">上一页</a></td>
			<td></td>
			<%}else if(nowPage != totalPage){%>
			<td><a href="cartpage.do?&page=<%=(nowPage-1)%>">上一页</a></td>
			   <td><a href="cartpage.do?&page=<%=(nowPage+1)%>">下一页</a></td>
			<%} %>
			</p></td>
		</tr>
		
		<%counte=0;lis.clear();
		
		
		}else{
		%><font color="grey"><h2>您的购物车为空，快去选购吧！</font></h2>
		<div align="center"><input class="round_button button1 button2" type="button" value="返回继续购物" onclick="location='homepage.jsp'">
		</div>
		<%} %>
	
		</font></table></form>


</div>
<div class="centerinright" style="text-align:center;vertical-align:middle">
<div style="height:50px"></div>
<table bgcolor="white" style="margin:auto;border-collapse: collapse" class="lis">
<tr style="border-bottom:solid 1.5px #d3d0d0">
<td><span class="font1">订单小计</span></td>
<td style="width:100px"></td>
<td><span class="font2">共计<%=count %>件商品</span></td>
<%count=0; %>
</tr>
<tr><td><span class="font2">商品总计</span></td>
<td style="width:100px"></td>
<td><span class="font2">￥<%=sum%></span></td>
</tr>
<tr><td><span class="font2">运费</span></td>
<td style="width:100px"></td>
<td><span class="font1">免费</span></td>
</tr>
<tr ><td><span class="font2">总计</span></td>
<td ></td>
<td><span class="font3">￥<%=sum%></span></td>
</tr>
<%sum=0; %>
<tr><td colspan="3" style="border-top:solid 1.5px #d3d0d0;height:50px"><span class="font1">说明</span></td>
</tr>
<tr><td colspan="3" style="border-bottom:solid 1.5px #d3d0d0;height:100px"><span class="font1"><i>在线支付订单提交之后15分钟内未付款，订单将被系统自动取消，请您尽快完成支付以确保商品能及时送达，有货商品和门店配货商品是分开寄出。</i></span></td>
</tr>
<tr style="height:20px"></tr>
<tr><td colspan="3" style="text-align:center">
<input style="margin:auto" type="button" value="立即结算" onclick="not_completed();" class="round_button button1 button2">
</td></tr>
<tr style="height:20px"></tr>
<tr><td colspan="3" style="text-align:center">
<input style="margin:auto" type="button" value="继续购物"  class="round_button2 button3"  onclick="location='homepage.jsp'">
</td></tr>
<tr style="height:50px"></tr>
</table>

</div>
</div>
</div>
<div class=bottom>
<div style="height:15px"></div>
<div class="class1 haha" style="text-align:left;" >
		<div id="a2"> </div>
		<div id="a3"><font size=1rem color="grey"><b>服务</b><br/><br/><a href="">联系我们</a><br/><br/><a href="">常见问题</a><br/><br/><a href="">通用条款和条件</a><br/><br/><a href="">售后服务</a><br/><br/></font><br/></div>
		<div id="a3"><font size=1rem color="grey"><b>购物帮助</b><br/><br/><a href="">免费标准配送</a><br/><br/><a href="">免费礼品包装</a><br/><br/><a href="">保养与维修</a><br/><br/><a href="">支付相关</a></font><br/></div>
		<div id="a3"><font size=1rem color="grey"><b>关于我们</b><br/><br/><a href="">企业社会责任</a><br/><br/><a href="">关于Perfume Town</a><br/><br/><a href="">企业信息</a><br/><br/><a href="">道德规范</a><br/><br/><a href="">细则及条款</a><br/></font></div>
		<div id="a4"><font size=1rem color="grey"><br/><br/><img src="images/weixin.jpg" alt= "" width="20%"><a class="thumb" >联系我们<span><img width="100px" height="100px" src="images/connect.jpg" no-repeat top left>
		</span></a></font></div>
		<div id="a5"><p align="center"><font size=1rem color="grey"><b>购物帮助</b></font><br><br><font size=1rem color="white">通过订阅，即代表您接受PERFUME TOWN的隐私政策条款</font>
		<br><br><br>
		<input type="text" placeholder="<%=user.getEmail()%>"  class="email"><input type="button" value=">" class="email2">
		
		</p>
		
		</div>
	</div>
	
	<div class="class2" style=" text-align:left;">
		<div id="a1"><font size=1rem; color=grey><b>&emsp;&emsp;copyright © 2020 by 王佳琦 寸洁蓉</b></font></div>
		
	</div>
</body>
</html>