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
	$("input[type=button]").on("click",function(){
		alert("옹");
		if (confirm("전송?")){
			$("form").submit();
		} 
	});
});



</script>
</head>

<%
	String []whyNotA=request.getParameterValues("whyNot1");
%>
<body>
	<form method="post">
		<input type="text" name="whyNot1"/>
		<input type="text" name="whyNot1"/>
		<input type="text" name="whyNot1"/>
		<input type="text" name="whyNot2"/>
		<input type="text" name="whyNot2"/>
		<input type="text" name="whyNot2"/>
			<input type="button" value="후아"/>
	</form>
	
	
	
	<%
	if(whyNotA!=null && whyNotA.length>0){
		for(String yNot:whyNotA){%>
			<%= yNot%>
		<%}
	}%>
</body>
</html>












