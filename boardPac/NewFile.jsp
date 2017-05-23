<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
String path=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>♪JSP</title>

	<link rel="stylesheet" type="text/css" href="css/board.css?ver=1">
	
	<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript">
	/**/
	$(function(){
		
	});

	</script>
</head>
<body>
	<div class="listBox">
		<div class="listLine whyContain">
			<div class="listNo">No</div>
			<div class="listTitle">제목</div>
			<div class="listId">쓴놈</div>
			<div class="listSearchCnt">본놈</div>
		</div>
		<div class="listPageContain whyContain">
			<div class="listPage">
				<div class="lsitMoveleft whyClick">◀</div>
				<div class="lsitMoveno whyClick">1</div>
				<div class="lsitMoveno whyClick">2</div>
				<div class="lsitMoveno whyClick">3</div>
				<div class="lsitMoveright whyClick">▶</div>
			</div>
		</div>
		<input class="listSearchText" type="text">
		<div class="listSearch whyClick">검색</div>
		<div class="listWrite whyClick">글쓰기</div>
	</div>
</body>
</html>