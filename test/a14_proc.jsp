<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="test.A05_ProductDao"
   import ="test.Product"
    
    %>
<%request.setCharacterEncoding("UTF-8"); 
String path=request.getContextPath();
String name=request.getParameter("name");
boolean hasProduct=false;
if(name!=null){
   A05_ProductDao dao = new A05_ProductDao();
   Product sch = new Product();
   sch.setName(name);
   
   Product vo=dao.getProduct(sch);
   // 해당 데이터가 있으면..
   if(vo!=null){
      hasProduct=true;
      session.setAttribute("why", vo);
   }   
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
/*

*/


</style>
<script src="http://code.jquery.com/jquery-3.2.1.js">
</script>
<script type="text/javascript">
var hasProduct=<%=hasProduct%>;
if(!hasProduct){
   alert("물건 재고가 없습니다!");
    $(location).attr("href","a13_chk_prod.jsp");
}




$(document).ready(function(){
   
});
</script>
</head>
<%
Product sessVo=(Product)session.getAttribute("why");
%>   
<body>

   <h3 align="center">물건명:<%=sessVo.getName() %></h3>
   <h3 align="center">재고건수:<%=sessVo.getCnt() %></h3>


</body>
</html>











