<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login 데이터 조회</title>
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
		//3. 연결 설정
		String sql = "select * from login";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		//4. 반환데이터 출력
		while(rs.next()){
			//rs.getString(1);
			out.println(rs.getString("id"));
			out.println(rs.getString("pwd"));
			out.println("<br>");
		}
		
		//연결 해체
		rs.close();
		stmt.close();
		con.close();
	%>
</body>
</html>