<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.7.1.min.js"></script>
<script>
	function checkForm(){
		if(!document.newUpdate.name.value){
			alert("성명을 입력하세요.");
			return false;
		}
		if(!document.newUpdate.password.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if(!document.newUpdate.subject.value){
			alert("제목을 입력하세요.");
			return false;
		}
		if(!document.newUpdate.content.value){
			alert("내용을 입력하세요.");
			return false;
		}
	}
	function check(){
		if(!document.newUpdate.password.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}
	}
</script>
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
		<%@include file="dbconn.jsp" %>
		<%
			sessionId=(String) session.getAttribute("sessionId");
			sessionName=(String) session.getAttribute("sessionName");
			String num=request.getParameter("num");
			
			try{
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String sql="select * from board24 where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,num);
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					String id=rs.getString("id");
					String name=rs.getString("name");
					String subject=rs.getString("subject");
					String content=rs.getString("content");
					if(!id.equals(sessionId)){
						%>
						<script>
						alert("수정할 수 없습니다.");
						location.href="list.jsp";
						</script>
					<% } %>
		<form name="newUpdate" class="form-horizontal" action="boardUpdateProcess.jsp?num=<%=num %>"
		 method="post">
		 <input name="id" type="hidden" class="form-control" value="<%=sessionId %>">
		 <div class="form-group row">
		 	<label class="col-sm-2 controm-label">성명</label>
		 	<div class="col-sm-3">
		 		<input name="name" type="text" class="form-control" value="<%=name %>">
		 	</div>
		 </div>
		 <div class="form-group row">
		 	<label class="col-sm-2 controm-label">비밀번호</label>
		 	<div class="col-sm-3">
		 		<input name="password" type="password" class="form-control" >
		 	</div>
		 </div>
		 <div class="form-group row">
		 	<label class="col-sm-2 controm-label">제목</label>
		 	<div class="col-sm-3">
		 		<input name="subject" type="text" class="form-control"	value="<%=subject %>">
		 	</div>
		 </div>
		 <div class="form-group row">
		 	<label class="col-sm-2 controm-label">내용</label>
		 	<div class="col-sm-8" style="word-break: break-all;">
		 		<textarea name="content" cols="100" rows="5"><%=content %></textarea>
		 		
		 	</div>
		 </div>
		 <div class="form-group row">
		 	<div class="col-sm-offset-2 col-sm-10">
		 		<a href="boardDelete.jsp?num=<%=num %>" class="btn btn-danger" onclick="if(!confirm('정말로 삭제하겠습니까?')) return false;">
		 		삭제</a>
		 		<input type="submit" class="btn btn-success" value="수정">
				<a href="list.jsp" class="btn btn-primary">목록</a>
		 	</div>
		 </div>
			<%	}
			}catch(Exception e){
				System.out.println("연결 오류");
				e.printStackTrace();
			}
		%>
		 </form> 
		 <hr>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>