<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); 
String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
/*

*/


</style>
<script src="<%=path%>/com/jquery-3.2.1.js">
</script>
<script type="text/javascript">
$(document).ready(function(){


   
   
});
</script>
</head>
<body>
   <h2 align="center">구매할 내용</h2>
   <center>
   <form action="a14_proc.jsp" method="post">
      물건명:<input type="text" name="name" /><br>
      <input type="submit" value="재고확인"/>
   </form>
   </center>
</body>
</html>







