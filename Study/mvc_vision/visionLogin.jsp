<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="Study_mvc.MvcVO"
	import="Study_mvc.MvcDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>♪JSP</title>
<style type="text/css">
html, body {
	height: 100%;
}

body {
	box-sizing: border-box;
}

*, *:after, *:before {
	box-sizing: inherit;
}

* {
	margin: 0;
	padding: 0;
}

.whyContain {
	padding: 0;
}

.whyContain:after, .whyContain:before {
	content: "";
	display: table;
	clear: both;
}

/*
			*{border: 1px dotted red;}
			*/
</style>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	if (name != "") {
		alert(name + "계정은 인증되지 않았습니다!!" + "\nid와 password를 확인하세요")
	}

	$(document).ready(function() {
		$("input[name=name]").focus();
	})
</script>
</head>
<body>
	<h1 align="center">로그인</h1>
	<!-- action="호출controller -->
	<form method="post">
		ID : <input type="text" name="name" /><br>
		PASSWORD : <input type="password" name="dtno" /><br>
		<input type="submit" value="로그인" />
	</form>

</body>
</html>