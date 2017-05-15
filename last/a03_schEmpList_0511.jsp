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
/*
 # 웹화면에서 DB모듈 불러오기
 1) import 하기 : < %@ page
 	- DB 모듈 : import="z01_database.A01_EmpDB_0510"
 	- VO와 ArrayList : import="z02_vo.Emp_0511, java.util.*"
 
 2) < % %> 안에 선언
 
 3) for문을 table < % %>
*/
	$(document).ready(function(){
		$("#regBtn").click(function(){
			alert("이동");
			$(location).attr("href", "a04_insertEmp_0512.jsp");
		});
		$("tr").hover(function(){
			$(this).css("background", "#b3ffb3");
		}, function(){
			$(this).css("background", "");
		})
		$("tr").click(function(){
//			상세화면 page와 empno를 넘기면 상세화면에서 
//			1개 데이터 조회 처리
			var empno = $(this).children(0).html();
			alert(empno+" 클릭");
//			get방식으로 처리
//			a06_empDetail.jsp?넘김
//			해당 page에서 전달 받음. requset.getParameter("empno")		
			$(location).attr("href", "a06_empDetail_0512.jsp?empno="+empno);
		})
	});

</script>
<style type="text/css">

</style>
</head>
<% 
	Last db = new Last();
	String name = request.getParameter("name");
	String job = request.getParameter("job");
	Last_vo sch = new Last_vo();
//	name이 null이 아니고 ""이 아닐 경우. ("  ", "     ") 까지 잡기 위해 trim()	
	if( name!=null && !name.trim().equals("") ){
		sch.setJename(name);
	}else{
		sch.setJename("");
	}
	if( job!=null && !job.trim().equals("") ){
		sch.setJjob(job);
	}else{
		sch.setJjob("");
	}
%>

<body>
	<form method="post" style="margin:auto; text-align:center;">
		이름 : <input name="name" value="<%=sch.getJename() %>">
		직책 : <input name="job" value="<%=sch.getJjob() %>">
		<button type="submit">검색</button>
		<input type="button" id="regBtn" value="추가">
	</form><br>
	<table border=1; style="border-collapse:collapse; margin:auto;">
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>직책</th>
			<th>관리자번호</th>
			<th>입사일</th>
			<th>연봉</th>
			<th>보너스</th>
			<th>부서번호</th>
		</tr>
		<!-- 데이터를 loop하면서 처리할 내용 -->
		<%for(Last_vo e : db.search(sch)){ %>
		<tr>
			<td><%=e.getJempno() %></td>
			<td><%=e.getJename() %></td>
			<td><%=e.getJjob() %></td>
			<td><%=e.getJmgr() %></td>
			<td><%=e.getjhiredate() %></td>
			<td><%=e.getJsal() %></td>
			<td><%=e.getJcomm() %></td>
			<td><%=e.getJdeptno() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>
