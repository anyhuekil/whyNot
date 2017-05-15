<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="last.Last, last.Last_vo, java.util.*"
    %>
<%request.setCharacterEncoding("UTF-8"); %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
<style type="text/css">

</style>
</head>
<% 
//	요청값들 Emp에 할당하기
	Last dao = new Last();
	String ename = (request.getParameter("ename")!=null)?request.getParameter("ename"):"";
	String job = (request.getParameter("job")!=null)?request.getParameter("job"):"";
	String mgr = (request.getParameter("mgr")!=null)?request.getParameter("mgr"):"0";
	String sal = (request.getParameter("sal")!=null)?request.getParameter("sal"):"0";
	String comm = (request.getParameter("comm")!=null)?request.getParameter("comm"):"0";
	String deptno = (request.getParameter("deptno")!=null)?request.getParameter("deptno"):"0";

	Last_vo dto = new Last_vo();
	dto.setJename(ename);
	dto.setJjob(job);
//	숫자형 문자열을 숫자 Box처리로	
	dto.setJmgr( new Integer(mgr) );
	dto.setJsal( new Double(sal) );
	dto.setJcomm( new Double(comm) );
	dto.setJdeptno(new Integer(deptno) );
//	등록 완료	
	dao.insertEmp(dto);
//	초기조회페이지로 이동
	response.sendRedirect("a03_schEmpList_0511.jsp");
%>
<body>
	<h1 align="center">등록완료</h1>
</body>
</html>
