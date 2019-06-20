<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:useBean id="bdao" class="board.BoardDAO" />
<jsp:useBean id="gdto" class="board.BoardGoodDTO" />
<jsp:useBean id="gdao" class="board.BoardGoodDAO" />
<%
	String getNum = request.getParameter("num");
	int num = Integer.parseInt(getNum);

	String user = (String) session.getAttribute("id");
	String message = null;
	if (user == null) {
		out.write("로그인이 필요한 서비스입니다.");
	} else {

		// 세션이 유지되고 있는 회원과 글 번호를 인자로 넘겨줌
		// board_good 테이블에 잘 삽입되면 chk에 0보다 큰값이 들어갈것
		// 잘 들어간다면 해당 회원은 이 글에 추천한적 없음
		// 들어가지 않는다면 해당 테이블에 회원id와 글번호가 있다는 것으로
		// 이미 이 글에 추천한 사람임
		int chk = gdao.insertBoardGood(user, num);
		if (chk == 0) {
			out.write("이미 추천하셨습니다.");
		} else {
			int res = bdao.plusGood(num);
			if (res > 0) {
				out.write("작성자에게 힘이 되는 추천! 감사합니다.");
			} else {
				out.write("추천이 정상적으로 이루어지지 않았습니다. 다시 확인해주세요.");
			}
		}
	}
%>
