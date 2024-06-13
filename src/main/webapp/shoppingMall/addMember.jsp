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
 <%!String greeting="회원 가입";
  String tagline="Welcome to yangjung Market!";%>
  <div class="p-3 mb-2 bg-dark-subtle text-dark-emphasis display-3 text-center">  <%=greeting %></div>
<section >
	<!-- action:폼을 memberProcess.jsp로 넘겨준다 -->
	<form name="form" method="post" action="memberProcess.jsp">
	<table class="table border border-0 w-50 p-3 mx-auto p-2">

	    <tr>
	      <th class="table-info">아이디</th>
	      <td><input class="border border-secondary-subtle rounded-3" type="text" name="id" placeholder="id"></td>
	    </tr>
	    <tr>
	      <th class="table-info">비밀번호</th>
	      <td ><input class="border border-secondary-subtle rounded-3" type="password" name="password" placeholder="password"></td>
	    </tr>
	    <tr>
	      <th class="table-info">비밀번호 확인</th>
	      <td ><input class="border border-secondary-subtle rounded-3" type="password" name="psCheck" placeholder="password confirm"></td>
	    </tr>
	    <tr>
	      <th class="table-info">성 명</th>
	      <td ><input class="border border-secondary-subtle rounded-3" type="text" name="name" placeholder="name"></td>
	    </tr>
	    <tr>
	      <th class="table-info">성 별</th>
	      <td ><input type="radio" name="gender" value="남" checked>남
	      <input type="radio" name="gender" value="여">여</td>
	    </tr>
	    <tr>
	    	<th class="table-info">생 일</th>
	    	<td>
	    		<input class="border border-secondary-subtle rounded-3" type="text" name="year" placeholder="년(4자)">
	    		<select name="month" class="border border-secondary-subtle rounded-3">
	    			<option>월</option>
	    			<option value="01">1</option>
	    			<option value="02">2</option>
	    			<option value="03">3</option>
	    			<option value="04">4</option>
	    			<option value="05">5</option>
	    			<option value="06">6</option>
	    			<option value="07">7</option>
	    			<option value="08">8</option>
	    			<option value="09">9</option>
	    			<option value="10">10</option>
	    			<option value="11">11</option>
	    			<option value="12">12</option>
	    		</select>
	    		<input type="text" name="day" placeholder="일" class="border border-secondary-subtle rounded-3">
	    	</td>
	    </tr>
	    <tr>
	      <th class="table-info">이메일</th>
	      <td ><input type="text" name="emailId" class="border border-secondary-subtle rounded-3">
	      @
	      	<select name="email" class="border border-secondary-subtle rounded-3">
	      		<option value="naver.com">naver.com</option>
	      		<option value="daum.net">daum.net</option>
	      		<option value="nate.com">nate.com</option>
	      		<option value="hotmail.com">hotmail.com</option>
	      		<option value="gmail.com">gmail.com</option>
	      	</select>
	      </td>
	    </tr>
	    <tr>
	      <th class="table-info">연락처</th>
	      <td>
	      	<input type="text" name="phone" placeholder="phone" class="border border-secondary-subtle rounded-3">
	      </td>
	    </tr>
	    <tr>
	    	<th class="table-info">주소</th>
	    	<td><input class="border border-secondary-subtle rounded-3" type="text" name="address" placeholder="address"></td>
	    </tr>
	  
	    <tr>
	    	<td colspan="2">
	    	<button onclick="check()" class="btn btn-primary">등록</button>
	    	<button type="reset" class="btn btn-primary">취소</button>
	    	</td>	    	
	    </tr>
	</table>
	</form>
<script src="memberForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>