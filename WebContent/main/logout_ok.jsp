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
	String mp = request.getParameter("fromMypage");
	String url = request.getParameter("url");
	if(mp != null){
		url = "../main/main.jsp";
	}
	session.removeAttribute("sessionId");
	session.removeAttribute("sessionName");
	%>
</body>
<script type="text/javascript">
alert('로그아웃 완료')
location.href = '<%=url%>'
</script>
</html>