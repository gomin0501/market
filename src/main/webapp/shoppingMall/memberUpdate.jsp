<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <%
   	String sessionId=(String) session.getAttribute("sessionId");
   %>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.7.1.min.js"></script>
</head>
<jsp:include page="menu.jsp"/>
<body>
<%!String greeting="회원 수정"; %>
<div class="p-3 mb-2 bg-dark-subtle text-dark-emphasis display-3 text-center">
	<%=greeting %>
</div>
<section>
	<!-- action:폼을 memberProcess.jsp로 넘겨준다 -->
	<form name="form" method="post" action="memberUpdateProcess.jsp">
	<table class="table border border-0 w-50 p-3 mx-auto p-2">
<%@ include file="dbconn.jsp" %>
<%
	try{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from member23 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,sessionId);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String password=rs.getString(2);
			String name=rs.getString(3);
			String gender=rs.getString(4);
			String birth=rs.getString(5);
			String email=rs.getString(6);
			String phone=rs.getString(7);
			String address=rs.getString(8);
			String year=birth.substring(0,4);
			String month=birth.substring(4,6);
			String day=birth.substring(6,8);
			String em[]=email.split("@");
%>
	    <tr>
	      <th class="table-info">아이디</th>
	      <td ><input type="text" name="id" value="<%=sessionId %>" class="border border-secondary-subtle rounded-3"></td>
	    </tr>
	    <tr>
	      <th class="table-info">성 명</th>
	      <td ><input type="text" name="name" value="<%=name %>" class="border border-secondary-subtle rounded-3"></td>
	    </tr>
	    <tr>
	      <th class="table-info">비밀번호</th>
	      <td ><input type="password" name="password" class="border border-secondary-subtle rounded-3" value="<%=password %>"></td>
	    </tr>
	    <tr>
	      <th class="table-info">비밀번호 확인</th>
	      <td ><input type="password" name="psCheck" class="border border-secondary-subtle rounded-3" value="<%=password %>"></td>
	    </tr>
	    <tr>
	      <th class="table-info">성 별</th>
	      <td ><input type="radio" name="gender" value="남" <%=gender.equals("남") ?  "checked" : "" %>>남
	      <input type="radio" name="gender" value="여" <%=gender.equals("여") ?  "checked" : "" %>>여</td>
	    </tr>
	    <tr>
	    	<th class="table-info">생 일</th>
	    	<td>
	    		<input type="text" name="year" placeholder="2020" class="border border-secondary-subtle rounded-3" value="<%=year %>">
	    		<select name="month" class="border border-secondary-subtle rounded-3">
	    			<option value="01" <%if(month.equals("01")){ %> selected <% } %>>1</option>
	    			<option value="02" <%if(month.equals("02")){ %> selected <% } %>>2</option>
	    			<option value="03" <%if(month.equals("03")){ %> selected <% } %>>3</option>
	    			<option value="04" <%if(month.equals("04")){ %> selected <% } %>>4</option>
	    			<option value="05" <%if(month.equals("05")){ %> selected <% } %>>5</option>
	    			<option value="06" <%if(month.equals("06")){ %> selected <% } %>>6</option>
	    			<option value="07" <%if(month.equals("07")){ %> selected <% } %>>7</option>
	    			<option value="08" <%if(month.equals("08")){ %> selected <% } %>>8</option>
	    			<option value="09" <%if(month.equals("09")){ %> selected <% } %>>9</option>
	    			<option value="10" <%if(month.equals("10")){ %> selected <% } %>>10</option>
	    			<option value="11" <%if(month.equals("11")){ %> selected <% } %>>11</option>
	    			<option value="12" <%if(month.equals("12")){ %> selected <% } %>>12</option>
	    		</select>
	    		<input type="text" name="day" placeholder="1" class="border border-secondary-subtle rounded-3" value="<%=day %>">
	    	</td>
	    </tr>
	    <tr>
	      <th class="table-info">이메일</th>
	      <td ><input type="text" name="emailId" placeholder="이메일" value="<%=em[0] %>" class="border border-secondary-subtle rounded-3">
	      @
	      	<select name="email" class="drop" class="border border-secondary-subtle rounded-3">
	      		<option value="naver.com" <%if(em[1].equals("naver.com")){ %> selected <% } %>>naver.com</option>
	      		<option value="daum.net" <%if(em[1].equals("daum.net")){ %> selected <% } %>>daum.net</option>
	      		<option value="nate.com" <%if(em[1].equals("nate.com")){ %> selected <% } %>>nate.com</option>
	      		<option value="hotmail.com" <%if(em[1].equals("hotmail.com")){ %> selected <% } %>>hotmail.com</option>
	      		<option value="gmail.com" <%if(em[1].equals("gmail.com")){ %> selected <% } %>>gmail.com</option>
	      	</select>
	      </td>
	    </tr>
	    <tr>
	      <th class="table-info">연락처</th>
	      <td>
	      	<input class="border border-secondary-subtle rounded-3" type="text" name="phone" value="<%=phone %>">
	      </td>
	    </tr>
	    <tr>
	    	<th class="table-info">주소</th>
	    	<td><input class="border border-secondary-subtle rounded-3" type="text" name="address" value="<%=address %>"></td>
	    </tr>
	    
	    <tr>
	    	<td colspan="2">
	    	<button class="btn btn-primary" onclick="check()">회원수정</button>
	    	<button type="button" class="btn btn-primary" onclick="if(!confirm('정말로 탈퇴하겠습니까?')) return false;location.href='memberDelete.jsp?sessionId=<%=sessionId %>'">회원탈퇴</button>
	    	</td>	    	
	    </tr>
<%
	}
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>
	</table>
	</form>
<script src="memberForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>