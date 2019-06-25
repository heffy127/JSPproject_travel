<%@page import="board.BoardCommentDTO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>즐거운 여행 HT와 함께</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link
	href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="../css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="../css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="../css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="../css/magnific-popup.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="../css/flexslider.css">

<!-- Owl Carousel -->
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">

<!-- Date Picker -->
<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="../css/style.css">

<!-- 게시판 부트스트랩 -->
<link rel="stylesheet" href="../css/bootstrap_board.min.css">

<!-- Modernizr JS -->
<script src="../js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->


<script type="text/javascript">
	function logout() {
		document.f_logout.submit()
	}
</script>
</head>

<body>
	<jsp:useBean id="bdto" class="board.BoardDTO" />
	<jsp:useBean id="bdao" class="board.BoardDAO" />
	<jsp:useBean id="cdto" class="board.BoardCommentDTO" />
	<jsp:useBean id="cdao" class="board.BoardCommentDAO" />
	<%
		String getNum = request.getParameter("num");
		int num = Integer.parseInt(getNum);
		bdto = bdao.selectSubject("조회수 증가용", num); /* 첫번째 인자는 제목을 눌러서 들어왔을때만 조회수 증가용 */
	%>
	<script type="text/javascript">
		var ss = '<%=(String) session.getAttribute("id")%>'

		function check_session() {
			if (ss == "null") {
				alert("로그인이 필요한 서비스입니다.")
				return false
			}
			if (f_comment.content.value.trim() == "") {
				alert("내용을 입력해주세요.")
				f_comment.content.focus()
				return false
			}
			document.f_comment.submit()
		}

	</script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function () {
			$("#goodButton").click(function () {
				var current_good = parseInt($("#goodPlace").text())
				var d = $("#f").serialize(); // ajax로 form내용 한번에 전달
				$.ajax({
					url : "board_good_ok.jsp?num=<%=bdto.getNum()%>",
					data : d,
					success : function(result){
						var data = result.trim()
						alert(data)
						if(data == "작성자에게 힘이 되는 추천! 감사합니다."){
							$("#goodPlace").text(current_good+1)
						}
					}
				})
			})
		})
	</script>
	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-2">
							<div id="colorlib-logo">
								<table>
									<tr>
										<td><a href="../main/main.jsp">HT</a></td>
										<%
											if (session.getAttribute("sessionName") != null) {
										%>
										<td><font size="2" color="#f0ffed">&nbsp;&nbsp;&nbsp;&nbsp;${sessionName }님</font>&nbsp;</td>
										<td>
										<form action="../main/logout_ok.jsp" name="f_logout">
										<input type="hidden" value="<%=request.getRequestURL()%>" name="url">
										<a href="javascript::" onclick="logout()"><font size="1" color="yellow">로그아웃</font></a>
										</form>
										</td>
										<%
											}
										%>
									</tr>
								</table>
							</div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
								<li><a href="../main/main.jsp">Home</a></li>
								<li><a href="../place/place.jsp">여행지</a></li>
								<li><a href="../course/course.jsp">코스</a></li>
								<li class="has-dropdown active">
									<a href="board.jsp">소통광장</a>
									<ul class="dropdown">
										<li><a href="board.jsp">자유게시판</a></li>
										<li><a href="../board_editor/board_editor.jsp">editor's pick</a></li>
									</ul>
								</li>
								<li><a href="../news/news.jsp">뉴스</a>
								<li><a href="../mypage/mypage.jsp">MyPage</a></li>
								<li><a href="../contact/contact.jsp">고객의 소리</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
					<li style="background-image: url(../images/main_3.jpg);">
						<div class="overlay"></div>
						<div class="container-fluid">
							<div class="row">
								<div
									class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
									<div class="slider-text-inner text-center">
										<h2>HT 회원들의 커뮤니티</h2>
										<h1>소통광장</h1>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</aside>

		<div id="colorlib-blog">
			<div class="div_board" align="center">
				<table border="0">
					<tr>
						<td width="1250">
							<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
								<a class="navbar-brand" href="board.jsp">자유게시판</a>
								<button class="navbar-toggler" type="button"
									data-toggle="collapse" data-target="#navbarColor01"
									aria-controls="navbarColor01" aria-expanded="false"
									aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>

								<div class="collapse navbar-collapse" id="navbarColor01">
									<ul class="navbar-nav mr-auto">
										<li class="nav-item active"><a class="nav-link"
											href="board.jsp"> <font size="3">전체</font> <span
												class="sr-only">(current)</span>
										</a></li>
										<li class="nav-item"><a class="nav-link"
											href="boardLife.jsp"> <font size="2">일상</font>
										</a></li>
										<li class="nav-item"><a class="nav-link"
											href="boardRecommend.jsp"> <font size="2">추천</font>
										</a></li>
										<li class="nav-item"><a class="nav-link"
											href="boardQuestion.jsp"> <font size="2">질문</font>
										</a></li>
									</ul>
									<form class="form-inline my-2 my-lg-0" name="f_search"
										method="get" action="board_search.jsp">
										<table>
											<tr>
												<td width="20">
													<div class="form-group">
														<select class="custom-select" name="select">
															<option selected="" value="subject">제목</option>
															<option value="writer">글쓴이</option>
														</select>
													</div>
												</td>
												<td>&nbsp;&nbsp;</td>
												<td><input class="form-control mr-sm-2" type="text"
													placeholder="전체 검색" name="keyword">
													<button class="btn btn-secondary my-2 my-sm-0"
														type="submit">Search</button></td>
											</tr>
										</table>
									</form>
								</div>
							</nav>
							<div align="center">
								<form name="f" id="f" method="get">
									<table border="0" width="93%">
										<!-- 글 보기 -->
										<tr>
											<td width="74%"><font size="6"><b><%=bdto.getSubject()%></b></font><br>
											</td>
											<td align="center"><font size="5" color="gray"><b><%=bdto.getWriter()%></b></font><br>
											</td>
										</tr>
										<tr>
											<td><font size="2"><b>글번호</b>&nbsp;&nbsp;&nbsp;&nbsp;</font>
												<font size="2" color="gray"><%=bdto.getNum()%>
													&nbsp;&nbsp;| &nbsp;&nbsp;<%=bdto.getReg_date()%></font></td>
											<td align="center">추천 &nbsp; <font size="2"
												color="gray"><b id="goodPlace"><%=bdto.getGood()%></b></font>
												&nbsp;&nbsp;&nbsp; 조회 &nbsp; <font size="2" color="gray">
													<b><%=bdto.getReadcount()%></b>
											</font>
											</td>
										</tr>
										<tr>
											<td colspan="2"><br>
												<div
													style="background-color: #f7f4f4; font-size: 14px; margin-top: 10px;"
													align="center">
													<table border="0">
														<tr>
															<td width="850" height="200" valign="top"><font
																size="5"><%=bdto.getContent()%></font></td>
														</tr>
													</table>
												</div></td>
										</tr>
										<tr>
											<td><br></td>
										</tr>
										<tr>
											<td>
												<div align="left">
													<font size="2" color="#25774d">이 글이 마음에
														들었다면&nbsp;&nbsp;</font>
													<button type="button" class="btn btn-success"
														id="goodButton">추천</button>
												</div>
											</td>
											<td>
												<div align="right">
													<script type="text/javascript">
														var ss = '<%=(String) session.getAttribute("id")%>'
														var writer = '<%=bdto.getWriter()%>'

														function delete_confirm() {

															if (ss != writer) {
																alert("본인 계정으로 작성한 글만 삭제가 가능합니다.")
																return false;  
															}

															var cf = confirm("게시글을 정말 삭제하시겠습니까?")
															if (cf) {
																location.href = "board_delete_ok.jsp?num=<%=bdto.getNum()%>"
															} else {
																return false;
															}
														}

														function modify() {

															if (ss != writer) {
																alert("본인 계정으로 작성한 글만 수정이 가능합니다.")
																return false;
															}

															location.href = "board_modify.jsp?num=<%=bdto.getNum()%>"
														}
													</script>
													<button type="button" class="btn btn-outline-warning"
														onclick="modify()">수정하기</button>
													<button type="button" class="btn btn-outline-danger"
														onclick="delete_confirm()">삭제하기</button>
													<button type="button" class="btn btn-outline-info"
														onclick="window.location='board.jsp'">목록으로</button>

												</div>
											</td>
										</tr>
									</table>
								</form>
							</div>
							<hr width="1250">
						</td>
					</tr>
					<tr>
						<!-- 댓글 보여질 곳 -->
						<td align="center"><br>
							<div style="width: 1000px;">
								<table class="table table-hover">
									<tbody>
										<%
											ArrayList<BoardCommentDTO> list = cdao.listComment(bdto.getNum());
											int cnt = 0;
											if (list.size() == 0) {
										%>
										<tr class="table-warning">
											<td colspan="5" align="center">
												<h5>등록된 댓글이 없습니다.</h5>
											</td>
										</tr>
										<%
											} else {
												for (BoardCommentDTO d : list) {
													if (d.getWriter() == null) { // writer에 null값이 들어간 경우 나타나는 댓글
										%>
										<tr class="table-dark">
											<td colspan="5" align="center">
												<h5>삭제된 댓글입니다.</h5>
											</td>
										</tr>
										<%
											} else { // 값이 온전한 경우 나타나는 댓글
										%>
										<tr class="table-light">
											<td align="center" width="5%">
												<h5><%=++cnt%></h5>
											</td>
											<td align="center" width="15%">
												<h5>
													<b><%=d.getWriter()%></b>
												</h5>
											</td>
											<td align="center">
											<%if(bdto.getWriter().equals(d.getWriter())) {%>
												<h5><font color="orange"><%=d.getContent()%></font></h5>
											<%} else {%>
												<h5><%=d.getContent()%></h5>
												<%} %>
											</td>
											<td align="center" width="15%">
												<h5><%=d.getReg_date()%></h5>
											</td>
											<td align="center" width="5%">
												<button type="button" class="btn btn-link"
													onclick="window.location='board_comment_delete_ok.jsp?comment_num=<%=d.getComment_num()%>&board_num=<%=d.getBoard_num()%>&writer=<%=d.getWriter()%>'">삭제</button>

											</td>
										</tr>
										<%
											}
												}
											}
										%>
									</tbody>
								</table>
							</div></td>
					</tr>
					<tr>
						<td align="center">
							<form action="board_comment_insert_ok.jsp" name="f_comment">
								<!-- 댓글 등록하기 위해 서버로 값 전달 -->
								<div class="form-group" style="width: 1000px;">
									<textarea class="form-control" id="exampleTextarea" rows="3"
										placeholder="댓글은 자신을 나타내는 얼굴입니다." name="content"></textarea>
								</div>
								<div style="width: 1000px;" align="right">
									<button type="button" class="btn btn-primary btn-sm"
										onclick="check_session()">댓글등록</button>
									<input type="hidden" name="board_num"
										value="<%=bdto.getNum()%>"> <input type="hidden"
										name="writer" value=<%=(String) session.getAttribute("id")%>>
								</div>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<footer id="colorlib-footer" role="contentinfo">
		<div class="container">
			<div class="row row-pb-md">
				<div class="col-md-3 colorlib-widget">
					<h4>Tour Agency</h4>
					<p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia
						reprehenderit. Eos cumque dicta adipisci architecto culpa amet.</p>
					<p>
					<ul class="colorlib-social-icons">
						<li><a href="#"><i class="icon-twitter"></i></a></li>
						<li><a href="#"><i class="icon-facebook"></i></a></li>
						<li><a href="#"><i class="icon-linkedin"></i></a></li>
						<li><a href="#"><i class="icon-dribbble"></i></a></li>
					</ul>
					</p>
				</div>
				<div class="col-md-2 colorlib-widget">
					<h4>Book Now</h4>
					<p>
					<ul class="colorlib-footer-links">
						<li><a href="#">Flight</a></li>
						<li><a href="#">Hotels</a></li>
						<li><a href="#">Tour</a></li>
						<li><a href="#">Car Rent</a></li>
						<li><a href="#">Beach &amp; Resorts</a></li>
						<li><a href="#">Cruises</a></li>
					</ul>
					</p>
				</div>
				<div class="col-md-2 colorlib-widget">
					<h4>Top Deals</h4>
					<p>
					<ul class="colorlib-footer-links">
						<li><a href="#">Edina Hotel</a></li>
						<li><a href="#">Quality Suites</a></li>
						<li><a href="#">The Hotel Zephyr</a></li>
						<li><a href="#">Da Vinci Villa</a></li>
						<li><a href="#">Hotel Epikk</a></li>
					</ul>
					</p>
				</div>
				<div class="col-md-2">
					<h4>Blog Post</h4>
					<ul class="colorlib-footer-links">
						<li><a href="#">The Ultimate Packing List For Female
								Travelers</a></li>
						<li><a href="#">How These 5 People Found The Path to
								Their Dream Trip</a></li>
						<li><a href="#">A Definitive Guide to the Best Dining and
								Drinking Venues in the City</a></li>
					</ul>
				</div>

				<div class="col-md-3 col-md-push-1">
					<h4>Contact Information</h4>
					<ul class="colorlib-footer-links">
						<li>291 South 21th Street, <br> Suite 721 New York NY
							10016
						</li>
						<li><a href="tel://1234567920">+ 1235 2355 98</a></li>
						<li><a href="mailto:info@yoursite.com">info@yoursite.com</a></li>
						<li><a href="#">yoursite.com</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart2" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</span> <span class="block">Demo Images: <a
							href="http://unsplash.co/" target="_blank">Unsplash</a> , <a
							href="http://pexels.com/" target="_blank">Pexels.com</a></span>
					</p>





				</div>
			</div>
		</div>
	</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>

	<!-- jQuery -->
	<script src="../js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="../js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="../js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="../js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="../js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="../js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="../js/jquery.stellar.min.js"></script>

	<!-- Main -->
	<script src="../js/main.js"></script>

</body>

</html>
