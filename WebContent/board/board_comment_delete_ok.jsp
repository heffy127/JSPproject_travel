<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="cdto" class="board.BoardCommentDTO"></jsp:useBean>
	<jsp:useBean id="cdao" class="board.BoardCommentDAO" />
	<jsp:setProperty property="*" name="cdto" />
	<%
		String id = (String) session.getAttribute("id");
		String writer = cdto.getWriter();	
	
		String alert = null, url = null;
		if (cdto.getWriter() == null) {
			alert = "잘못된 접근입니다.";
		} else {
			if(id == null || id.trim().equals("")){
				alert = "로그인이 필요한 서비스입니다.";
			}else if(!(id.equals(writer))){
				alert = "본인 계정으로 작성한 댓글만 삭제가 가능합니다.";
			} else{
				int res = cdao.deleteComment(cdto);
				if (res > 0) {
					alert = "댓글 삭제가 완료되었습니다.";
				} else {
					alert = "댓글 삭제에 실패했습니다. 다시 확인해주세요.";
				}
			}
		}
	%>
	<script type="text/javascript">
		alert("<%=alert%>")
		location.href = "board_view.jsp?num=<%=cdto.getBoard_num()%>"
	</script>

</body>
</html>