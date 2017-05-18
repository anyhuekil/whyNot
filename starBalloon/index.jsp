<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<% request.setCharacterEncoding("UTF-8");
String path=request.getContextPath();

String ip = request.getRemoteAddr();
String userName = "게스트";

session.setAttribute(ip,userName);

Date time= new Date();
SimpleDateFormat 
	format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
time.setTime(session.getCreationTime());
String creTime=format.format(time); // 생성시간 format 형식 처리.
time.setTime(session.getLastAccessedTime());
String lastTime=format.format(time);
%>

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

#inpputName{}
#button{}
#nameValue{}

/*
*{border: 1px dotted red;}
*/
</style>
<script src="http://code.jquery.com/jquery-3.2.1.js">
</script>
<script type="text/javascript">
/**/
$(function(){
	$("#button").on("click",function(){
		var upperChar = $("#inputName").val().toUpperCase(); //대문자로 변환
		var temp=[]; // 각 단어 아스키코드 값
		var cnt = 0;
		word[0] = 0;
		alert($("#inputName").val());
		for(var idx = 0; idx < upperChar.length; idx++){
			temp[idx] = upperChar.charCodeAt(idx);
			if(temp[idx]==32){
				word[cnt] = word[cnt]%10; 
				cnt++;
				word[cnt]=0;
			}else{
				word[cnt] += temp[idx];
			}
		}
		word[cnt] = word[cnt]%10; 
		$("#nameValue").html(word);
	});
});


var word = [];

</script>
</head>
<body>
	<div><input id="inputName" type="text" value="a A z Z"></div>
	<div id="button">입력</div>
	<h1 id="nameValue">??</h1>


</body>
</html>









//session.setAttribute("key", value객체);


		<script type="text/javascript">
			$(document).ready(function(){
				
			})
		</script>
	</head>
	<body>
		<h1>세션 생성시간:<%=creTime%></h1>
		<h1><%=session.getAttribute(userName)%>님 드루와~</h1>
		<h3>[<%=ip %>]</h3>
		<p>세션ID:<%=session.getId()%></p>
		<h1>브라우저가 마지막으로 세션접근시간:<%=lastTime%></h1>
	<a href="a01_makeSession.jsp">초기 page로 이동(세션생성)</a><br>
	<a href="a03_checkSession.jsp">세션이 과연 살아 있을까?</a>
	</body>
</html>





