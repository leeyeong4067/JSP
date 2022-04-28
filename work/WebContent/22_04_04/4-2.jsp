<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>성적 구하기</title>
</head>
<body>
	<%
		//int kor = Integer.parseInt(request.getParameter("kor"));
		float korf = Float.parseFloat(request.getParameter("kor"));
		//int eng = Integer.parseInt(request.getParameter("eng"));
		float engf = Float.parseFloat(request.getParameter("eng"));
		//int math = Integer.parseInt(request.getParameter("math"));
		float mathf = Float.parseFloat(request.getParameter("math"));
		
		//int sum = kor+eng+math;
		float sumf = korf+engf+mathf;
		float average = sumf/3;
		
		out.println("총점 : " +sumf);
		out.println(String.format("평균 : %.2f", average));
	
	%>
</body>
</html>