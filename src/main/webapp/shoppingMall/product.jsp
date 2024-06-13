<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%!String greeting="상품 목록";%>
  <div class="p-3 mb-2 bg-dark-subtle text-dark-emphasis display-3 text-center">  <%=greeting %></div>
<div class="container">
	<div class="row" align="center">
		<%@ include file="dbconn.jsp" %>
		<%
			String productId=request.getParameter("productId");
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
		try{
			String sql="select * from product24";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				String id=rs.getString(1);
				String name=rs.getString(2);
				String unitPrice=rs.getString(3);
				String category=rs.getString(5);
				String manufacturer=rs.getString(6);
				String unitsInstock=rs.getString(7);
				String filename=rs.getString(9);
			System.out.println("filename:"+filename); //이름 맞는지 확인하기
		%>
		<div class="col-md-3 d-inline" style="width:40%">
			<figure>
				<figcaption class="text-start"><%=filename %></figcaption>
				<img src="<%=request.getContextPath() %>/shoppingMall/upload/<%=filename %>" style="width:100%">
			</figure>
		</div>
		<div class="d-inline text-start mt-5" style="width:60%">
			<h3><%=name %></h3>
			<p class="fs-6"><%=manufacturer %></p>
			<p><span class="fw-bold">상품 코드:</span> <%=id %></p>
			<p><span class="fw-bold">제조사:</span> <%=manufacturer %></p>
			<p><span class="fw-bold">분류:</span> <%=category %></p>
			<p><span class="fw-bold">재고 수:</span> <%=unitsInstock %></p>
			<h3><%=unitPrice %>원</h3>
			<p class="mt-3">
				<a href="addCart.jsp?id=<%=id %>" class="btn btn-info"
				rol="button" onclick="if(!confirm('상품을 장바구니에 추가하시겠습니까?')) return false;">상품 주문 &raquo;</a>
				<a href="cart.jsp?id=<%=id %>" class="btn btn-warning"
				rol="button">장바구니 &raquo;</a>
				<a href="productList.jsp" class="btn btn-secondary"
				rol="button">상품 목록 &raquo;</a>
			
		</div>
		
		
		<%
			}
		}catch(Exception e){
			System.out.println("연결 오류");
			e.printStackTrace();
		}
		%>
	</div>
<hr>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>