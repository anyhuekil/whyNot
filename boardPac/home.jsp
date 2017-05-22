<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
String path=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>♪JSP</title>
	<link rel="stylesheet" type="text/css" href="css/starBalloon.css">
	<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript">
	/**/
	$(function(){
		
	});
	
	
	</script>
</head>
<body>
	<h1>IP:<%=request.getRemoteAddr()%></h1>
	<h1>회원유무:</h1>
	<h1>가입유무:</h1>
</body>
</html>