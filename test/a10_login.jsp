<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>17.05.</title>
		<style type="text/css">
		</style>
		<script src="http://code.jquery.com/jquery-3.2.1.js">
		<script type="text/javascript">
			$(document).ready(function(){
				
			})
		</script>
	</head>
	<body>
	<h2 align="center">로그인</h2>
	<form method="post" action="a11_proc.jsp">
	<input type="hidden" name="proc" value="login"/>
	<table align="center">
		<tr><td>ID</td><td><input type="text" name="memid"/></td></tr>
		<tr><td>PASSWORD</td><td><input type="password" name="pass"/></td></tr>
		<tr><td colspan="2" align="center">
				<input type="submit" value="로그인"/>
		</td></tr>
	</table>
	</form>

	</body>
</html>