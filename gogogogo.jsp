<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="acon_whyNot01.gogo"
    %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
/*

*/


</style>
<script src="/jspexp/com/jquery-3.2.1.js">
</script>
<script type="text/javascript">
$(document).ready(function(){


   
   
});
</script>
</head>
<body>
<%
gogo d = new gogo();
d.setSchedule("Rest!!!!!!!!!");
%>
<h1 align="center">이번 휴일의 핵심 일정은 <%=d.getSchedule() %></h1>



</body>
</html>