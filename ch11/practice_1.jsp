<%@page import="cs.dit.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	loginDto dto = new loginDto("홍길동", "gildong", "1111");

	pageContext.setAttribute("dto", dto);
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EL 실습</title>
</head>
<body>
	${"반갑습니다!!"}<br>
	${100+1234}<br>
	${100 > 1 }<br>
	
	내장객체(param) : ${param.name}<br>
	empty 연산 : ${empty param.name}<br>
	삼향연산 : ${!empty param.name ? param.name : "매개변수가 비어있어요"}<br>
	
	<hr>
	ID : ${dto.id}<br>
	NAME : ${dto.name}<br>
	PWD : ${dto.pwd}<br>
	
	프로토콜 : ${pageContext.request.protocol}<br>
	서버명 : ${pageContext.request.serverName}<br>
	
	
</body>
</html>