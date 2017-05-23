<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
String path=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>B_Write</title>
	<link rel="stylesheet" type="text/css" href="css/board.css?ver=1.3">
	<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript">
	/**/
	$(function(){
		
	});

	</script>
</head>
<body>
	<div class="listBox">
		<div class="listCommandContain whyContain">
			<div class="listWrite whyClick">글쓰기</div>
			<div class="listSearch whyClick">검색</div>
			<input class="listSearchText" type="text">
		</div>
		<div class="listLine whyContain">
			<div class="listNo">No</div>
			<div class="listTitle">제목</div>
			<div class="listId">쓴놈</div>
			<div class="listSearchCnt">본놈</div>
		</div>
		<div class="listContent">
			<h3>내용~~</h3>
			<h3>내용~~</h3>
			<h3>내용~~</h3>
			<h3>내용~~</h3>
		</div>
		<div class="listCommandContain whyContain">
			<div class="listCommand whyContain">
				<div class="listMoveleft whyClick">◀</div>
				<div class="listMoveno whyClick">1</div>
				<div class="listMoveno whyClick">2</div>
				<div class="listMoveno whyClick">3</div>
				<div class="listMoveright whyClick">▶</div>
			</div>
		</div>
	</div>
</body>
</html>