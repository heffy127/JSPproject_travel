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

</head>
<body>
<%
	session.setAttribute("id", "user2");
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
								<li><a href="../board/board.jsp">소통광장</a></li>
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
									<span>지역별 여행 정보</span>
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
							<div class="article bd0">
								<!-- 1002 div.article 추가 -->
								<a href="/notice/news_list.do" class="tit_atc">Today! 여행뉴스<span
									class="btn_more">더보기</span></a>
								<!-- 1205 a 태그로 변경, 더보기 추가 -->
								<ul class="list_board">
									<li><a href="javascript:" onclick="goCuration(1,"
										https://korean.visitkorea.or.kr/notice/news_detail.do?nwsid=a633380f-68ae-4a93-bb53-38bd56587736
										")"

										title="『친환경 여행단』을 모집합니다! 로 이동"><em
											style="color: #62acc9">환경을 생각하는 착한 여행</em>『친환경 여행단』을 모집합니다!</a></li>

									<li><a href="javascript:" onclick="goCuration(1,"
										https://korean.visitkorea.or.kr/notice/news_detail.do?nwsid=ab260a85-b291-48d4-a5e1-f257ff1f1e7a
										")"

										title="배 타고 섬 여행 할 때 필수템 『바다로』 로 이동"><em
											style="color: #62acc9">열정! 바다로!!</em>배 타고 섬 여행 할 때 필수템 『바다로』</a></li>

									<li><a href="javascript:" onclick="goCuration(1,"
										https://korean.visitkorea.or.kr/notice/news_detail.do?nwsid=2f248a2f-41c4-496f-a251-017782db5d66
										")"

										title="" 6.9km="" 보령해저터널"="" 관통된다="" 로=""
										이동"=""><em style="color: #62acc9">충남ㅣ세계에서 다섯번째 길이</em>"6.9km
											보령해저터널" 관통된다</a></li>

									<li><a href="javascript:" onclick="goCuration(1,"
										https://korean.visitkorea.or.kr/notice/news_detail.do?nwsid=65cc1e22-9d10-4e39-a477-a2f1f5d57941
										")"

										title="「광주 FINA 세계수영선수권대회」 개최 로 이동"><em
											style="color: #62acc9">광주ㅣ성큼 다가온</em>「광주 FINA 세계수영선수권대회」 개최</a></li>

									<li><a href="javascript:" onclick="goCuration(1,"
										https://korean.visitkorea.or.kr/notice/news_detail.do?nwsid=65cc1e22-9d10-4e39-a477-a2f1f5d57941
										")"

										title="「광주 FINA 세계수영선수권대회」 개최 로 이동"><em
											style="color: #62acc9">광주ㅣ성큼 다가온</em>「광주 FINA 세계수영선수권대회」 개최</a></li>

								</ul>
							</div>
						</div>
						<div class="col-md-13">
							<h3>날씨정보나 유튜브 영상?</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.
								Separated they live in Bookmarksgrove right at the coast of the
								Semantics, a large language ocean. A small river named Duden
								flows by their place and supplies it with the necessary
								regelialia.</p>
							<br>
						</div>
					</div>
				</div>
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



	<!-- Stellar Parallax -->

	<script src="../js/jquery.stellar.min.js"></script>

	<!-- Main -->

	<script src="../js/main.js"></script>



</body>

</html>