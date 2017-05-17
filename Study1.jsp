<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Date time = new Date();
SimpleDateFormat
	format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
time.setTime(session.getCreationTime());
String creTime= format.format(time);
time.setTime(session.getLastAccessedTime());
String lastTime=format.format(time);
%>

<!-- 3번째 -->
<%session.setAttribute("cus"," why"); %>





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
	
});


</script>
</head>
<body>

<div>
	<h1>1세션:<%=session.getAttribute("cus") %></h1>
	<a href="Study2.jsp">이도오오옹</a>
</div>

<div>
	<h1>2세션: <%=session.getAttribute("cus") %></h1>
	<h1>id:<%=session.getId() %></h1>
	<h1>Create time:<%=creTime %></h1>
	<h1>End time:<%=lastTime %></h1>
	
	<a href="Study1.jsp">초기페이지로이동(세션생성)</a>
	<a href="Study3.jsp">세션사망시킴</a>
</div>	
	
<div>
	<%session.invalidate(); %>
	<h1>3세셔어언:<%=session.getAttribute("cus") %></h1>
	<a href="Study2.jsp">두번째 페이지 이도도도옹</a>
</div>

</body>
</html>