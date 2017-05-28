<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="z01_database.LoginDAO, z01_database.AuctionUserDAO, z02_vo.AuctionUserVO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	LoginDAO login = new LoginDAO();
	Integer check = login.checkLogin(email, pwd);

	AuctionUserDAO userDAO = new AuctionUserDAO();
	AuctionUserVO userVO = new AuctionUserVO();
	userVO.setUserId(check);
	String userName = userDAO.infoUser(userVO).getUserName(); //###
	boolean isLogout = false;

	if (check != null) {
		session.setAttribute(userName, userVO);
		
	} else if (check == null) {

	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
	var checkJs = <%=check%>
	if(checkJs != null){
		alert(<%=userName%>+"님 환영합니다!");
	}
</script>
<style type="text/css">
</style>
</head>

<body>

	<h3>
		<%=userName%>님 환영합니다!
	</h3>

</body>
</html>