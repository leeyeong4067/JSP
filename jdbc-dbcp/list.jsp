<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login 데이터 조회</title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%
		//DBCP로 변경
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jylee");
		Connection con = ds.getConnection();
	
		//3. 연결 설정
		String sql = "select * from login";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
	%>
	<div class="container mt-3">
	<table class = "table">
		<tr>
			<th>id</th>
			<th>pwd</th>
			<th>name</th>
		</tr>
		<tr>
	<%
		//4. 반환데이터 출력
		while(rs.next()){
			//rs.getString(1);
			String id = (rs.getString("id"));
			String pass = (rs.getString("pwd"));
			String name = (rs.getString("name"));
		
	%>		
			<td><a href="updateForm.jsp?id=<%=id %>"><%=id %></a></td>
			<td><%=pass %></td>
			<td><%=name %></td>
		</tr>
	<%
		}
	%>
		</table>
		</div>
	<% 
		//연결 해체
		rs.close();
		stmt.close();
		con.close();
	%>
</body>
</html>