<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.7.1.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand navbar-dark bg-dark">
  <div class="container-fluid">
  	<div class="navbar-header">
  		<a class="navbar-brand" href="index.jsp">Home</a>
  	</div>
 </div>
 </nav>
 <%@ include file="menu.jsp" %>
 <%!String greeting="쇼핑몰에 오신 것을 환영합니다";
  String tagline="Welcome to yangjung Market!";%>
  <div class="p-3 mb-2 bg-dark-subtle text-dark-emphasis display-3 text-center">  <%=greeting %></div>
  <div class="text-center">
  <h3><%=tagline %></h3></div>
  <footer class="container">
  	<p>&copy; yangjung WebMarket 2024</p>
  </footer>
</body>
</html>