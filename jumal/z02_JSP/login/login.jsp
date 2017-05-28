<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"
	import="z01_database.LoginDAO, z02_vo.AuctionUserVO "
%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#logBtn").click(function() {
			if ($("input[name=email]").val() == "") {
				alert("email를 입력하세요.");
				$("input[name=email]").focus();
				return;
			} else if ($("input[name=pwd]").val() == "") {
				alert("비밀번호를 입력하세요.");
				$("input[name=pwd]").focus();
				return;
			} else {
				$("form").submit();
			}
		})
		$("#regBtn").click(function() {
			$(location).attr("href", "register.jsp");
		})
	});
</script>
<style type="text/css">
</style>
</head>
<body>
	<form method="post" action="login_proc.jsp">
	<input type="hidden" name="proc" value="login"/>
		<table>
			<tr>
				<th>E-Mail</th>
				<th><input name="email"></th>
				<th>PASSWORD</th>
				<th><input type="password" name="pwd"></th>
				<th><input type="button" id="logBtn" value="로그인"></th>
				<th><input type="button" id="regBtn" value="회원가입"></th>
			</tr>
		</table>
	</form>
</body>
</html>