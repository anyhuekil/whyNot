<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="vo_test.Study_vo"
	import="database_test.Study_empDB, java.util.*"
%>
      
    
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>♪DATABASE</title>
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
<%
Study_empDB db = new Study_empDB();
String name = request.getParameter("name");
String job = request.getParameter("job");
Study_vo sch = new Study_vo();
//name이 null이 아니고 ""이 아닐 경우. ("  ", "     ") 까지 잡기 위해 trim()   
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
   </form><br>
<table>
	<tr>
		<th>1</th>
		<th>2</th>
		<th>3</th>
		<th>4</th>
		<th>5</th>
		<th>6</th>
		<th>7</th>
		<th>8</th>
	</tr>
      <%for(Study_vo e : db.searchPre(sch)){ %>
	<tr>
		<td><%=e.getJempno() %></td>
		<td><%=e.getJename() %></td>
		<td><%=e.getJjob() %></td>
		<td><%=e.getJmgr() %></td>
		<td><%=e.getJhiredate() %></td>
		<td><%=e.getJsal() %></td>
		<td><%=e.getJcomm() %></td>
		<td><%=e.getJdeptno() %></td>
	</tr>
	<%} %>
</table>










</body>
</html>
