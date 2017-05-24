<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>17.05.</title>
<style type="text/css">
</style>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(input[name=memid]).foucs
	})
	var id="${id}";
	if(id!=""){
		alert("빠염~");
	}
</script>
</head>
<body>
	<h2 align="center">로그인</h2>
	<form method="post">
		<input type="hidden" name="proc" value="login" />
		<table align="center">
			<tr>
				<td>ID</td>
				<td><input type="text" name="memid" /></td>
			</tr>
			<tr>
				<td>PASSWORD</td>
				<td><input type="password" name="pass" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="로그인" />
				</td>
			</tr>
		</table>
	</form>

</body>
</html>