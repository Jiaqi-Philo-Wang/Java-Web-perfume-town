<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录  |PERFUME TOWN</title>
<link rel="stylesheet" type="text/css" href="css/basic.css" />
<link rel="stylesheet" type="text/css" href="css/cun.css" />

</head>
<script language="javascript">
function to_submit(){
	var flag=0;
	if(document.forms[0].nm.value==""){
	alert("请填写登录用户名！");
	flag=1;
	}
	if(document.forms[0].pwd.value==""){
		alert("请填写登录密码！");
		flag=1;
		}
	
	if(flag==0){
	document.forms[0].submit();
	}
	
}
function to_register(){
	var flag=0;
	if(document.forms[1].newnm.value==""){
	alert("请填写注册用户名！");
	flag=1;
	}
	if(document.forms[1].newpwd.value==""){
		alert("请填写注册密码！");
		flag=1;
		}
	if(document.forms[1].newpwd2.value==""){
		alert("请确认注册密码！");
		flag=1;
		}
	if(document.forms[1].email.value==""){
		alert("请填写注册邮箱！");
		flag=1;
		}
	if(document.forms[1].age.value==""){
		alert("请填写注册年龄！");
		flag=1;
		}
	if(document.forms[1].newpwd.value!=document.forms[1].newpwd2.value){
	alert("两次密码不一致！");
	flag=1;
	}

	if(flag==0){
		document.forms[1].submit();
		}
	
}
</script>

<body>
<%Integer why=(Integer)request.getAttribute("WHY");
if(why!=null){
	if(why==1){
	%><script>alert("注册成功，请登录！");</script><%
}else if(why==3){
	%><script>alert("用户名或密码错误！");</script><%
	
}else if(why==2){
	%><script>alert("该用户已经存在！");</script><%

}else if(why==4){
	%><script>alert("密码重置失败！");</script><%

}else if(why==5){
	%><script>alert("密码重置成功！");</script><%

}}
%>
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<div class=top>
<p align="left"><div class="small"></div><img src="images/name2.jpg" alt="图标" height="80" width="180" align="left"></p>
</div>
<hr>
<div class=center>
<div class=left>
<form name="f2" action="login.act" method="post">
		<table align="center" valign="middle">
			<tr>
				<td class="tdleft" colspan="2"><font size="+1">登录我的账户</font></td>
				
			</tr>
			<tr>
				<td class="tdleft" colspan="2">用户名：</td>
				
			</tr>
			<tr>
				<td colspan="2"><input class="textt" name="nm"></td>
				
			</tr>
			<tr>
				<td class="tdleft" >密码:</td>
				<td class="tdright"><a href="reset.jsp">修改密码?</a></td>
				
			</tr>
			<tr>
				<td colspan="2"><input class="textt" type="password" name="pwd"></td>
			</tr>
			<tr>
				<td class="tdleft" colspan="2"><input type="checkbox" name="auto">记住我</td>

			</tr>
			<tr>
				<td colspan="2"><input type="button" value="登录" onclick="to_submit();" class="round_button button1 button2"></td>

			</tr>
			
		</table>
	</form>
</p>
</div>
<div class=right>
<p align="center">
<form name="f2" action="register.act" method="post">
		<table align="center" valign="middle"  >
			<tr>
				<td class="tdleft" colspan="2"><font size="+1">创建账户</font></td>
				
			</tr>
			<tr>
				<td class="tdleft" colspan="2">创建账户的好处如下：<br/>
				<ul><li>追踪您的订单</li><li>快速结账</li></ul>
				</td>
				
			</tr>
			<tr>
				<td class="tdleft">用户名：</td>
				<td ><input class="textt" name="newnm"></td>
				
			</tr>
			<tr>
				<td  class="tdleft">密码:</td>
				
				<td ><input class="textt" type="password" name="newpwd"></td>
			</tr>
			<tr>
				<td  class="tdleft">确认密码:</td>
				<td ><input class="textt" type="password" name="newpwd2"></td>
			</tr>
			<tr>
				<td  class="tdleft">年龄：</td>
				<td ><input class="textt" type="text" name="age"></td>
			</tr>
			<tr>		
				<td  class="tdleft">邮箱：</td>
				<td ><input class="textt" type="text" name="email"></td>
			</tr>
			<tr>
			<td></td>
				<td align="center"><input type="button" value="同意并继续" onclick="to_register();" class="round_button  button1 button2"></td>

			</tr>
			
		</table>
	</form>
</p>
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
		<input type="text" placeholder="电子邮件地址" class="email"><input type="button" value=">" class="email2">
		
		</p>
		
		</div>
	</div>
	
	<div class="class2" style=" text-align:left;">
		<div id="a1"><font size=1rem; color=grey><b>&emsp;&emsp;copyright © 2020 by 王佳琦 寸洁蓉</b></font></div>
		
	</div>

</body>
</html>