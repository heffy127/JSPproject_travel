<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bdto" class="board_editor.BoardEditorDTO" />
	<jsp:useBean id="bdao" class="board_editor.BoardEditorDAO" />
	<jsp:setProperty property="*" name="bdto" />
	<%
	 	String getNum = request.getParameter("num");
		int num = Integer.parseInt(getNum);
		bdto = bdao.selectSubject(null, num);
		String alert = null, url = null;
		if (bdto.getWriter() == null) {
			alert = "잘못된 접근입니다.";
			url = "board_editor.jsp";
		} else {
			int res = bdao.deleteBoard(bdto.getNum());
			if (res > 0) {
				alert = "게시글 삭제가 완료되었습니다.";
				url = "board_editor.jsp";
			} else {
				alert = "게시글 삭제에 실패했습니다. 다시 확인해주세요.";
				url = "board_editor_view.jsp?num=" + bdto.getNum();
			}
		}
	%>
	<script type="text/javascript">
		alert("<%=alert%>")
		location.href = "<%=url%>"
	</script>

</body>
</html>