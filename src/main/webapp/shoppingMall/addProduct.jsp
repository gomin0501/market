<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/custom.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@ include file="menu.jsp" %>
 <%!String greeting="상품 등록";%>
  <div class="p-3 mb-2 bg-dark-subtle text-dark-emphasis display-3 text-center">  <%=greeting %></div>
<div class="container">
	<!-- action:폼을 memberProcess.jsp로 넘겨준다 -->
	<form name="newProduct" method="post" action="productProcess.jsp" class="form-horizontal" enctype="multipart/form-data">
		<div class="form-group row">
			<label class="col-sm-2">상품코드</label>
			<div class="col-sm-3">
				<input type="text" id="productId" name="productId" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품명</label>
			<div class="col-sm-3">
				<input type="text" id="name" name="name" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">가 격</label>
			<div class="col-sm-3">
				<input type="text" id="unitPrice" name="unitPrice" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상세정보</label>
			<div class="col-sm-3">
				<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">제조사</label>
			<div class="col-sm-3">
				<input type="text" id="manufacturer" name="manufacturer" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">분 류</label>
			<div class="col-sm-3">
				<input type="text" name="category" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">재 고 수</label>
			<div class="col-sm-3">
				<input type="text" name="unitsInstock" id="unitsInstock" class="form-control">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">상 태</label>
			<div class="col-sm-5">
		      <input type="radio" name="condition" value="New">신규 제품
		      <input type="radio" name="condition" value="Old">중고 제품
		      <input type="radio" name="condition" value="Refurbished">재생 제품
		     </div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이미지</label>
			<div class="col-sm-5">
				<input type="file" name="productImage" class="form-control">
			</div>
		</div>
	    <div class="form-group row">
	    	<div class="col-sm-offset-2 col-sm-10">
	    	<input type="button" onclick="CheckAddProduct()" class="btn btn-primary" value="상품 등록">
	    	</div>
	    </div>
	</form>
</div>
<script src="productForm.js"> </script>

<%@ include file="footer.jsp" %>
</body>
</html>