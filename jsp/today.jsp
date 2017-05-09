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
	$("#loginBtn").on("click",function(){
		if($("input[name=id]").val()==""){
			alert("id입력");
			$("input[name=id]").focus();
			return;
		}
		if($("input[name=pwd]").val()==""){
			alert("pass입력");
			$("input[name=pwd]").focus();
			return;
		}
		$("form").attr("action","today_receive.jsp");
		$("form").attr("method","post");
		$("form").submit();
	});
});

(function(){

});

</script>
</head>
<body>


<form action="today_receive.jsp" method="post">
	id:<input type="text" name="id"><br>
	pass:<input type="password" name="pwd"><br>
	<input type="button" id="loginBtn" value="로긴!">
</form>



</body>
</html>
















