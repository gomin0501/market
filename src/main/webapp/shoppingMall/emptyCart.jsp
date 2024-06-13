<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String productId=request.getParameter("productId");
	String sql="delete from cart24";
	pstmt=conn.prepareStatement(sql);
	pstmt.executeUpdate();
	
	response.sendRedirect("cart.jsp");
%>
</body>
</html>