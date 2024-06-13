<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<jsp:include page="menu.jsp" />
<%@ include file="dbconn.jsp" %>
<div class="p-3 mb-2 bg-dark-subtle text-dark-emphasis display-3 text-center">
		<h1 class="display-6">게시판</h1>
	</div>
	<div class="container">
		<div class="row" align="center">
<%
	PreparedStatement pstmt=null;
	String sql="";
	ResultSet rs=null;
	String rst="";
	String msg="";
	int num=Integer.parseInt(request.getParameter("num"));
	try{
		sql="select * from board24 where num=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,num);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String id=rs.getString(2);
			String name=rs.getString(3);
			String subject=rs.getString(5);
			String content=rs.getString(6);
			String regi_day=rs.getString(7);
			int hit=rs.getInt(8);
			hit++;
		%>
<div style="padding-top:50px">
<table class="table table-hover">
	
	<tr>
		<td class="col1">글번호</td>
		<td class="col2"><input type="hidden" name="id" value="<%=id %>"><%=num %></td>
	</tr>
	<tr>
		<td class="col1">조회수</td>
		<td class="col2"><%=hit %></td>
	</tr>
	<tr>
		<td class="col1">이름</td>
		<td class="col2"><%=name %></td>
	</tr>
	<tr>
		<td class="col1">작성일</td>
		<td class="col2"><%=regi_day %></td>
	</tr>
	<tr>
		<td class="col1">제목</td>
		<td class="col2"><%=subject %></td>
	</tr>
	<tr height="200">
		<td rowspan="5" colspan="2" class="col2"><%=content %></td>
	</tr>
</table>
	</div>
	</div>
	<div class="form-group row">
		 	<div class="col-sm-offset-2 col-sm-10">
		 		<a href="boardUpdate.jsp?num=<%=num %>" class="btn btn-success">수정</a>
				<a href="list.jsp" class="btn btn-primary">목록</a>
		 	</div>
		</div>
<%
	sql="update board24 set hit=? where num=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,hit);
	pstmt.setInt(2,num);
	pstmt.executeUpdate();
		}
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>	
</div>

<%@ include file="footer.jsp" %>
</body>
</html>