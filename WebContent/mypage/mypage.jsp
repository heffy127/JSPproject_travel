<%@page import="member.membershipDTO"%>
<%@page import="member.membershipDAO"%>
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
<script type="text/javascript">
	function logout() {
		document.f_logout.submit()
	}
</script>

</head>
<body>
	<jsp:useBean id="dto" class="member.membershipDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">

	<%
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		membershipDAO dao = new membershipDAO();
	
		dto = dao.ShowInfo(sessionId);
		
		String name = dto.getName();
		String ssn = dto.getSsn();
		String ssn2 = dto.getSsn2();
		String id = dto.getId();
		String pw = dto.getPw();
		String pwhint = dto.getPwhint();
		String pwan = dto.getPwan();
		String mail = dto.getMail();
		String mail2 = dto.getMail2();
		String address = dto.getAddress();
		String address2 = dto.getAddress2();
		String address3 = dto.getAddress3();
		String postcode = dto.getPostcode();
		String tel = dto.getTel();
		String tel2 = dto.getTel2();
		String tel3 = dto.getTel3();
		
		%>
	
	
	$(function () { //DB에서 불러온 정보를 텍스트 필드에 값 넣기
			var name = "<%= name %>"
			var ssn = "<%= ssn %>"
			var ssn2 = "<%= ssn2 %>"
			var id = "<%= id %>"
			var pw = "<%= pw %>"
			var pwhint = "<%= pwhint %>"

			switch (pwhint) {
				case '1':
					pwhint = '졸업한 초등학교 이름은?'
					break;
				case '2':
					pwhint ='제일 친한 친구 이름은??'
					break;
				case '3':
					pwhint ='아버지 성함은?'
					break;
				case '4':
					pwhint ='어머니 성함은?'
					break;
				case '5':
					pwhint ='어릴적 내 별명은?'
					break;
				case '6':
					pwhint ='가장 아끼는 물건은?'
					break;
				case '7':
					pwhint ='좋아하는 동물은?'
					break;
				case '8':
					pwhint ='좋아하는 색깔은?'
					break;
				case '9':
					pwhint ='좋아하는 음식은?'
					break;
			
				default:
				pwhint ='미선택'
					break;
			}

			var pwan = "<%= pwan %>"
			var mail = "<%= mail %>"
			var mail2 = "<%= mail2 %>"
			var address = "<%= address %>"
			var address2 = "<%= address2 %>"
			var address3 = "<%= address3 %>"
			if(address3 == "null"){
				address3 = "";
			}
			var postcode = "<%= postcode %>"
			var tel = "<%= tel %>"
			var tel2 = "<%= tel2 %>"
			var tel3 = "<%= tel3 %>"
			
			$('#name').val(name);
			$("#name").attr("readonly", true);
			
			$('#ssn').val(ssn);
			$("#ssn").attr("readonly", true);
			
			$('#ssn2').val(ssn2);
			$("#ssn2").attr("readonly", true);
			
			$('#id').val(id);
			$("#id").attr("readonly", true);
			
			$('#pw').val(pw);
			$("#pw").attr("readonly", true);
			
			$('#pwhint').val(pwhint);
			$("#pwhint").attr("readonly", true);
			
			$('#pwan').val(pwan);
			$("#pwan").attr("readonly", true);
			
			$('#mail').val(mail);
			$("#mail").attr("readonly", true);
			
			$('#mail2').val(mail2);
			$("#mail2").attr("readonly", true);
			
			$('#address').val(address);
			$("#address").attr("readonly", true);
			
			$('#address2').val(address2);
			$("#address2").attr("readonly", true);
			
			$('#address3').val(address3);
			$("#address3").attr("readonly", true);
			
			$('#postcode').val(postcode);
			$("#postcode").attr("readonly", true);
			
			$('#tel').val(tel);
			$("#tel").attr("readonly", true);
			
			$('#tel2').val(tel2);
			$("#tel2").attr("readonly", true);
			
			$('#tel3').val(tel3);
			$("#tel3").attr("readonly", true);
			
	});
	
	$(function UpdateCheck() {
			$("#Update").click(function () {
				location.href="mypageModify.jsp";
				
			});
	});
	
	$(function DelCheck() {
			$("#Delete").click(function () {
				var message = confirm("삭제하시겠습니까?");
				if(message == true){
					document.f.submit();
				}else{
					return false;
				}
			});
		});
	
	</script>
	<div class="colorlib-loader"></div>
	<input type="hidden" id="dflksdj" value="<%= sessionId %>">
	<input type="hidden" id="asdf" value="<%= id %>">
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
										<input type="hidden" value="'mypage'" name="fromMypage">
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
								<li class="has-dropdown">
									<a href="../board/board.jsp">소통광장</a>
									<ul class="dropdown">
										<li><a href="../board/board.jsp">자유게시판</a></li>
										<li><a href="../board_editor/board_editor.jsp">editor's pick</a></li>
									</ul>
								</li>
								<li><a href="../news/news.jsp">뉴스</a>
								<li class="active"><a href="mypage.jsp">MyPage</a></li>
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
					<li style="background-image: url(../images/main_4.jpg);">
						<div class="overlay"></div>
						<div class="container-fluid">
							<div class="row">
								<div
									class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
									<div class="slider-text-inner text-center">
										<h2>내 정보 및 즐겨찾기 관리</h2>
										<h1>마이 페이지</h1>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</aside>

		<div id="colorlib-about">
			<div class="container">
				<div class="row">
					<div class="about-flex">
						<!-- <div class="col-one-forth aside-stretch animate-box">
							<div class="row">
								<div class="col-md-12 about">
									<h2>About</h2>

									<ul>
										<li><a href="#">History</a></li>
										<li><a href="#">Staff</a></li>
										<li><a href="#">Connect with us</a></li>
										<li><a href="#">Faqs</a></li>
										<li><a href="#">Career</a></li>
									</ul>
								</div>
							</div>
						</div> -->
						<div class="col-three-forth animate-box">
							<h2>나의 회원 정보</h2>
							<div class="row">
								<div class="col-md-12">
									<table width="1250px" height="200px" border="0">
										<tr>
											<td>
												<table width="1250px" border="0"
												style="color: #0e7f2e; backgorund-color: #F6F6F6; font-size: 15px; font-weight: bold">
													<tr>
														<td align="center"><img src="" height="30px">
														</td>
														<td height="40px">기본정보 </td>
															
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<form name="f" action="DeleteInfo.jsp">
												<table width="1250px" height="1px" align="center"
												style="border: dotted 5px none; margin-top: 1px">
													<tr>
														<table width="1250px" height="20px" border="0"
														style=" color : black; font-size: 15px;">
															<tr>
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
																<td bgcolor="#e2ffea" style="color : #0e7f2e ; font-weight: bold;" height="40px">&nbsp;이름</td>
																<td><input type="text" name="name" id="name"></td> <!-- 이름 텍스트 필드 -->
																<td>&nbsp;&nbsp;
																</td>
															</tr>
															<tr>
																<td >&nbsp;&nbsp; <img src="" height="30px">
																</td>
																<td bgcolor="#e2ffea" style="color : #0e7f2e ; font-weight: bold;" height="40px">&nbsp;주민등록번호</td>
																<td><input type="text" name="ssn" id = "ssn" width="70px"> - <!-- 주민등록번호 첫번째 텍스트 필드 -->
																<input type="text" name="ssn2" id="ssn2" width="70px"></td> <!-- 주민등록번호 두번째 텍스트 필드 -->
															</tr>
															<tr>
																<td >&nbsp;&nbsp; <img src="" height="30px">
																</td>
																<td bgcolor="#e2ffea" style="color : #0e7f2e ; font-weight: bold;" height="40px">&nbsp;아이디</td>
																<td><input type="text" name="id" id="id"></td> <!-- 아이디 텍스트 필드 -->
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
															</tr>
															<tr>
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
																<td bgcolor="#e2ffea" style="color : #0e7f2e ; font-weight: bold;" height="40px">&nbsp;비밀번호</td>
																<td><input type="text" name="pw" id="pw"></td> <!-- 비밀번호 텍스트 필드 -->
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
															</tr>
															<tr>
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
																<td bgcolor="#e2ffea" style="color : #0e7f2e ; font-weight: bold;" height="40px">&nbsp;비밀번호 힌트 질문</td>
																<td><input type="text" name="pwhint" id="pwhint"></td> <!-- 비밀번호 힌트 질문 텍스트 필드 -->
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
															</tr>
															<tr>
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
																<td bgcolor="#e2ffea" style="color : #0e7f2e ; font-weight: bold;" height="40px">&nbsp;비밀번호 힌트 답변</td>
																<td><input type="text" name="pwan" id="pwan"></td> <!-- 비밀번호 힌트 답변 텍스트 필드 -->
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
															</tr>
															<tr>
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
																<td bgcolor="#e2ffea" style="color : #0e7f2e ; font-weight: bold;" height="40px">&nbsp;이메일</td>
																<td><input type="text" name="mail" id="mail"> @  <!-- 이메일 텍스트 필드 -->
																<input type="text" name="mail2" id="mail2"></td> <!-- 이메일 디테일 텍스트 필드 -->
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
															</tr>
															<tr>
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
																<td bgcolor="#e2ffea" style="color : #0e7f2e ; font-weight: bold;" height="80px">&nbsp;주소</td>  
																<td><input type="text" name="address" id="address"> - <!-- 주소 텍스트 필드 -->
																<input type="text" name="address2" id="address2">	<!-- 상세주소 텍스트 필드 -->
																<input type="text" name="address3" id="address3">	<!-- 참고항목 텍스트 필드 -->
																<input type="text" name="postcode" id="postcode"></td>	<!-- 우편번호 텍스트 필드 -->
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
															</tr>
															<tr>
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
																<td bgcolor="#e2ffea" style="color : #0e7f2e ; font-weight: bold;" height="40px">&nbsp;핸드폰 번호</td>
																<td><input type="text" name="tel" id="tel"> - 	<!-- 핸드폰 텍스트 필드 -->
																<input type="text" name="tel2" id="tel2"> - 	<!-- 핸드폰 가운데자리 텍스트 필드 -->
																<input type="text" name="tel3" id="tel3"></td>	<!-- 핸드폰 끝자리 텍스트 필드 -->
																<td>&nbsp;&nbsp; <img src="" height="30px">
																</td>
															</tr>
														</table>
														<table width="1250px" height="20px" border="0"
														style=" color : black; font-size: 15px; margin-top: 3%">
															<tr>
																<td align="center">
																	<input type="button" name="Update" id="Update" value="  회원정보 수정  " align="center"
																	style="cursor: pointer; background: white; color: black; border-color: black;">
																	<input type="button" name="Delete" id="Delete" value="  회원 탈퇴  " align="center"
																	style="cursor: pointer; background: white; color: black; border-color: black;">
																</td>
															</tr>
													</tr>
												</table>						
									</table>

									<div class="row row-pb-sm">
										<div class="col-md-6">
											
										</div>
										<div class="col-md-6">
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
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
										style="background-image: url(../images/person1.jpg);"></span> <span
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
										style="background-image: url(../images/person2.jpg);"></span> <span
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
										style="background-image: url(../images/person3.jpg);"></span> <span
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


		<div id="colorlib-subscribe"
			style="background-image: url(../images/img_bg_2.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div
						class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box">
						<h2>Sign Up for a Newsletter</h2>
						<p>Sign up for our mailing list to get latest updates and
							offers.</p>
						<form class="form-inline qbstp-header-subscribe">
							<div class="row">
								<div class="col-md-12 col-md-offset-0">
									<div class="form-group">
										<input type="text" class="form-control" id="email"
											placeholder="Enter your email">
										<button type="submit" class="btn btn-primary">Subscribe</button>
									</div>
								</div>
							</div>
						</form>
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
		<a href="#" class="../js-gotop"><i class="icon-arrow-up2"></i></a>
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

