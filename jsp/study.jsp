<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>♪JSP</title>
<style type="text/css">
html,body{height:100%;}
body{box-sizing:border-box;}
*, *:after, *:before{box-sizing:inherit;}

*{margin:0; padding:0;}

.whyContain{padding:0;}
.whyContain:after,
.whyContain:before{content:"";display:table;clear:both;}


/*
*{border: 1px dotted red;}
*/
</style>
<script src="http://code.jquery.com/jquery-3.2.1.js">
</script>
<script type="text/javascript">
/**/
$(function(){
	var check;
	if($(".ccc").html()=="192.168.0.95"){
		$(".bbb").html("저리가!!");
	}
});





</script>
</head>
<body>

<div class="ccc"><%=request.getRemoteAddr()%></div>
<h1>서종원 홈</h1>

<h2>클라이언트IP:<%=request.getRemoteAddr() %></h2>
<h2>요청정보 메소드:<%=request.getMethod() %></h2>
<h2>컨텍스트 경로(프로젝트명):<%=request.getContextPath() %></h2>
<h2>서버이름:<%=request.getServerName() %></h2>
<h2>서버포트:<%=request.getServerPort() %></h2>

<div class="bbb"></div>


</body>
</html>