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
	int num=Integer.parseInt(request.getParameter("num")); 
	String psw=request.getParameter("password"); //폼에서 가져온 비밀번호
	String subject=request.getParameter("subject");
	String name=request.getParameter("name");
	String content=request.getParameter("content");
try{
	String sql="select password from board24 where num=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,num);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String ps=rs.getString(1); //데이터베이스에서 가져온 비밀번호
		if(psw.equals(ps)){
		sql="update board24 set subject=?,name=?,content=? where num=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,subject);
		pstmt.setString(2,name);
		pstmt.setString(3,content);
		pstmt.setInt(4,num);	
	
		pstmt.executeUpdate();
		response.sendRedirect("resultBoard.jsp?msg=2");
		}else{
			response.sendRedirect("resultBoard.jsp?msg=3");
		}
	}
}catch(Exception e){
	System.out.println("연결 오류");
	e.printStackTrace();
}
%>

</body>
</html>