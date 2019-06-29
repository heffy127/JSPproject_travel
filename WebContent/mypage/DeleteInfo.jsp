<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:useBean id="dto" class="member.membershipDTO"></jsp:useBean>
<jsp:useBean id="dao" class="member.membershipDAO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
</head>
<body>

	<%
		String sessionId = (String)session.getAttribute("sessionId");
		dao.DeleteInfo(sessionId);
		session.invalidate();
	%>

	<script type="text/javascript">
		alert("삭제가 완료되었습니다..");
		location.href="../main/main.jsp";
	</script>
</body>
</html>