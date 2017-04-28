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

<!--  
   form 이 있어야지 하위에 있는 <input에 소속된 데이터들을 전송할 수 있다. 
   실제 전송하는 이벤트를 발생하는 것은 form하위에 <input type="submit" 라는 버튼을 통해서 전송이 된다. 
   format의 속성값 action에 지정된 jsp page로 data를 전송한다
-->



<!-- 
   name="id" 값이 요청하는 page에서 request.getParameter("id")로 데이터를 받을 수 있다.
 -->



<!--  
   form 이 있어야지 하위에 있는 <input에 소속된 데이터들을 전송할 수 있다. 
   실제 전송하는 이벤트를 발생하는 것은 form하위에 <input type="submit" 라는 버튼을 통해서 전송이 된다. 
   format의 속성값 action에 지정된 jsp page로 data를 전송한다
-->
<form action="Exp2.jsp">
   ID:<input type="text" name="id"/><br>
   1<input type="submit"/>
</form>
<!-- 
   name="id" 값이 요청하는 page에서 request.getParameter("id")로 데이터를 받을 수 있다.
 -->
<div action="Exp2.jsp">
   hahahaha:<input type="text" name="gogo1"/><br>
   2<input type="submit"/>
<form action="Exp2.jsp">
   hahahaha:<input type="text" name="gogo2"/><br>
   3<input type="submit"/>
</form>
</div>




</body>
</html>