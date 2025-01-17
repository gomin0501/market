<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="p-3 mb-2 bg-dark-subtle text-dark-emphasis display-3 text-left">
		<h1 class="display-6">게시판</h1>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
		
		<%
			String sessionId=(String) session.getAttribute("sessionId");
			String sessionName=(String) session.getAttribute("sessionName");
			
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int cnt=0;
		try{
			String sql="select count(*) from board24";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				cnt=rs.getInt(1);
			}
		%>
		<form action="boardProcess.jsp" method="post">
			<div>
				<div class="text-right">
					<span class="badge badge-success">전체 <%=cnt %> 건 </span>
				</div>
			</div>
			
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<%
						//페이지 변화에 대응하기 위한 게시판 조회
						sql="select * from board24";
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						
						while(rs.next()){
							int idx=rs.getInt(1);
							String name=rs.getString(3);
							String subject=rs.getString(5);
							String reg_time=rs.getString(7);
							int hit=rs.getInt(8);
						
					%>
					<tr>
						<td><%=idx %></td>
						<td><a href="view.jsp?num=<%=idx %>"><%=subject %></a> </td>
						<td><%=reg_time %></td>
						<td><%=hit %></td>
						<td><%=name %></td>
					</tr>
				<%
						}
		}catch(Exception e){
			System.out.println("연결 오류");
			e.printStackTrace();
		}
				%>
				</table>
			</div>
			<div align="left">
				<table class="table table-hover">
					<tr>
					<td width="90%" align="left" colspan="4">
						<select name="items" class="txt">
							<option value="subject">제목에서</option>
							<option value="content">본문에서</option>
							<option value="name">글쓴이에서</option>
						</select>
						<input name="text" type="text">
						<input type="submit" id="btnAdd" class="btn btn-primary" value="검색">
					</td>
					<td width="100%" align="right">
						<a class="btn btn-primary" href="#" role="button" onclick="checkForm(); return false;">
						글쓰기</a>
					</td>						
					</tr>
				</table>
			</div>
		</form>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
<script>function checkForm(){   
	location.href="addBoard.jsp"
}
</script>
</html>