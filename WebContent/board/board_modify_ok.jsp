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
		if (bdto.getWriter().trim() == "") {
			response.sendRedirect("board.jsp");
		}
		
		int res = bdao.updateBoard(bdto);
		String alert = null;
		String url = "board_view.jsp?num=" + bdto.getNum();
		if (res > 0) {
			alert = "게시글 수정이 완료되었습니다.";
		} else {
			alert = "게시글이 수정되지 못했습니다. 다시 시도해주세요.";
		}
	%>
	<script type="text/javascript">
		alert("<%=alert%>")
		location.href = "<%=url%>" 
	</script>
</body>
</html>