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
	String productId=request.getParameter("productId");
	
	PreparedStatement pstmt=null;
	String sql="delete from product24 where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,productId);
	pstmt.executeUpdate();
	
	response.sendRedirect("resultProduct.jsp");
%>
</body>
</html>