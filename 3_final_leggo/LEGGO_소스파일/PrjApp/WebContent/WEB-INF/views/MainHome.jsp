<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>LEGGO</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/css-lsr/bootstrap-theme.css">
<link rel="stylesheet" href="assets/css/css-lsr/main.css" />
</head>
<body>

<!-- 헤더 -->
<header>	
	<div style="background-color: white;">
		<c:import url="Header.jsp"></c:import>
	</div>
</header>

<!-- Banner -->
				<div id="banner-wrapper">
					<div id="banner" class="box container">
						<div class="row">
							<div class="col-7 col-12-medium">
								<h2><img src="images\jeju.jpg" width="1200px;"></h2>
								<div class="text">
								<!-- <p><b>Romi님의 여행기입니다.</b></p> -->
								</div>
							</div>
							<div class="col-5 col-12-medium">
								<ul>
									<!-- <li><a href="#" class="button large icon solid fa-arrow-circle-right">Ok let's go</a></li> -->
									<!-- <li><a href="#" style="color: #ffffff;" class="button alt large icon solid fa-question-circle">자세히보기</a></li> -->
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<div>
					<p style="font-size: 40px;" class="ppplan" align="center"><br><b>인기 여행일정</b></p>
				</div>

			<!-- Features -->
				<div id="features-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature" style="background-color: white;"> 
										<a href="#" class="image featured"><img src="images/pp1.jpg" alt="" /></a>
										<div class="inner">
											<header>
												<p>2021-05-03~05-05(2박 3일)</p>
												<h2>한국의 하와이로 오세요~!</h2>
												<p>힐링 | 강릉</p>
												<p><img src="images\user.PNG">Romi</p>
											</header>
										</div>
									</section>

							</div>
							<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature">
										<a href="#" class="image featured"><img src="images/pp2.jpg" alt="" /></a>
										<div class="inner">
											<header>
												<p>2021-03-13~03-17(4박 5일)</p>
												<h2>우정여행</h2>
												<p>맛집 | 제주도</p>
												<p><img src="images\user.PNG">Eun J</p>
											</header>
										</div>
									</section>

							</div>
							<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature">
										<a href="#" class="image featured"><img src="images/pp3.jpg" alt="" /></a>
										<div class="inner">
											<header>
												<p>2020-07-02~07-05(3박 4일)</p>
												<h2>제주 예쁜재주</h2>
												<p>힐링 | 제주도</p>
												<p><img src="images\user.PNG">mong2unni</p>
											</header>
										</div>
									</section>

							</div>
						</div>
					</div>
				</div>
				
				<div>
					<p style="font-size: 40px;"  class="ppplace" align="center"><b>인기 여행지</b></p>
				</div>
				
				<!-- Features -->
				<div id="features-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature">
										<a href="#" class="image featured"><img src="images/ppjeju.jpg" alt="" /></a>
										<div class="inner">
										</div>
									</section>

							</div>
							<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature">
										<a href="#" class="image featured"><img src="images/danyang.jpg" alt="" /></a>
										<div class="inner">
										</div>
									</section>

							</div>
							<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature">
										<a href="#" class="image featured"><img src="images/tongyoung.jpg" alt="" /></a>
										<div class="inner">
										</div>
									</section>

							</div>
						</div>
					</div>
				</div>
				
				<div id="pp">
					<p style="font-size: 40px;" class="ppdiary" align="center"><br><b>인기 여행기</b></p>
				</div>
				
				<!-- Features -->
				<div id="features-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature">
										<a href="#" class="image featured"><img src="images/jeju.jpg" onclick="location.href='/PrjApp/WEB-INF/views/ComTrip.jsp';"></a>
										<div class="inner">
											<header>
												<h2 onclick="location.href='/PrjApp/ComTrip.jsp';"><br>맑은 바다 어딘지 궁금하면 클릭</h2>
												<p>스크랩 1,212 조회수 10,433</p>
												<p><img src="images\user.PNG">Romi</p>
											</header>
										</div>
									</section>

							</div>
							<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature">
										<a href="#" class="image featured"><img src="images/gangneung2.png" alt="" /></a>
										<div class="inner">
											<header>
												<h2><br>도깨비 주인공 나야나</h2>
												<p>스크랩 350 조회수 7,073</p>
												<p><img src="images\user.PNG">deapsea</p>
											</header>
										</div>
									</section>

							</div>
							<div class="col-4 col-12-medium">

								<!-- Box -->
									<section class="box feature">
										<a href="#" class="image featured"><img src="images/sokcho4.jpg" alt="" /></a>
										<div class="inner">
											<header>
												<h2><br>장관이네요 절경이고요</h2>
												<p>스크랩 460 조회수 5,290</p>
												<p><img src="images\user.PNG">mong2unni</p>
											</header>
										</div>
									</section>

							</div>
						</div>
					</div>
				</div>

			<!-- Main -->
				<!-- <div id="main-wrapper">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-4 col-12-medium">

								Sidebar
									<div id="sidebar">
										<section class="widget thumbnails">
											<h3>Interesting stuff</h3>
											<div class="grid">
												<div class="row gtr-50">
													<div class="col-6"><a href="#" class="image fit"><img src="images/pic04.jpg" alt="" /></a></div>
													<div class="col-6"><a href="#" class="image fit"><img src="images/pic05.jpg" alt="" /></a></div>
													<div class="col-6"><a href="#" class="image fit"><img src="images/pic06.jpg" alt="" /></a></div>
													<div class="col-6"><a href="#" class="image fit"><img src="images/pic07.jpg" alt="" /></a></div>
												</div>
											</div>
											<a href="#" class="button icon fa-file-alt">More</a>
										</section>
									</div>

							</div>
							<div class="col-8 col-12-medium imp-medium">

								Content
									<div id="content">
										<section class="last">
											<h2>So what's this all about?</h2>
											<p>This is <strong>Verti</strong>, a free and fully responsive HTML5 site template by <a href="http://html5up.net">HTML5 UP</a>.
											Verti is released under the <a href="http://html5up.net/license">Creative Commons Attribution license</a>, so feel free to use it for any personal or commercial project you might have going on (just don't forget to credit us for the design!)</p>
											<p>Phasellus quam turpis, feugiat sit amet ornare in, hendrerit in lectus. Praesent semper bibendum ipsum, et tristique augue fringilla eu. Vivamus id risus vel dolor auctor euismod quis eget mi. Etiam eu ante risus. Aliquam erat volutpat. Aliquam luctus mattis lectus sit amet phasellus quam turpis.</p>
											<a href="#" class="button icon solid fa-arrow-circle-right">Continue Reading</a>
										</section>
									</div>

							</div>
						</div>
					</div>
				</div> -->

			<!-- Footer -->
			<footer>
				<c:import url="Footer.jsp"></c:import>
			</footer>

			

		<!-- Scripts -->

			<script src="assets/js/js-lsr/jquery.min.js"></script>
			<script src="assets/js/js-lsr/jquery.dropotron.min.js"></script>
			<script src="assets/js/js-lsr/browser.min.js"></script>
			<script src="assets/js/js-lsr/breakpoints.min.js"></script>
			<script src="assets/js/js-lsr/util.js"></script>
			<script src="assets/js/js-lsr/main.js"></script>

</body>
</html>