<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/jylee");
	Connection con = ds.getConnection();
	
	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "INSERT INTO LOGIN(id,email,name,pwd) VALUES(?,?,?,?)";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, email);
	pstmt.setString(3, name);
	pstmt.setString(4, pwd);
	
	//4. SQL 실행
	int i = pstmt.executeUpdate();
	
	//5. 객체 해제
	pstmt.close();
	con.close();
	
	response.sendRedirect("accountList.jsp");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
</body>
</html>