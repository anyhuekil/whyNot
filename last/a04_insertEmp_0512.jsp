<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#regBtn").click(function(){
			if($("input[name=ename]").val()==""){
				alert("입력값이 비어있습니다.");
				$("input[name=ename]").focus();
				return;
			}
			if($("input[name=sal]").val()==""){
				alert("입력값이 비어있습니다.");
				$("input[name=sal]").focus();
				return;
			}
			if($("input[name=comm]").val()==""){
				alert("입력값이 비어있습니다.");
				$("input[name=comm]").focus();
				return;
			}
			$("form").submit();
		})
	});
</script>
<style type="text/css">
	table{margin:auto;}
	td{width:25%;text-align:center;}
	select{width:100%;}
</style>
</head>
<body>
	<h3 align="center">사원 등록</h3>
	<form method="post" action="a05_insertProc_0512.jsp">
		<table border=1>
			<tr>
				<td>사원명</td><td><input name="ename"></td>
				<td>직책</td>
				<td>
					<select name="job">
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
				<td>관리자번호</td>
				<td>
					<select name="mgr">
						<option value="7839">KING</option>
						<option value="7902">FORD</option>
						<option value="7698">BLAKE</option>
						<option value="7566">JONES</option>
						<option value="7788">SCOTT</option>
						<option value="7782">CLARK</option>
					</select>
				</td>
				<td>연봉</td><td><input name="sal"></td>
			</tr>
			<tr>
				<td>보너스</td><td><input name="comm"></td>
				<td>부서명</td>
				<td>
					<select name="deptno">
						<option value="10">ACCOUNTING</option>
						<option value="20">RESEARCH</option>
						<option value="30">SALES</option>
						<option value="40">OPERATIONS</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4"><input type="button" id="regBtn" value="등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>
