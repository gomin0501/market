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
	Integer price=0;
	String id=request.getParameter("id");
	String sql="select max(cart_id) from cart24";
	pstmt=conn.prepareStatement(sql);
	int cart_id=0;
	rs=pstmt.executeQuery();
	if(rs.next()){
		cart_id=rs.getInt(1)+1;
	}else{
		cart_id=1;
	}
	System.out.println("Cart_id : "+cart_id);
	sql="select unitprice from product24 where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		price=rs.getInt(1);
	}
	int Qty=1;
	sql="insert into cart24(cart_id,productid,qty,unitprice) values(?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,cart_id);
	pstmt.setString(2,id);
	pstmt.setInt(3,Qty);
	pstmt.setInt(4,price);
	pstmt.executeUpdate();
	response.sendRedirect("product.jsp?id="+id);
	
	
			
%>
</body>
</html>