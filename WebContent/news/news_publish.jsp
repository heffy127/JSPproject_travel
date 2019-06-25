<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Formatter"%>
<%@page import="java.util.Calendar"%>
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
	function open_page(url) {
		newPage = window.open(url);
	}
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() { // 실시간 여행 기사 가져오는 코
						$
								.ajax({
									url : 'https://api.rss2json.com/v1/api.json?rss_url=http://www.traveltimes.co.kr/rss/S1N3.xml&api_key=vciu0xm0zzemy9hto9tncbiwdivayevqlxpehdgq&count=9',
									dataType : 'json',
									data : {
										url : 'http://www.traveltimes.co.kr/rss/S1N3.xml', // 원래 url
										api_key : 'vciu0xm0zzemy9hto9tncbiwdivayevqlxpehdgq', // key
										count : 30
									},
									success : function(data) {
										var titleArr = new Array()
										var linkArr = new Array()
										var authorArr = new Array()
										var descArr = new Array()
										var i = 0
										for (var i = 0; i < 9; i++) {// 각각의 entry값을 가져오기
											var title = data.items[i].title
											if (title.length > 40) {
												title = data.items[i].title
														.substring(0, 40)
														+ ' ..'
											}
											var link = data.items[i].link // href 속성 값 가져오기
											link = 'javascript:open_page("'
													+ data.items[i].link + '")'
											var author = data.items[i].author
											var description = data.items[i].description
											if (description.length > 150) {
												description = data.items[i].description
														.substring(0, 150)
														+ ' ..'
											}
											var pubDate = data.items[i].pubDate
											titleArr[i] = title
											linkArr[i] = link
											authorArr[i] = author
											descArr[i] = description
										}
										$("#title1").text(titleArr[0])
										$("#link1").attr("href", linkArr[0])
										$("#author1").text(authorArr[0])
										$("#description1").text(descArr[0])

										$("#title2").text(titleArr[1])
										$("#link2").attr("href", linkArr[1])
										$("#author2").text(authorArr[1])
										$("#description2").text(descArr[1])

										$("#title3").text(titleArr[2])
										$("#link3").attr("href", linkArr[2])
										$("#author3").text(authorArr[2])
										$("#description3").text(descArr[2])

										$("#title4").text(titleArr[3])
										$("#link4").attr("href", linkArr[3])
										$("#author4").text(authorArr[3])
										$("#description4").text(descArr[3])

										$("#title5").text(titleArr[4])
										$("#link5").attr("href", linkArr[4])
										$("#author5").text(authorArr[4])
										$("#description5").text(descArr[4])

										$("#title6").text(titleArr[5])
										$("#link6").attr("href", linkArr[5])
										$("#author6").text(authorArr[5])
										$("#description6").text(descArr[5])

										$("#title7").text(titleArr[6])
										$("#link7").attr("href", linkArr[6])
										$("#author7").text(authorArr[6])
										$("#description7").text(descArr[6])

										$("#title8").text(titleArr[7])
										$("#link8").attr("href", linkArr[7])
										$("#author8").text(authorArr[7])
										$("#description8").text(descArr[7])

										$("#title9").text(titleArr[8])
										$("#link9").attr("href", linkArr[8])
										$("#author9").text(authorArr[8])
										$("#description9").text(descArr[8])

									}
								})
						$
								.ajax({
									url : 'https://api.rss2json.com/v1/api.json?rss_url=http://www.travie.com/rss/clickTop.xml&api_key=vciu0xm0zzemy9hto9tncbiwdivayevqlxpehdgq&count=1',
									dataType : 'json',
									data : {
										url : 'http://www.travie.com/rss/clickTop.xml', // 원래 url
										api_key : 'vciu0xm0zzemy9hto9tncbiwdivayevqlxpehdgq', // key
										count : 1
									},
									success : function(data_hot) {
										var title_hot = data_hot.items[0].title
										console.log(title_hot)
										if (title_hot.length > 40) {
											title_hot = data_hot.items[0].title
													.substring(0, 40)
													+ ' ..'
										}
										var link_hot = data_hot.items[0].link // href 속성 값 가져오기
										link_hot = 'javascript:open_page("'
												+ data_hot.items[0].link + '")'
										var description_hot = data_hot.items[0].description
										if (description_hot.length > 168) {
											description_hot = data_hot.items[0].description
													.substring(0, 168)
													+ ' ..'
										}
										$("#title_hot").text(title_hot)
										$("#link_hot").attr("href", link_hot)
										$("#description_hot").text(
												description_hot)
									}
								})
					})
