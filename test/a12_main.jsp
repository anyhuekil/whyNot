<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="test.Member"
%>
<% request.setCharacterEncoding("UTF-8");
String path=request.getContextPath();
boolean hasSession=false;
Member mem=null;
if(session.getAttribute("member")!=null){
	hasSession=true;
	mem=(Member)session.getAttribute("member");
	
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>17.05.</title>
		<style type="text/css">
		</style>
		<script src="<%=path%>/com/jquery-1.10.2.js"></script>
		<script type="text/javascript">
			var hasSession=<%=hasSession%>;
			if(!hasSession){
				alert("로그인 해주세요!!");
				$(location).attr("href","a10_login.jsp");
			}
			$(document).ready(function(){
				
			})
		</script>
	</head>
	<body><h1><%=mem.getName()%>님 환영합니다.</h1>
	<h2>현재 point:<%=mem.getPoint()%></h2>

	</body>
</html>