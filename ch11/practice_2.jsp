<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String list[] = {"moon", "sun", "jupiter", "mars", "venus", "mercury"};
	pageContext.setAttribute("list", list);
	
	Cookie cookie = new Cookie("v", "Happy");
	response.addCookie(cookie);
	
	session.setAttribute("a", "happy Day");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	쿠키  : ${cookie.v.value}<br>
	세션  : ${sessionScope.a}님 반감습니다.<br>
	${list[3]}<br>
	
</body>
</html>