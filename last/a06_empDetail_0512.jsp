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
		$("select option[value='010']").attr("selected", true);

		$("#uptBtn").click(function(){
			if($("input").val()==""){
				alert("입력값이 비었습니다.");
				$(this).focus();
				return;
			}
			$("form").submit();
		})

	});
</script>
<style type="text/css">

</style>
</head>
<%
	String empno = (request.getParameter("empno")!=null)?request.getParameter("empno"):"0";

	Last db = new Last();
	Last_vo detail=db.oneEmp(new Integer(empno));
%>
<body>
	<h1>사원 상세 화면</h1>
	<h2>사번: <%=request.getParameter("empno") %></h2>
	<form method="post" action="a07_updateProc_0512.jsp">
<!-- empno 화면에 type=text로 보이지 않지만 실제 proc상 넘겨야 할 때 type="hidden"을 이용한다 -->	
		<input type="hidden" name="empno" value="<%=detail.getJempno() %>">
		<table>
			<tr>
				<td>사원명</td><td><input name="ename" value="<%=detail.getJename() %>"></td>
			</tr>
			<tr>
				<td>직책</td>
				<td>
				<select name="job" value="<%=detail.getJjob() %>">
						<option>MANAGER</option>
						<option>CLERK</option>
						<option>ANALYST</option>
						<option>SUPERMAN</option>
						<option>PRESIDENT</option>
						<option>SALESMAN</option>
						<option>연예인</option>
						<option>가수</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>관리자번호</td><td><input name="mgr" value="<%=detail.getJmgr() %>"></td>
			</tr>
			<tr>
				<td>입사일</td><td><input name="hiredate" value="<%=detail.getjhiredate() %>"></td>
			</tr>
			<tr>
				<td>연봉</td><td><input name="sal" value="<%=detail.getJsal() %>"></td>
			</tr>
			<tr>
				<td>보너스</td><td><input name="comm" value="<%=detail.getJcomm() %>"></td>
			</tr>
			<tr>
				<td>부서번호</td><td><input name="deptno" value="<%=detail.getJdeptno() %>"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="uptBtn" value="수정"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>
