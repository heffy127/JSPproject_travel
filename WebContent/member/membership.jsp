<%@page import="member.membershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
		<jsp:useBean id="dto" class="member.membershipDTO"></jsp:useBean>
		<jsp:setProperty property="*" name="dto"/>
		<body>
		
		<%
			membershipDAO dao = new membershipDAO();
			dao.insert(dto); 
		%>
		<script type="text/javascript">
		location.href = "loginPage.jsp"
		</script>
		</body>
</html>