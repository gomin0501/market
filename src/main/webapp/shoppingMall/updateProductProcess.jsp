<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@page import = "java.util.*"%>
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

	String filename="";
	String realFolder="C:\\workspace2024\\yangjungMarket\\src\\main\\webapp\\shoppingMall\\upload";
	String encType="utf-8"; //인코딩 타입
	int maxSize=5*1024*1024; //최대 업로드될 파일의 크기5Mb
	System.out.println("real folder:"+realFolder);
	MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
	
	String productId=multi.getParameter("productId");
	String name=multi.getParameter("name");
	String unitPrice=multi.getParameter("unitPrice");
	String description=multi.getParameter("description");
	String manufacturer=multi.getParameter("manufacturer");
	String category=multi.getParameter("category");
	String unitsInstock=multi.getParameter("unitsInstock");
	String condition=multi.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);
	long stock;
	
	if(unitsInstock.isEmpty())
		stock=0;
	else
		stock=Long.valueOf(unitsInstock);
	@SuppressWarnings("rawtypes")
	
	Enumeration files=multi.getFileNames();
	String fname=(String)files.nextElement();
	String fileName=multi.getFilesystemName(fname);
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select * from product24 where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,productId);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName != null){
			sql="update product24 set name=?,unitprice=?,description=?,category=?,manufacturer=?,unitsInstock=?,condition=?,filename=? where productId=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setInt(2,price);
			pstmt.setString(3,description);
			pstmt.setString(4,category);
			pstmt.setString(5,manufacturer);
			pstmt.setLong(6,stock);
			pstmt.setString(7,condition);
			pstmt.setString(8,fileName);
			pstmt.setString(9,productId);
			
			pstmt.executeUpdate();
	
		}else{
			sql="update product24 set name=?,unitprice=?,description=?,category=?,manufacturer=?,unitsInstock=?,condition=? where productId=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setInt(2,price);
			pstmt.setString(3,description);
			pstmt.setString(4,category);
			pstmt.setString(5,manufacturer);
			pstmt.setLong(6,stock);
			pstmt.setString(7,condition);
			pstmt.setString(8,productId);
			
			pstmt.executeUpdate();
		}
	}
	response.sendRedirect("resultProduct.jsp?msg=2");
	
%>
</body>
</html>