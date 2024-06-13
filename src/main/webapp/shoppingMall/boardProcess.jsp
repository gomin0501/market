<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int num=0;
	String sql="select max(num) from board24";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		num=rs.getInt(1)+1;
	}else{
		num=1;
	}
	
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String ip_addr=request.getRemoteAddr();
	
	try{
		sql="insert into board24(num,id,name,password,subject,content,regist_day,ip) values(?,?,?,?,?,?,sysdate,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,num);
		pstmt.setString(2,id);
		pstmt.setString(3,name);
		pstmt.setString(4,password);
		pstmt.setString(5,subject);
		pstmt.setString(6,content);
		pstmt.setString(7,ip_addr);
		pstmt.executeUpdate();
		response.sendRedirect("resultBoard.jsp?msg=1");
		
		
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
	
%>
</body>
</html>