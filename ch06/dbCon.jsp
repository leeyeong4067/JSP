<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DB 연동</title>
</head>
<body>
	<%
		//1. JDBC드라이버를 로드
		Class.forName("org.mariadb.jdbc.Driver");
		//2. 연결통로(connection) 얻기
		String url = "jdbc:mariadb://localhost:3306/juyeongdb";
		String user = "juyeong";
		String pwd = "1111";
		
		Connection con = DriverManager.getConnection(url, user, pwd);
		//3. DB 연결
		Statement stmt = con.createStatement();
		out.println("연결 성공");
		
		//4. 연결 해체
		stmt.close();
		con.close();
	%>
</body>
</html>