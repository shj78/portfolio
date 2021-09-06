<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700"
	rel="stylesheet">

<link rel="stylesheet" href="assets/css/css-lsr/icomoonstyle.css">

<link rel="stylesheet" href="assets/css/css-lsr/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/css/css-lsr/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet" href="assets/css/css-lsr/style_header.css">

<!-- Bootstrap Theme -->
<link rel="stylesheet" href="assets/css/css-lsr/bootstrap-theme.css">

<title>LEGGO</title>

</head>
<body>

<header class="site-navbar js-sticky-header site-navbar-target"
		role="banner">

		<div class="container">
			<div class="row align-items-center position-relative">


				<div class="site-logo">
					<a href="/PrjApp/MainHome.jsp" class="text-black"><span
						class="text-primary"><img src="images/logo.png"
							style="width: 30%; margin-left: 10%;"></span></a>
				</div>

				<div class="col-12">
					<nav class="site-navigation text-right ml-auto " role="navigation">

						<ul
							class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
							<li><a href="mainhome.action" class="nav-link">홈</a></li>
							<li><a href="#services-section" class="nav-link">일정짜기</a></li>


							<li class="has-children"><a href="#about-section"
								class="nav-link">커뮤니티</a>
								<ul class="dropdown1 arrow-top">
									<li><a href="mainhome.action" class="nav-link">커뮤니티 홈</a></li>
									<li><a href="comtripfeed.action" class="nav-link">여행기</a></li>
									<li><a href="complanfeed.action" class="nav-link">일정 구경</a></li>
									<li><a href="comphotofeed.action">사진</a></li>
								</ul>
							</li>
						

							<li><div class="input-group mb-3">
									<input type="text" class="form-control" placeholder="통합검색"
										aria-label="searchTotal" aria-describedby="button-addon2"
										style="width: 150px;">
									<button class="btn btn-secondary" type="button"
										id="button-addon2">
										<img
											src="https://image.flaticon.com/icons/png/512/71/71403.png"
											width="18px">
									</button>
								</div></li>
							<li class="has-children"><button style="font-size: 15px; width: 90px; height: 40px; padding: 0.1em 1.5em;">글쓰기</button>
								<ul class="dropdown1">
									<li><a href="#">여행기 글쓰기</a></li>
									<li><a href="#">사진 글쓰기</a></li>
								</ul>
							</li>
							<li class="has-children"><a href="#"> <img
									src="https://i2.wp.com/novocom.top/image/aWNvbYXJ5Li1saWJyYXJ5LmNvbQ==/images/no-profile-picture-icon/no-profile-picture-icon-15.jpg"
									alt="Admin" class="rounded-circle" width="38px" height="38px"></a>
								<ul class="dropdown1">
									<li><a href="/PrjApp/Profile.jsp">마이페이지</a></li>
									<li><a href="#">로그아웃</a></li>
								</ul>
							</li>
						</ul>
					</nav>

				</div>

				<div class="toggle-button d-inline-block d-lg-none">
					<a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span
						class="icon-menu h3"></span></a>
				</div>

			</div>
		</div>

	</header>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/js-lsr/bootstrap.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/js-lsr/main.js"></script>

</body>
</html>