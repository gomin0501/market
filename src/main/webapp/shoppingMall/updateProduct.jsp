<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/custom.css">
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-left">
	<h1 class="display-6">상품 수정</h1>
</div>
<%@ include file="dbconn.jsp" %>
<%
	String fileName="";
	try{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String productId=request.getParameter("productId");
		String sql="select * from product24 where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,productId);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String name=rs.getString("name");
			String unitPrice=rs.getString("unitPrice");
			String description=rs.getString("description");
			String manufacturer=rs.getString("manufacturer");
			String category=rs.getString("category");
			String unitsInstock=rs.getString("unitsInstock");
			String condition=rs.getString("condition");
			fileName=rs.getString("filename");
		%>	
	
<div class="container">
	<!-- action:폼을 memberProcess.jsp로 넘겨준다 -->
	<form name="newProduct" method="post" action="updateProductProcess.jsp" class="form-horizontal" enctype="multipart/form-data">
		<div class="form-group row">
			<label class="col-sm-2">상품코드</label>
			<div class="col-sm-3">
				<input type="text" id="productId" name="productId" class="form-control" value="<%=productId %>">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품명</label>
			<div class="col-sm-3">
				<input type="text" id="name" name="name" class="form-control" value="<%=name %>">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">가 격</label>
			<div class="col-sm-3">
				<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=unitPrice %>">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상세정보</label>
			<div class="col-sm-3">
				<textarea name="description" cols="50" rows="2" class="form-control"><%=description %></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">제조사</label>
			<div class="col-sm-3">
				<input type="text" id="manufacturer" name="manufacturer" class="form-control" value="<%=manufacturer %>">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">분 류</label>
			<div class="col-sm-3">
				<input type="text" name="category" class="form-control" value="<%=category %>">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">재 고 수</label>
			<div class="col-sm-3">
				<input type="text" name="unitsInstock" id="unitsInstock" class="form-control" value="<%=unitsInstock %>">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">상 태</label>
			<div class="col-sm-5">
		      <input type="radio" name="condition" value="New" <%=condition.equals("New")?"checked":"" %>>신규 제품
		      <input type="radio" name="condition" value="Old" <%=condition.equals("Old")?"checked":"" %>>중고 제품
		      <input type="radio" name="condition" value="Refurbished" <%=condition.equals("Refurbished")?"checked":"" %>>재생 제품
		     </div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이미지</label>
			<div class="col-sm-5">
				<input type="file" name="fileName" class="form-control" title="첨부파일"><%=fileName %>
			</div>
		</div>
	    <div class="form-group row">
	    	<div class="col-sm-offset-2 col-sm-10">
	    	<input type="button" onclick="CheckAddProduct()" class="btn btn-primary" value="수정">
	    	</div>
	    </div>
	<%	}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	</form>
</div>
<script src="productForm.js"> </script>

<%@ include file="footer.jsp" %>
</body>
</html>