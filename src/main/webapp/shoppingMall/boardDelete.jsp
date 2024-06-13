<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String sessionId=(String) session.getAttribute("sessionId");
	String sessionName=(String) session.getAttribute("sessionName");
	String num=request.getParameter("num");
	String ps=request.getParameter("password");
	if(sessionId==null){
		%>
		<script>
			alert("먼저 로그인 하세요");
			history.back(-1);
		</script>
		<%
	}
%>
<%@include file="dbconn.jsp" %>
<%
try{
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from board24 where num=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,num);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String id=rs.getString("id");
		if(!id.equals(sessionId)){
			%>
			<script>
			alert("삭제할 수 없습니다.");
			history.back(-1);
			</script>
	<% 	
	}else{
		sql="delete board24 where num=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,num);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("resultBoard.jsp");
	}
	}	
}catch(Exception e){
	System.out.println("연결 오류");
	e.printStackTrace();
}
%>

</body>
</html>