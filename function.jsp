<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品管理  |PERFUME TOWN</title>
<style>

#a0{
				
				width: 100%;
				height: 50px;
			}
#a1{
				
				width: 100%;
				height: 100px;
			}
			
			#a2{
				
				width: 33%;
				height: 400px;
				float: left;
			}
			#a3{
				
				width: 33%;
				height: 400px;
				float:left;
			}
			#a4{
				
				width: 33%;
				height: 400px;
				float: left;
			}
			
			.class1{
			    width:90%;
				height:100px;
				
    			color: black;
   				border: 4px solid #ffffff;
   				border-radius: 12px; 
			}
			.class2{
			    width:90%;
				height:400px;
				
			}
			.class0{
			    width:100%;
				height:1200px;
				background:#f6f5ec;
				
			}
			.class3{
			    width:90%;
				height:80px;
				
			}
			.button1 {
   			
    		color: black;
    		border: 8px solid #228fbd; 
    		border-radius: 20px;
			}
			.button2 {
   			
    		color: black;
    		border: 6px solid #70a19f; 
    		border-radius: 20px;
			}
			.button3 {
   			
    		color: black;
    		border: 8px solid #76becc; 
    		border-radius: 20px;
			}
			.button4 {
   			
    		color: black;
    		border: 8px solid #f58220; 
    		border-radius: 20px;
			}
			a{text-decoration:none}
</style>
</head >
 <body>
 
<form action="func.do" method="get">


</form>
<div class="class0" align="center" >
<div class="class3" align="right" ><a href=""><button class="button button2"><font size=5rem; color=black><a href="managerhome.jsp">安全退出</a> </font></button></a></div>
<div class="class2" style="text-align:center;"> 
	<div id="a1"><img src='picture/4.png' width="100%" heigth="60%"><br><br><br></div>
</div>

<br><br><br><br><br><br><br><br><br>
<div class="class1" style="text-align:center;" >
	<div id="a1">————————<font size=6rem; color=grey><b>商品管理</b></font>————————</div><br>
</div>
<div class="class2" style=" text-align:center;">
	<div id="a2"> <br><a href="add.html"><button class="button button1"><font size=5rem; color=black>增加</font></b></button></a></div>
	<div id="a3"><br><a href="delete.html"><button class="button button3"><font size=5rem; color=black>删除</font></b></button></a></div>
	<div id="a4"><br><a href="inquiry.html"><button class="button button4"><font size=5rem; color=black>查询</font></b></button></a></div>
</div>

</div>
</body>
</html>
