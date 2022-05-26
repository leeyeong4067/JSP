<%@page import="cs.dit.loginDto"%>
<%@page import="cs.dit.loginDao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
    <%
    	request.setCharacterEncoding("UTF-8");
    	//클라이언트에서 전달된 데이터
    	String id = request.getParameter("id");
    	String pwd = request.getParameter("pwd");
    	String name = request.getParameter("name");
		
		loginDao dao = new loginDao();
		loginDto dto = new loginDto(name, id, pwd);
		dao.insert(dto);
		
		
		response.sendRedirect("list.jsp");
	%>
