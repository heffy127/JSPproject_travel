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

<!-- Flaticons  -->
<link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css">

<!-- Theme style  -->
<link rel="stylesheet" href="../css/style.css">



<!-- Modernizr JS -->
<script src="../js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<div id="fb-root"></div>

<div id="fb-root"></div>

<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.3"></script>
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
									url : 'https://api.rss2json.com/v1/api.json?rss_url=http://www.traveltimes.co.kr/rss/allArticle.xml&api_key=vciu0xm0zzemy9hto9tncbiwdivayevqlxpehdgq&count=30',
									dataType : 'json',
									data : {
										url : 'http://www.traveltimes.co.kr/rss/allArticle.xml', // 원래 url
										api_key : 'vciu0xm0zzemy9hto9tncbiwdivayevqlxpehdgq', // key
										count : 5
									},
									success : function(data) {
										var titleArr = new Array()
										var linkArr = new Array()
										var i = 0
										for (var i = 0; i < 5; i++) {// 각각의 entry값을 가져오기
											var title = data.items[i].title
											if (title.length > 26) {
												title = data.items[i].title
														.substring(0, 26)
														+ ' ..'
											}
											var link = data.items[i].link // href 속성 값 가져오기
											link = 'javascript:open_page("'
													+ data.items[i].link + '")'
											titleArr[i] = title
											linkArr[i] = link
										}
										$("#title1").text(titleArr[0])
										$("#link1").attr("href", linkArr[0])

										$("#title2").text(titleArr[1])
										$("#link2").attr("href", linkArr[1])

										$("#title3").text(titleArr[2])
										$("#link3").attr("href", linkArr[2])

										$("#title4").text(titleArr[3])
										$("#link4").attr("href", linkArr[3])

										$("#title5").text(titleArr[4])
										$("#link5").attr("href", linkArr[4])
									}
								})
					})
