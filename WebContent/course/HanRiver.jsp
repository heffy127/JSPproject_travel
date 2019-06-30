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
						<td style="width : 200px; font-size: 50px; font-weight: bold; padding-top: 10%;color: #fce247;">여의도 한강</td>
					</tr>
					<tr>
						<td><div id = "sub_title">&nbsp;서울시 여의도동</div></td>
					</tr>
					<tr>
						<td style="padding-top:2%; color: black;" align="top">
							<span>강가에 위치한 대형 공원으로 아름다운 경치와 조깅 코스, 수영장 등이 있어</span><br>
							<span>많은 사람들의 사랑을 받고 있습니다.</span>
						</td>
						<td width="200px;" height="200px;" align="center">
							<img src="../course/image/OneRiver/OneRiverDe.jpg" width="350px;" height="200px;">
						</td>
					</tr>	
									
				</table>
				<table width="1200px" height="600px" align="center" border="0" style="border-collapse:collapse; margin-top: 5%;">
					<tr>
						<td width="200px" height="150px" align="center">
							<div class="img">
								<img src="../course/image/OneRiver/Festival.jpg" width="200px;" height="150px;" >
							</div>
						</td>
						<td>
							<span style="font-size: 20px; font-weight: bold;color: #fce247; ">&nbsp;&nbsp;녹음수 광장</span><br>
							<span>&nbsp;&nbsp;여의도 한강공원에 힐링코스중 하나로 매년 한강나이트워크42K 행사가 열리며, 춤, 음악, 미디어아트 등
							 </span><br>
							 <span>&nbsp;&nbsp;러시아.호주.일본.말레이시아 등 세계 정상급 예술가들이 출현해 화려한 볼거리를 무료로 선보인다.</span><br><br>
							 <span>&nbsp;&nbsp;#축제 #한강 #힐링코스 #공연 #문화시설 #여름 #계절</span>
						</td>
					</tr>
					<hr color="black">
					<tr>
						<td width="200px" height="150px" align="center" style="padding-top: 1%;">
							<div class="img">
								<img src="../course/image/OneRiver/WaterSquare.JPG" width="200px;" height="150px;" >
							</div>
						</td>
						<td>
							<span style="font-size: 20px; font-weight: bold; color: #fce247;">&nbsp;&nbsp;물빛광장/물빛무대</span><br>
							<span>&nbsp;&nbsp;여름철 휴식처로 가족들이 함께 단란하게 물놀이를 하며 더위를 피할수 있는 관광명소
							 </span><br><br><br>
							 <span>&nbsp;&nbsp;#여행 #물놀이 #가족 #더위 #여름 #물 </span>
						</td>
					</tr>
					<tr>
						<td width="200px" height="150px" align="center" style="padding-top: 1%;">
							<div class="img">
								<img src="../course/image/OneRiver/63Buliding.jpg" width="200px;" height="150px;" >
							</div>
						</td>
						<td>
							<span style="font-size: 20px; font-weight: bold; color: #fce247;">&nbsp;&nbsp;63빌딩</span><br>
							<span>&nbsp;&nbsp;여행객들이 즐겨 찾고 있는 서울에 대표적인 관광명소로써   
											황금빛 유리가 특징인 이 건물은 계절별로
							</span><br>
							<span>&nbsp;&nbsp;일조량에 따라 분위기가 달라지고 아름다운 한강변과 하늘의 빛에 의해 파사드(Facade)에 반사되는 모습이 장관이다.</span><br>
							<span>&nbsp;&nbsp;특히 저녁시간 서해로 지는 노을과 강양쪽을 끼고 이어지는 강변로의 차량 불빛은 63빌딩의 조망 중 절경으로 꼽힐 정도로
							</span><br>
							<span>&nbsp;&nbsp;색다른 추억거리를 제공하고 있다. </span><br>
							<span>&nbsp;&nbsp;#추억거리 #63빌딩 #야경 #데이트코스 #여행객 # 색다른볼거리</span>
						</td>
					</tr>
					<tr>
						<td width="200px" height="150px" align="center" style="padding-top: 1%;">
							<div class="img">
								<img src="../course/image/OneRiver/WaterFuntain.jpg" width="200px;" height="150px;" >
							</div>
						</td>
						<td>
							<span style="font-size: 20px; font-weight: bold; color: #fce247;">&nbsp;&nbsp;무지개분수</span><br>
							<span>&nbsp;&nbsp;배경음악과 화려한 조명이 어우러진 아름다운 분수연출로 특히 야간에는 경관조명이 이용되어 환상적인 한강 야경을 배로 확인
							 </span><br><br><br>
							 <span>&nbsp;&nbsp;#야경 #음악 #조명 #분수 #감동 #관광명소</span>
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

