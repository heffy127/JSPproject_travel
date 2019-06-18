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


</head>
<body>
	<jsp:useBean id="bdto" class="board.BoardDTO" />
	<jsp:useBean id="bdao" class="board.BoardDAO" />

	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-2">
							<div id="colorlib-logo">
								<a href="../main/main.jsp">HT</a>
							</div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
								<li><a href="../main/main.jsp">Home</a></li>
								<li><a href="../place/place.html">여행지</a></li>
								<li><a href="../course/course.html">코스</a></li>
								<li class="active"><a href="board.jsp">소통광장</a></li>
								<li><a href="../news/news.html">뉴스</a>
								<li><a href="../mypage/mypage.html">MyPage</a></li>
								<li><a href="../contact/contact.html">고객의 소리</a></li>
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
				<table border="1">
					<tr>
						<td width="1000">
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
										<li class="nav-item"><a class="nav-link" href="board.jsp"><font size="3">전체</font>
												<span class="sr-only">(current)</span>
										</a></li>
										<li class="nav-item"><a class="nav-link" href="boardLife.jsp"><font size="2">일상</font></a>
										</li>
										<li class="nav-item"><a class="nav-link" href="boardRecommend.jsp"><font size="2">추천</font></a>
										</li>
										<li class="nav-item active"><a class="nav-link" href="boardQuestion.jsp"><font size="2">질문</font></a>
										</li>
									</ul>
								<form class="form-inline my-2 my-lg-0" name="f_search" method="get" action="board_search.jsp">
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
												<td>
												&nbsp;&nbsp;
												</td>
												<td><input class="form-control mr-sm-2" type="text"
													placeholder="전체 검색" name="keyword">
													<button class="btn btn-secondary my-2 my-sm-0"
														type="submit">Search</button></td>
											</tr>
										</table>
									</form>
								</div>
							</nav>
							<table class="table table-hover">

									<thead>
									<tr align="center">
										<th scope="col" width="30"><h5>글 번호</h5></th>
										<th scope="col" width="40"><h5>말머리</h5></th>
										<th scope="col" width="130"><h5>제목</h5></th>
										<th scope="col" width="40"><h5>글쓴이</h5></th>
										<th scope="col" width="10"><h5>조회수</h5></th>
										<th scope="col" width="10"><h5>추천수</h5></th>
										<th scope="col" width="60"><h5>작성일</h5></th>
									</tr>
								</thead>
								<tbody>
									<%
										ArrayList<BoardDTO> list = bdao.listBoard_quest();
										if (list.size() == 0) {
									%>
									<tr class="table-warning">
										<td colspan="7" align="center"><h4>등록된 글이 없습니다.</h4></td>
									</tr>
									<%
										} else {
											for (BoardDTO d : list) {
									%>
									<tr class="table-light">
										<td align="center"><h4><%=d.getNum()%></h4></td>
										<td align="center"><h4><%=d.getPreface()%></h4></td>
										<td><a href="board_view.jsp?num=<%=d.getNum()%>"><h4><%=d.getSubject()%></h4></a></td>
										<td align="center"><h4><%=d.getWriter()%></h4></td>
										<td align="center"><h4><%=d.getReadcount()%></h4></td>
										<td align="center"><h4><%=d.getGood()%></h4></td>
										<td align="center"><h4><%=d.getReg_date()%></h4></td>
									</tr>
									<%
										}
										}
									%>

								</tbody>
							</table>
							<div align="right">
								<button type="button" class="btn btn-secondary"
									onclick="window.location='board_write.jsp'">글쓰기</button>
							</div>
						</td>
						<td width="250" align="center">게시판 버튼 들어갈곳</td>
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

