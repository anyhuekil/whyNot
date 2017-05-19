<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="classVO.*,classDAO.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("UTF-8"); 
String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
/*  */


</style>
<script src="<%=path%>/com/jquery-3.2.1.js">
</script>
<script type="text/javascript">
$(document).ready(function(){


   
   
});
</script>
</head>
<body>
	
 
<!-- \${} -->

   <c:set var="fruit01" value="홍시"/>
   과일명:${fruit01}
   <c:set var="a01" value="홍시1"/>
   <c:set var="a02" value="홍시2"/>
   <c:set var="a03" value="홍시3"/>
   <c:set var="a04" value="홍시4"/>
   오잉크1:${a01}
   오잉크2:${a02}
   오잉크3:${a03}
   오잉크4:${a04}
   
</body>
</html>