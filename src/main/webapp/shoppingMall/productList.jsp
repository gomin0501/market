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
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
		try{
			String sql="select * from product24";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				String productId=rs.getString(1);
				String name=rs.getString(2);
				String unitPrice=rs.getString(3);
				String description=rs.getString(4);
				String filename=rs.getString(9);
			System.out.println("filename:"+filename); //이름 맞는지 확인하기
		%>
		<div class="col-md-3">
			<%=request.getContextPath() %>
			<img src="<%=request.getContextPath() %>/shoppingMall/upload/<%=filename %>" style="width:100%">
			<h3><%=name %></h3>
			<p><%=description %></p>
			<p><%=unitPrice %></p>원
			<p><%=filename %></p>
			<p><a href="product.jsp?id=<%=productId %>" class="btn btn-secondary"
				rol="button">상세 정보&raquo;</a>
			
		</div>
		
		
		<%
			}
		}catch(Exception e){
			System.out.println("연결 오류");
			e.printStackTrace();
		}
		%>
	</div>

</div>
<jsp:include page="footer.jsp" />
</body>
</html>