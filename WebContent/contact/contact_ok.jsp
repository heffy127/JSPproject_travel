<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class="contact.ContactDTO"></jsp:useBean>
	<jsp:useBean id="service" class="contact.ContactService"></jsp:useBean>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		dto.setName(name);
		dto.setCategory(category);
		dto.setEmail(email);
		dto.setSubject(subject);
		dto.setMessage(message);
		// 이메일 전송

		try {
			service.mailSender(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//

	%>
<script type="text/javascript">
	alert("고객님의 소중한 의견이 전달되었습니다.")
	location.href="contact.jsp"
</script>

</body>
</html>