<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*

*/

/**/
</style>
<script src="http://code.jquery.com/jquery-3.2.1.js">
</script>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>
<body><center>
<h2>클라이언트IP:<%=request.getRemoteAddr() %></h2>
<h2>요청정보 프로토콜:<%=request.getProtocol() %></h2>
<h2>요청 정보 메소드 : <%=request.getMethod() %></h2>
<h2>컨텍스트 경로(프로젝트명):<%=request.getContextPath() %></h2>
<h2>서버이름:<%=request.getServerName() %></h2>
<h2>서버포트:<%=request.getServerPort() %></h2>
</body>
</html>