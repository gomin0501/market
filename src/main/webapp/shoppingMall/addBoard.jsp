<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@ include file="menu.jsp" %>
<%
	sessionId=(String) session.getAttribute("sessionId");
	String sessionName=(String) session.getAttribute("sessionName");
	if(sessionId==null){
		%>
		<script>
			alert("먼저 로그인 하세요");
			history.back(-1);
		</script>
		<%
	}
%>
<div class="p-3 mb-2 bg-dark-subtle text-dark-emphasis display-3 text-center">
		<h1 class="display-6">게시판</h1>
	</div>
	<div class="container">
		<form name="newWrite" class="form-horizontal" action="boardProcess.jsp"
		 method="post" onsubmit="return checkForm()">
		 <input name="id" type="hidden" class="form-control" value="${sessionId}">
		 <div class="form-group row">
		 	<label class="col-sm-2 controm-label">성명</label>
		 	<div class="col-sm-3">
		 		<input name="name" type="text" class="form-control" value="<%=sessionName %>"
		 			placeholder="name">
		 	</div>
		 </div>
		 <div class="form-group row">
		 	<label class="col-sm-2 controm-label">비밀번호</label>
		 	<div class="col-sm-3">
		 		<input name="password" type="password" class="form-control"	placeholder="password">
		 	</div>
		 </div>
		 <div class="form-group row">
		 	<label class="col-sm-2 controm-label">제목</label>
		 	<div class="col-sm-3">
		 		<input name="subject" type="text" class="form-control"	placeholder="subject">
		 	</div>
		 </div>
		 <div class="form-group row">
		 	<label class="col-sm-2 controm-label">내용</label>
		 	<div class="col-sm-3">
		 		<textarea name="content" cols="100" rows="5" class="form-control"	placeholder="content"></textarea>
		 		
		 	</div>
		 </div>
		 <div class="form-group row">
		 	<div class="col-sm-offset-2 col-sm-10">
		 		<input type="submit" class="btn btn-primary" value="등록">
		 		<input type="reset" class="btn btn-primary" value="취소">
		 	</div>
		 </div>
		 </form>
		 <hr>
	</div>
</body>
<script src="boardForm.js"></script>
</html>