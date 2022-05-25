<%@page import="cs.dit.loginDao"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	loginDao dao = new loginDao();
	int check = dao.checkUser(id, pwd);
	
	if(check == 1) {
		out.println("Welcome");
		session.setAttribute("id", id);
	} else {
		out.println("Register First");
	}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	반가워요
</body>
</html>