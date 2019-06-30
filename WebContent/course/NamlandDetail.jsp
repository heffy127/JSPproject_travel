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

<!-- Modernizr JS -->
<script src="../js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>
<script type="text/javascript">
	function logout() {
		document.f_logout.submit()
	}
</script>
<body>

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
								<li class="active"><a href="course.jsp">코스</a></li>
								<li class="has-dropdown">
									<a href="../board/board.jsp">소통광장</a>
									<ul class="dropdown">
										<li><a href="../board/board.jsp">자유게시판</a></li>
										<li><a href="../board_editor/board_editor.jsp">editor's pick</a></li>
									</ul>
								</li>
								<li><a href="../news/news.jsp">뉴스</a>
								<%if(session.getAttribute("sessionId") == null){ %>
								<li><a href="../member/loginPage.jsp">Login</a></li>
								<% } else { %>
								<li><a href="../mypage/mypage.jsp">MyPage</a></li>
								<%}; %>
								<li><a href="../contact/contact.jsp">고객의 소리</a></li>
							</ul>						</div>
					</div>
				</div>
			</div>
		</nav>
		<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
					<li style="background-image: url(../images/main_2.jpg);">
						<div class="overlay"></div>
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
									<div class="slider-text-inner text-center">
										<h2>당신을 위한 여행 코스</h2>
										<h1>여행 코스</h1>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</aside>

		<div id="colorlib-services">
			<div class="container">
				<table width="1200px" height="50px" align="center" border="0" style="border-collapse:collapse";>
					<tr>
						<td style="width : 200px; font-size: 50px; font-weight: bold; padding-top: 10%; color: #fce247;">남이섬</td>
					</tr>
					<tr>
						<td><div id = "sub_title">&nbsp;강원도 춘천시</div></td>
					</tr>
					<tr>
						<td style="padding-top:2%; color: black;" align="top">
							남이섬은 강원도 춘천시 남산면 방하리에 있는 섬이다. 남이 장군의 묘역이 있는 문화유적지이자 관광휴양지로 개발된 곳으로서 
							2016년 현재 세계 122개국으로부터 130만명의 외국인관광객을 포함, 연간 총 330만명이 찾는 대한민국의 대표적인 관광지이다
						</td>
						<td width="200px;" height="200px;" align="center">
							<img src="../course/image/NamlandInfo.jpg" width="350px;" height="200px;">
						</td>
					</tr>	
									
				</table>
				<table width="1200px" height="600px" align="center" border="0" style="border-collapse:collapse; margin-top: 5%;">
					<tr>
						<td width="200px" height="150px" align="center">
							<div class="img">
								<img src="../course/image/WinterDrama.jpg" width="200px;" height="150px;" >
							</div>
						</td>
						<td>
							<span style="font-size: 20px; font-weight: bold; color: #fce247;">&nbsp;&nbsp;겨울연가 첫키스 촬영장소</span><br>
							<span>&nbsp;&nbsp;겨울연가에서 준상(배용준)이와 유진(최지우)이가 함께 자전거를 탔던 아름다운 장면을 기억하고 오는 
											사람들이 많은데
							 </span><br>
							 <span>&nbsp;&nbsp;이 곳은 본래 70~80년대에는 대학생들의 MT 장소로, 그리고 강변가요제로 유명한 곳</span><br><br>
							 <span>&nbsp;&nbsp;#여행 #연인 #데이트코스 #힐링 #문화시설</span>
						</td>
					</tr>
					<hr color="black">
					<tr>
						<td width="200px" height="150px" align="center" style="padding-top: 1%;">
							<div class="img">
								<img src="../course/image/buttle.jpg" width="200px;" height="150px;" >
							</div>
						</td>
						<td>
							<span style="font-size: 20px; font-weight: bold; color: #fce247;">&nbsp;&nbsp;병으로 만든 조형물</span><br>
							<span>&nbsp;&nbsp;모든 조형물은 ‘재활용’을 거쳤다 해도 과언이 아니다. 재활용은 남이섬의 원천이자 상징이다. 
										깨진 타일은 불을 밝히는 등대가 되고
							 </span><br>
							 <span>&nbsp;&nbsp;찌그러진 캔은 공연장 벽면이 되었다.가장 대표적인 게 소주병인데,소주병은 때로 타일이 되었다가,식당의 휴지꽂이가 되기도 한다.</span><br><br>
							 <span>&nbsp;&nbsp;#여행 #조형물 #데이트코스 #소주병 #편의점 #쓰레기 #예술 #작품</span>
						</td>
					</tr>
					<tr>
						<td width="200px" height="150px" align="center" style="padding-top: 1%;">
							<div class="img">
								<img src="../course/image/buttyLoad.jpg" width="200px;" height="150px;" >
							</div>
						</td>
						<td>
							<span style="font-size: 20px; font-weight: bold; color: #fce247;">&nbsp;&nbsp;메타쉐콰이어길</span><br>
							<span>&nbsp;&nbsp;남이섬의 대표적인 코스와 동시에 겨울연가 촬영지로 유명한 이곳은 아직까지도 수많은 연인들의
											대표 데이트 코스로 자리잡고 있다.
							 </span><br><br><br>
							 <span>&nbsp;&nbsp;#여행 #남자친구 #여자친구 #데이트코스 #힐링 #관광지 #명소 #힐링</span>
						</td>
					</tr>
					<tr>
						<td width="200px" height="150px" align="center" style="padding-top: 1%;">
							<div class="img">
								<img src="../course/image/glassWater.jpg" width="200px;" height="150px;" >
							</div>
						</td>
						<td>
							<span style="font-size: 20px; font-weight: bold; color: #fce247;">&nbsp;&nbsp;유리분수</span><br>
							<span>&nbsp;&nbsp;남이섬 창조 프로젝트의 상징이다. 압축 소주병을 쌓은 기단 위에 세로 2.5m, 가로 1.1m 크기의 강화유리를 겹겹이 세우고 그 위에 
							 </span><br>
							 <span>&nbsp;&nbsp;다시 15장의 강화유리를 덮었다. 삼성증권이 지난해 서울 종로2가 본사를 태평로로 이전하면서 뜯어낸 350장의 사무실 벽 유리를</span><br>
							 <span>&nbsp;&nbsp;옮겨 유리분수대를 만든 것</span><br>
							 <span>&nbsp;&nbsp;#재활용 #감동 #분수 #유리 #문화시설 #물 #관광지</span>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div id="colorlib-testimony" class="colorlib-light-grey">
			<div class="container">
				<div class="row">
					<div
						class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box">
						<h2>Our Satisfied Guests says</h2>
						<p>We love to tell our successful far far away, behind the
							word mountains, far from the countries Vokalia and Consonantia,
							there live the blind texts.</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 col-md-offset-2 animate-box">
						<div class="owl-carousel2">
							<div class="item">
								<div class="testimony text-center">
									<span class="img-user"
										style="background-image: url(images/person1.jpg);"></span> <span
										class="user">Alysha Myers</span> <small>Miami Florida,
										USA</small>
									<blockquote>
										<p>" A small river named Duden flows by their place and
											supplies it with the necessary regelialia.</p>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="testimony text-center">
									<span class="img-user"
										style="background-image: url(images/person2.jpg);"></span> <span
										class="user">James Fisher</span> <small>New York, USA</small>
									<blockquote>
										<p>One day however a small line of blind text by the name
											of Lorem Ipsum decided to leave for the far World of Grammar.</p>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="testimony text-center">
									<span class="img-user"
										style="background-image: url(images/person3.jpg);"></span> <span
										class="user">Jacob Webb</span> <small>Athens, Greece</small>
									<blockquote>
										<p>Alphabet Village and the subline of her own road, the
											Line Lane. Pityful a rethoric question ran over her cheek,
											then she continued her way.</p>
									</blockquote>
								</div>
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
						<p>Facilis ipsum reprehenderit nemo molestias. Aut cum
							mollitia reprehenderit. Eos cumque dicta adipisci architecto
							culpa amet.</p>
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
							<li><a href="#">A Definitive Guide to the Best Dining
									and Drinking Venues in the City</a></li>
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

