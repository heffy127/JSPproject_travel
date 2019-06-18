<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bdto" class="board.BoardDTO" />
	<jsp:setProperty property="*" name="bdto" />
	<jsp:useBean id="bdao" class="board.BoardDAO" />
	<%
		if (bdto.getWriter().trim() == "") {	// 작성자가 없는 경우 게시판으로 되돌아가기
			response.sendRedirect("board.jsp");
		}
		int res = bdao.insertBoard(bdto);
		String alert = null;
		String url = null;
		if (res > 0) {
			alert = "게시글이 등록이 완료되었습니다.";
			url = "board.jsp";
		} else {
			alert = "게시글이 등록되지 못했습니다. 다시 시도해주세요.";
			url = "board_write.jsp";
		}
	%>
	<script type="text/javascript">
		alert("<%=alert%>")
		location.href = "<%=url%>" 
	</script>
</body>
</html>