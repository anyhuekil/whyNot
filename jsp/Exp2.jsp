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
	
});


</script>
</head>
<%
   String id = request.getParameter("id");
%>
<body>
<h1><%=id %></h1>





<%
   String gogo1 = request.getParameter("gogo2");
   String gogo2 = request.getParameter("gogo1");
%>
<body>
<h1><%=gogo1 %>gogo2</h1>
<h1><%=gogo2 %>gogo1</h1>
















</body>
</html>
