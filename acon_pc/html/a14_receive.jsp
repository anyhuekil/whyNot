<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body><center>
입력받은 내용:<br>
<!--전송해주는 page의 input name="inputname" -->
이름:<%=request.getParameter("inputname")+
		"님 오셨습니다"%>
</body>
</html>