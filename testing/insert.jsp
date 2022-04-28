<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<form action="insertPro.jsp" method="post">
		<select name = "bTag">
			<option>선택</option>
			<option>자유게시판</option>
			<option>후기게시판</option>
			<option>질문게시판</option>
		</select><br>
		<input type = "text" name = "bTitle" value = "제목"><br>
		<textarea name = "bString" cols='100' rows='15'>내용</textarea><br>
		<input type = "submit" value = "작성">
		
	</form>
</body>
</html>