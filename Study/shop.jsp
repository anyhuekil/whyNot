<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import ="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
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
		<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("h3 input[type=button]").click(function(){
					$("#product").val($(this).attr("id"))
					$('form').submit();
				});
				$("#cart").click(function(){
					$(location).attr("href","${path}/pList")
				})
			});
			
			
		</script>
	</head>
	<body>
		<h1>쇼핑몰</h1>
			<form method="post">
				<input type="hidden" name="product" id="product">
				<h3>사과<input type="button" id="item1" value="☜"/></h3>
				<h3>바나나<input type="button" id="item2" value="☜"/></h3>
				<h3>땰기<input type="button" id="item3" value="☜"/></h3>
				<input type="button" id="cart" value="장봐구니"/> 
			</form>
	</body>
</html>