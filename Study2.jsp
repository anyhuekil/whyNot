<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="vo_test.Study_vo"
	import="database_test.Study_empDB, java.util.*"
%>
      
<%
Date time = new Date();
SimpleDateFormat
	format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
time.setTime(session.getCreationTime());
String creTime= format.format(time);
time.setTime(session.getLastAccessedTime());
String lastTime=format.format(time);
%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>♪DATABASE</title>
<style type="text/css">
html,body{height:100%;}
body{box-sizing:border-box;}
*, *:after, *:before{box-sizing:inherit;}
1	
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

<h1>2세션 : <%=session.getAttribute("cus") %></h1>
<h1>id:<%=session.getId() %></h1>
<h1>Create time:<%=creTime %></h1>
<h1>End time:<%=lastTime %></h1>


<%session.invalidate(); %>

<a href="Study1.jsp">초기페이지로이동(세션생성)</a>
<a href="Study3.jsp">세션사망시킴</a>







</body>
</html>
