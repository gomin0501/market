<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	String sessionId=(String) session.getAttribute("sessionId");
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand navbar-dark bg-dark">
  <div class="container-fluid">
  	<div class="navbar-header">
  		<a class="navbar-brand" href="index.jsp">Home</a>
  	</div>
  	<div>
  		<ul class="navbar-nav mr-auto">
  		<%
  			if(sessionId==null){%>
	  			<li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
	  			<li class="nav-item"><a class="nav-link" href="addMember.jsp">회원가입</a></li>
  		<%
  			}else{%>
  				<li style="padding-top: 7px; color: white">[<%=sessionId%>님 환영합니다.]</li>
	  			<li class="nav-item"><a class="nav-link" href="logout.jsp">로그아웃</a></li>
	  			<li class="nav-item"><a class="nav-link" href="memberUpdate.jsp">회원 수정</a></li>
	  		<%} %>
  					
  			<li class="nav-item"><a class="nav-link" href="productList.jsp">상품 목록</a></li>
  			<li class="nav-item"><a class="nav-link" href="addProduct.jsp">상품 등록</a></li>
  			<li class="nav-item"><a class="nav-link" href="editProduct.jsp">상품 수정</a></li>
  			<li class="nav-item"><a class="nav-link" href="deleteProduct.jsp">상품 삭제</a></li>
  			<li class="nav-item"><a class="nav-link" href="list.jsp">게시판</a></li>
  		</ul>
  	</div>
 </div>
 </nav>
 
</body>
</html>