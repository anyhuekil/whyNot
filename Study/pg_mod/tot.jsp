<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>♪JSP</title>
<link rel="stylesheet" type="text/css" href="pg.css" />
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<div class="whytable">
		<div class="whyrow">
			<div class="whycol">
				<jsp:include page="main.jsp">
					<jsp:param name="id" value="GOOD JOB" />
				</jsp:include>
			</div>
		</div>
		<div class="whyrow">
			<div class="whycol">
				<jsp:include page="one.jsp">
					<jsp:param name="menu" value="Hello" />
					<jsp:param name="menu" value="why" />
					<jsp:param name="menu" value="Not" />
					<jsp:param name="menu" value="Bye" />
				</jsp:include>
			</div>
		</div>
		<div class="whyrow">
			<div class="whycol">
				<jsp:include page="${part}/toto?part=two">
					<jsp:param name="id" value="GOOD JOB" />
				</jsp:include>
			</div>
		</div>
		<div class="whyrow">
			<div class="whycol">
				<jsp:include page="thr.jsp">
					<jsp:param name="menu" value="Hello" />
					<jsp:param name="menu" value="why" />
					<jsp:param name="menu" value="Not" />
					<jsp:param name="menu" value="Bye" />
				</jsp:include>
			</div>
		</div>
	</div>
</body>
</html>













