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
			int res = dao.insert(dto);
			String alert = "";
			if(res > 0){
				alert = "회원가입이 완료되었습니다.";
			} else {
				alert = "회원가입이 처리되지 못했습니다.";
			}
		%>
		<script type="text/javascript">
		alert('<%=alert%>')
		location.href = "loginPage.jsp"
		</script>
		</body>
</html>