</script>
</head>
<body>
	<%
		Calendar now = Calendar.getInstance();
		SimpleDateFormat title_sdf = new SimpleDateFormat("MM월 dd일");
		String titleDate = title_sdf.format(now.getTime()).trim();
	%>
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
								<li class="active"><a href="../main.jsp">Home</a></li>
								<li><a href="../place/place.html">여행지</a></li>
								<li><a href="../course/course.html">코스</a></li>
								<li class="has-dropdown active">
									<a href="../board.jsp">소통광장</a>
									<ul class="dropdown">
										<li><a href="../board/board.jsp">자유게시판</a></li>
										<li><a href="../board_editor/board_editor.jsp">editor's pick</a></li>
									</ul>
								</li>
								<li><a href="news.jsp">뉴스</a>
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
					<li style="background-image: url(../images/news.jpg);">
						<div class="overlay"></div>
						<div class="container-fluid">
							<div class="row">
								<div
									class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
									<div class="slider-text-inner text-center">
										<h2>당신에게 필요한 여행 관련 소식통</h2>
										<h1>News</h1>
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
						<td width="1000" height="800" rowspan="10" valign="top">
							<nav class="navbar navbar-expand-lg navbar-light bg-light">
								<a class="navbar-brand" href="news.jsp">News</a>
								<button class="navbar-toggler" type="button"
									data-toggle="collapse" data-target="#navbarColor01"
									aria-controls="navbarColor01" aria-expanded="false"
									aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>
								<div class="collapse navbar-collapse" id="navbarColor01">
									<ul class="navbar-nav mr-auto">
										<li class="nav-item"><a class="nav-link" href="news.jsp"><font
												size="3">전체기사</font> <span class="sr-only">(current)</span>
										</a></li>
										<li class="nav-item"><a class="nav-link"
											href="news_biz.jsp"><font size="2">여행BIZ</font></a></li>
										<li class="nav-item active"><a class="nav-link"
											href="news_publish.jsp"><font size="2">기획·연재</font></a></li>
										<li class="nav-item"><a class="nav-link"
											href="news_report.jsp"><font size="2">통계·리포트</font></a></li>
									</ul>
									<form class="form-inline my-2 my-lg-0" name="f_search"
										method="get" action="board_search.jsp">
										<table>
											<tr>
												<td><font size="4"><b><%=titleDate%>&nbsp;&nbsp;&nbsp;기획·연재</b></font></td>
											</tr>
										</table>
									</form>
								</div>
							</nav>
							<table border="0">
								<tr valign="top">
									<td width="333px" height="235px" align="center">
										<div class="card border-warning mb-3"
											style="width: 300px; height: 220px;">
											<div class="card-header">
												<span id="author1"></span>
											</div>
											<div class="card-body">
												<a href="" id="link1"><h4 class="card-title" id="title1"
														style="font-weight: bold;"></h4></a>
												<p class="card-text" id="description1"
													style="font-size: small;"></p>
											</div>
										</div>
									</td>
									<td width="333px" height="235px" align="center">
										<div class="card text-white bg-warning mb-3"
											style="width: 300px; height: 220px;">
											<div class="card-header">
												<span id="author2"></span>
											</div>
											<div class="card-body">
												<a href="" id="link2"><h4 class="card-title" id="title2"
														style="font-weight: bold; color: white;"></h4></a>
												<p class="card-text" id="description2"
													style="font-size: small;"></p>
											</div>
										</div>
									</td>
									<td width="334px" height="235px" align="center">
										<div class="card border-warning mb-3"
											style="width: 300px; height: 220px;">
											<div class="card-header">
												<span id="author3"></span>
											</div>
											<div class="card-body">
												<a href="" id="link3"><h4 class="card-title" id="title3"
														style="font-weight: bold;"></h4></a>
												<p class="card-text" id="description3"
													style="font-size: small;"></p>
											</div>
										</div>
									</td>
								</tr>
								<tr valign="top">
									<td width="333px" align="center">
										<div class="card text-white bg-warning mb-3"
											style="width: 300px; height: 220px;">
											<div class="card-header">
												<span id="author4"></span>
											</div>
											<div class="card-body">
												<a href="" id="link4"><h4 class="card-title" id="title4"
														style="font-weight: bold; color: white;"></h4></a>
												<p class="card-text" id="description4"
													style="font-size: small;"></p>
											</div>
										</div>
									</td>
									<td width="333px" height="235px" align="center">
										<div class="card border-warning mb-3"
											style="width: 300px; height: 220px;">
											<div class="card-header">
												<span id="author5"></span>
											</div>
											<div class="card-body">
												<a href="" id="link5"><h4 class="card-title" id="title5"
														style="font-weight: bold;"></h4></a>
												<p class="card-text" id="description5"
													style="font-size: small;"></p>
											</div>
										</div>
									</td>
									<td width="334px" align="center">
										<div class="card text-white bg-warning mb-3"
											style="width: 300px; height: 220px;">
											<div class="card-header">
												<span id="author6"></span>
											</div>
											<div class="card-body">
												<a href="" id="link6"><h4 class="card-title" id="title6"
														style="font-weight: bold; color: white;"></h4></a>
												<p class="card-text" id="description6"
													style="font-size: small;"></p>
											</div>
										</div>
									</td>
								</tr>
								<tr valign="top">
									<td width="333px" height="235px" align="center">
										<div class="card border-warning mb-3"
											style="width: 300px; height: 220px;">
											<div class="card-header">
												<span id="author7"></span>
											</div>
											<div class="card-body">
												<a href="" id="link7"><h4 class="card-title" id="title7"
														style="font-weight: bold;"></h4></a>
												<p class="card-text" id="description7"
													style="font-size: small;"></p>
											</div>
										</div>
									</td>
									<td width="333px" align="center">
										<div class="card text-white bg-warning mb-3"
											style="width: 300px; height: 220px;">
											<div class="card-header">
												<span id="author8"></span>
											</div>
											<div class="card-body">
												<a href="" id="link8"><h4 class="card-title" id="title8"
														style="font-weight: bold; color: white;"></h4></a>
												<p class="card-text" id="description8"
													style="font-size: small;"></p>
											</div>
										</div>
									</td>
									<td width="334px" height="235px" align="center">
										<div class="card border-warning mb-3"
											style="width: 300px; height: 220px;">
											<div class="card-header">
												<span id="author9"></span>
											</div>
											<div class="card-body">
												<a href="" id="link9"><h4 class="card-title" id="title9"
														style="font-weight: bold;"></h4></a>
												<p class="card-text" id="description9"
													style="font-size: small;"></p>
											</div>
										</div>
									</td>
								</tr>
							</table>

							<div align="right">
								<button type="button" class="btn btn-secondary"
									onclick='javascript:open_page("http://www.traveltimes.co.kr/news/articleList.html?sc_section_code=S1N3&view_type=sm")'>더보기</button>
							</div>
						</td>
					</tr>

					<tr>
						<td width="250" align="center" valign="top" height="300">
							<div class="card text-white bg-dark mb-3"
								style="width: 230px; height: 300px;">
								<div class="card-header">
									<font size="4" color="white">◇ &nbsp;최신 인기 뉴스&nbsp; ◇</font>
								</div>
								<div class="card-body">
									<a href="" id="link_hot">
										<h4 class="card-title" id="title_hot"
											style="font-weight: bold; color: white;"></h4>
									</a>
									<p class="card-text" id="description_hot"
										style="font-size: small;"></p>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td align="center" height="160" valign="top"><a
							href='../board/board.jsp'><img src="../images/free.jpg"></s></td>
					</tr>
					<tr>
						<td align="center" height="170" valign="top"><a
							href='../board_editor/board_editor.jsp'><img
								src="../images/editor.png"></a></td>
					</tr>
					<tr>
						<td align="center" height="170" valign="top"><a
							href='news.jsp'><img src="../images/news2.jpg"></a></td>
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

