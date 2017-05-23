<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"
	import="fm_VO.SecondPageDTO, fm_DAO.SecondPageDAO"
	import="fm_VO.Auction_Bid, fm_DAO.Auction_BidDao"
%>
<%
	request.setCharacterEncoding("UTF-8");
	// 모든 프로세스 처리는 이 페이지에 모을생각.
%>

<%
	SecondPageDAO db = new SecondPageDAO();
	SecondPageDTO bidder = new SecondPageDTO();
	String raisedBid = (request.getParameter("afterR"));
	bidder.setCurrent_bid_amount(new Double(raisedBid)); //###
	bidder.setAuction_id(new Integer(request.getParameter("hiddenBidderId")));
	db.raisePrice(bidder); //###
	//response.sendRedirect("bidding.jsp");
	response.sendRedirect("auction_main.jsp");
%>
<!DOCTYPE html >
<html>
<head>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(document).ready(function() {

	});
</script>
<title>Insert title here</title>
</head>
<body>
	<h1>입찰완료.</h1>
	<h3><%=bidder.getCurrent_bid_amount()%></h3>
</body>
</html>