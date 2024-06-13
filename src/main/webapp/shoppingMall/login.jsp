<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="../css/custom.css">
</head>
<body>
<jsp:include page="menu.jsp" />
	<div class="p-3 mb-2 bg-dark-subtle text-dark-emphasis display-3 text-center">
		<h1 class="display-6">로그인</h1>
	</div>
	<form name="frm" method="post" action="loginProcess.jsp" class="position-relative login">
    	<div class="form-control login">
	    	<h3 class="login-ele">Please sign in</h3>
	    	<%
	    		String error=request.getParameter("error");
	    		if(error!=null){
	    			out.println("<div class='alert alert-danger login-ele'>");
	    			out.println("아이디와 비밀번호를 확인해 주세요");
	    			out.println("</div>");
	    		}
	    	%>
	    	<input class="form-control login-input " id="formGroupExampleInput" type="text" name="id" placeholder="ID">
	    	<input type="password" class="form-control login-input" id="formGroupExampleInput2" name="password" placeholder="Password">
	    	<div class="button-middle">
	    		<input type="submit" class="btn btn-success" value="로그인">
    		</div>
    	</div>
    </form>
</body>
</html>