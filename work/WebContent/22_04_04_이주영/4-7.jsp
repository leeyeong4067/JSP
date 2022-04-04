<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String[] lang = request.getParameterValues("lang");
		String adress = request.getParameter("adress");
	
	%>
	
	아이디 : <%=id %><br>
	암호 : <%=pw %><br>
	이름 : <%=name %><br>
	관심언어 : <%
				for(int i=0; i<lang.length; i++){
					out.println(lang[i]);
				}
			 %><br>
	주소지 : <%=adress %><br>
	
</body>
</html>