</script>
<style type="text/css">
.line {
	border-bottom: 1px solid orange;
}
</style>
</head>
<body>
	<%
		session.setAttribute("id", "editor");
	%>
	<div class="colorlib-loader"></div>
	<div id="page">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-2">
							<div id="colorlib-logo">
								<a href="main.jsp">HT</a>
							</div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
								<li class="active"><a href="main.jsp">Home</a></li>
								<li><a href="../place/place.html">여행지</a></li>
								<li><a href="../course/course.html">코스</a></li>
								<li class="has-dropdown active">
									<a href="../board/board.jsp">소통광장</a>
									<ul class="dropdown">
										<li><a href="../board/board.jsp">자유게시판</a></li>
										<li><a href="../board_editor/board_editor.jsp">editor's pick</a></li>
									</ul>
								</li>
								<li><a href="../news/news.jsp">뉴스</a>
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
					<li style="background-image: url(../images/overlay1.jpg);">
						<div class="overlay"></div>
						<div class="container-fluid">
							<div class="row">
								<div
									class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
									<div class="slider-text-inner text-center">
										<h2>진해 군항제</h2>
										<h1>즐거운 여행 HT와 함께</h1>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li style="background-image: url(../images/overlay2.jpeg);">
						<div class="overlay"></div>
						<div class="container-fluid">
							<div class="row">
								<div
									class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
									<div class="slider-text-inner text-center">
										<h2>서울 종로</h2>
										<h1>즐거운 여행 HT와 함께</h1>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li style="background-image: url(../images/overlay3.jpg);">
						<div class="overlay"></div>
						<div class="container-fluids">
							<div class="row">
								<div
									class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
									<div class="slider-text-inner text-center">
										<h2>부산 해운대</h2>
										<h1>즐거운 여행 HT와 함께</h1>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li style="background-image: url(../images/overlay4.jpg);">
						<div class="overlay"></div>
						<div class="container-fluid">
							<div class="row">
								<div
									class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
									<div class="slider-text-inner text-center">
										<h2>경주 안압지</h2>
										<h1>즐거운 여행 HT와 함께</h1>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</aside>
		<div id="colorlib-reservation">
			<!-- <div class="container"> -->
			<div class="row">
				<div class="search-wrap">
					<div id="cruises" class="tab-pane fade">
						<div class="row">
							<div class="col-md-3">
								<div class="form-group"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<table>
			<tr>
				<td height="20"></td>
			</tr>
		</table>
	</div>
	<div class="f-tour">
		<div class="row">
			<div class="col-md-6 col-md-push-6">
				<div class="row">
					<div class="col-md-6 animate-box">
						<a href="../place/place.html" class="f-tour-img"
							style="background-image: url(../images/main_1.JPG);">
							<div class="desc">
								<h3>여행지</h3>
								<p class="price">
									<span>국내 여행지 총망라</span>
								</p>
							</div>
						</a>
					</div>
					<div class="col-md-6 animate-box">
						<a href="../course/course.html" class="f-tour-img"
							style="background-image: url(../images/main_2.jpg);">
							<div class="desc">
								<h3>코스</h3>
								<p class="price">
									<span>당신을 위한 여행 코스</span>
								</p>
							</div>
						</a>
					</div>
					<div class="col-md-6 animate-box">
						<a href="../board/board.jsp" class="f-tour-img"
							style="background-image: url(../images/main_3.jpg);">
							<div class="desc">
								<h3>소통광장</h3>
								<p class="price">
									<span>HT 회원들의 커뮤니티</span>
								</p>
							</div>
						</a>
					</div>

					<div class="col-md-6 animate-box">
						<a href="../mypage/mypage.html" class="f-tour-img"
							style="background-image: url(../images/main_4.jpg);">
							<div class="desc">
								<h3>마이 페이지</h3>
								<p class="price">
									<span>회원정보 및 즐겨찾기 관리</span>
								</p>
							</div>
						</a>
					</div>
				</div>
			</div>

			<div class="col-md-6 animate-box col-md-pull-6 text-right">
				<div class="desc">
					<div class="row">
						<div class="col-md-13">
							<div class="fb-page" data-tabs="timeline,events,messages"
								data-href="https://www.facebook.com/9suk9suklive"
								data-width="340" data-height="440" data-hide-cover="false"></div>
						</div>

						<div class="col-md-13">
							<table border="0">
								<tr>
									<td height="50" bgcolor="#e8e8e8"><b>Today! 여행뉴스 & 주요날씨</b>&nbsp;&nbsp;&nbsp;<a
										href="../news/news.jsp"><font size="1" color="orange">더보기&nbsp;&nbsp;</font></a></td>
								</tr>
								<tr>
									<td align="left" class="line"><a href="" id="link1"><font
											size="4" color="Black">&nbsp;▶&nbsp;<span id="title1"></span></font></a></td>
								</tr>
								<tr>
									<td align="left" class="line"><a href="" id="link2"><font
											size="4" color="Black">&nbsp;▶&nbsp;<span id="title2"></span></font></a></td>
								</tr>
								<tr>
									<td align="left" class="line"><a href="" id="link3"><font
											size="4" color="Black">&nbsp;▶&nbsp;<span id="title3"></span></font></a></td>
								</tr>
								<tr>
									<td align="left" class="line"><a href="" id="link4"><font
											size="4" color="Black">&nbsp;▶&nbsp;<span id="title4"></span></font></a></td>
								</tr>
								<tr>
									<td align="left" class="line"><a href="" id="link5"><font
											size="4" color="Black">&nbsp;▶&nbsp;<span id="title5"></span></font></a></td>
								</tr>
								<tr>
									<td height="15"></td>
								</tr>
								<tr>
									<td>
									
										<table border="0">
											<tr>
												<td height="73" align="left" bgcolor="#fcfaf2"><div id="openweathermap-widget-19"></div> <script>
													window.myWidgetParam ? window.myWidgetParam
															: window.myWidgetParam = [];
													window.myWidgetParam
															.push({
																id : 19,
																cityid : '1835848',
																appid : '50190dae3014a65e9e9ad3d92c69d424',
																units : 'metric',
																containerid : 'openweathermap-widget-19',
															});
													(function() {
														var script = document
																.createElement('script');
														script.async = true;
														script.charset = "utf-8";
														script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";
														var s = document
																.getElementsByTagName('script')[0];
														s.parentNode
																.insertBefore(
																		script,
																		s);
													})();
												</script></td>
											</tr>
											<tr>
												<td height="73" width="500" align="center" bgcolor="#edebe3"><div id="openweathermap-widget-8"></div> <script>
													window.myWidgetParam ? window.myWidgetParam
															: window.myWidgetParam = [];
													window.myWidgetParam
															.push({
																id : 8,
																cityid : '1835235',
																appid : '50190dae3014a65e9e9ad3d92c69d424',
																units : 'metric',
																containerid : 'openweathermap-widget-8',
															});
													(function() {
														var script = document
																.createElement('script');
														script.async = true;
														script.charset = "utf-8";
														script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";
														var s = document
																.getElementsByTagName('script')[0];
														s.parentNode
																.insertBefore(
																		script,
																		s);
													})();
												</script></td>
											</tr>
											<tr>
												<td height="73" align="right" bgcolor="#e5e3da"><div id="openweathermap-widget-9"></div> <script>
													window.myWidgetParam ? window.myWidgetParam
															: window.myWidgetParam = [];
													window.myWidgetParam
															.push({
																id : 9,
																cityid : '1846266',
																appid : '50190dae3014a65e9e9ad3d92c69d424',
																units : 'metric',
																containerid : 'openweathermap-widget-9',
															});
													(function() {
														var script = document
																.createElement('script');
														script.async = true;
														script.charset = "utf-8";
														script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";
														var s = document
																.getElementsByTagName('script')[0];
														s.parentNode
																.insertBefore(
																		script,
																		s);
													})();
												</script></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<table>
				<tr>
					<td height="50"></td>
				</tr>
			</table>
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



	<!-- Stellar Parallax -->

	<script src="../js/jquery.stellar.min.js"></script>

	<!-- Main -->

	<script src="../js/main.js"></script>



</body>

</html>
