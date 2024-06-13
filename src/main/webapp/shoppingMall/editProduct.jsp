<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="p-3 mb-2 bg-dark-subtle text-dark-emphasis display-3 text-left">
	<h1 class="display-6">상품 목록</h1>
</div>
<div class="container">
	<div style="padding-top: 10px">
		<table class="table table-hover" style="width: 100%;">
			<tr>
				<th>상품 ID</th>
				<th>상품명</th>
				<th>단가</th>
				<th>상세정보</th>
				<th>분류</th>
				<th>제조사</th>
				<th>재고</th>
				<th>관리</th>
			</tr>
		<%@ include file="dbconn.jsp" %>
		<%
			request.setCharacterEncoding("UTF-8");
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from product24";
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				String productId=rs.getString(1);
				String name=rs.getString(2);
				int price=rs.getInt(3);
				String description=rs.getString(4);
				String category=rs.getString(5);
				String manufacturer=rs.getString(6);
				int unitsInstock=rs.getInt(7);
				%>
			<tr>
				<td><%=productId %></td>
				<td><%=name %></td>
				<td><%=price %></td>
				<td><%=description %></td>
				<td><%=category %></td>
				<td><%=manufacturer %></td>
				<td><%=unitsInstock %></td>
				<td>
					<a href="updateProduct.jsp?productId=<%=productId %>"
					class="btn btn-primary" style="height: 30px;font-size:0.7em;">수정</a>
				</td>
			</tr>
				
			<%}
		%>
		</table>
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>