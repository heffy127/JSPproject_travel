<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="cdto" class="board.BoardCommentDTO"/>
	<jsp:setProperty property="*" name="cdto"/>
	<jsp:useBean id="cdao" class="board.BoardCommentDAO"/>
	<%
	if (cdto.getWriter().trim() == "") {	// 작성자가 없는 경우 게시판으로 되돌아가기
		response.sendRedirect("board_view.jsp?num=" + cdto.getBoard_num());
	}
	int res = cdao.insertCommentCnt(cdto);
	String alert = null;
	String url = null;
	if (res > 0) {
		alert = "댓글 등록이 완료되었습니다.";
		url = "board_view.jsp?num=" + cdto.getBoard_num();
	} else {
		alert = "댓글이 등록되지 못했습니다. 다시 시도해주세요.";
		url = "board_view.jsp?num=" + cdto.getBoard_num();
	}
	%>
	<script type="text/javascript">
		alert("<%=alert%>")
		location.href = "<%=url%>" 
	</script>
</body>
</html>