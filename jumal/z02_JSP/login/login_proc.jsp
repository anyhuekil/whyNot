<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="z01_database.LoginDAO, z01_database.AuctionUserDAO, z02_vo.AuctionUserVO"%>
<%
	request.setCharacterEncoding("UTF-8");

	String proc = request.getParameter("proc");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");

	AuctionUserDAO userDAO = new AuctionUserDAO();
	AuctionUserVO userVO = new AuctionUserVO();

	/* 로그인 */
	// 로그인을 한다.
	// email과 비밀번호를 입력한다.
	// DAO를 통해서 SQL의 정보를 확인한다.
	// 1.정보가 있다면 로그인 한다. + 세션을 연결한다.
	// 2.로그인 정보가 없다면 다시 로그인 페이지로 보낸다.
	// 3.로그아웃시에 로그인 화면으로 보낸다.
	LoginDAO login = new LoginDAO();
	Integer userId = login.checkLogin(email, pwd);
	boolean isLogout = false;
	
	if (userId != null) {
		userVO.setUserId(userId);
		String userName = userDAO.infoUser(userVO).getUserName();
		session.setAttribute(userName, userVO);
	}
	
	boolean hasData = false;
	if (proc != null && proc.equals("login")) {
		Member sch = new Member();
		sch.setMemid(memid);
		sch.setPass(pass);

		A04_MemeberDao dao = new A04_MemeberDao();
		Member vo = dao.getMember(sch);

		// 조회했을 때, 데이터가 없으면 null 
		if (vo != null) {
			hasData = true;
			// 데이터 있으므로..session 처리..
			session.setAttribute("member", vo);
		}
	}
	boolean isLogout = false;
	if (proc != null && proc.equals("logout")) {
		session.invalidate();
		isLogout = true;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹페이지 연습</title>
<style type="text/css">
</style>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	var hasData =
<%=hasData%>
	;
	if (hasData) {
		// 메인페이지 이동
		alert("로그인 성공!!");
		$(location).attr("href", "a12_main.jsp");
	} else {
		// 로드인페이지 이동
		var isLogout =
<%=isLogout%>
	;
		if (isLogout) {
			alert("세션종료! 로그아웃\n다시 로그인 이동!");
		} else {
			alert("해당 id와 password로 \n인증이 실패했습니다");
		}
		$(location).attr("href", "a10_login.jsp");
	}
	$(document).ready(function() {
	})
</script>
</head>
<body>

</body>
</html>
