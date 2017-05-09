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
<body>
<%
String id_J = request.getParameter("id");
String pwd_J = request.getParameter("pwd");


boolean id_Jval=false;
boolean pwd_Jval=false;
boolean isValid=false;

if(id_J!=null && id_J.equals("aaa")){
	id_Jval=true;
}
if(pwd_J!=null && pwd_J.equals("fff")){
	pwd_Jval=true;
}
if(id_Jval && pwd_Jval){
	isValid=true;
}
if(!isValid){
	response.sendRedirect("today.jsp");
}
%>

<h2><%=id_J %>님 환영합니다.</h2>

</body>
</html>








