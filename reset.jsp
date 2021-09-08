<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/basic.css" />
<title>密码重置</title>
</head>
<script language="javascript">
function to_submit(){
	var flag=0;
	if(document.forms[0].nam.value==""){
	alert("请填写登录用户名！");
	flag=1;
	}
	if(document.forms[0].pawd.value==""){
		alert("请填写原先的密码！");
		flag=1;
		}
	if(document.forms[0].newpawd.value==""){
		alert("请填写新的密码！");
		flag=1;
		}
	if(flag==0){
	document.forms[0].submit();
	}
	
}
</script>
<body>
<div class=top>
<p align="left"><div class="small"></div><img src="images/name2.jpg" alt="图标" height="80" width="180" align="left"></p>
</div>
<hr>
<div class=center>
<form name="f2" action="reset.act" method="post">
		<table align="center" valign="middle">
			<tr>
				<td class="tdleft" colspan="2"><font size="+1">修改我的密码：</font></td>
				
			</tr>
			<tr>
				<td class="tdleft" colspan="2">用户名：</td>
				
			</tr>
			<tr>
				<td colspan="2"><input class="textt" name="nam"></td>
				
			</tr>
			<tr>
				<td class="tdleft" >旧密码:</td>
				
			</tr>
			<tr>
				<td colspan="2"><input class="textt" type="password" name="pawd"></td>
			</tr>
			<tr>
				<td class="tdleft" >新密码:</td>
				
			</tr>
			<tr>
				<td colspan="2"><input class="textt" type="password" name="newpawd"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="重置" onclick="to_submit();" class="round_button button1 button2"></td>

			</tr>
			
		</table>
	</form>
</p>
</div>
</body>
</html>