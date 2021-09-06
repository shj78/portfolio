<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700"
	rel="stylesheet">
	
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>

<link rel="stylesheet" href="assets/css/css-lsr/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/css/css-lsr/bootstrap.min.css">

<!-- 부트스트랩 css -->
<link rel="stylesheet" href="assets/css/css-lsr/bootstrap.css">

<!-- jQuery -->
<script src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 script -->
<script src="assets/js/js-lsr/bootstrap.min.js"></script>

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

<script type="text/javascript" src="js/js-lsr/jquery-3.6.0.min.js"></script>

<style type="text/css">
	a:active {text-decoration:none; color: #ffffff;}
	a:hover {text-decoration:none; color: #2E9AFE;}
	a:visited {text-decoration:none; color: #2E9AFE;}
	
	.dropbtn {
  background-color: Silver;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: black;}
</style>

</head>
<body>

<!-- 헤더 -->
<header>	
		<div style="background-color: white;">
			<c:import url="ComHeader.jsp"></c:import>
	</div>
</header>

	<div class="container">
		<div class="main-body">
			<!-- 상단 메뉴 -->
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="mainhome.action">커뮤니티 홈</a></li>
					<li class="breadcrumb-item"><a href="comtripfeed.action">여행기</a></li>
					<li class="breadcrumb-item"><a href="complanfeed.action">일정 구경</a></li>
					<li class="breadcrumb-item"><a href="comphotofeed.action">사진</a></li>
				</ol>
			</nav>
			
			<!-- 필터링 -->
			<div class="dropdown">
                 <button class="dropbtn" style="width: 70px; height: 35px; font-size: 11px; padding: 0.0em 1.5em;">정렬▼</button>
                 <div class="dropdown-content">
                   <a href="#">인기순</a>
                   <a href="#">최신순</a>
                 </div>
            </div>
            <!-- <div class="dropdown">
                 <button class="dropbtn" style="width: 70px; height: 35px; font-size: 11px; padding: 0.0em 1.5em;">테마▼</button>
                 <div class="dropdown-content">
                   <a href="#"></a>
                   <a href="#"></a>
                 </div>
            </div>
            <div class="dropdown">
                 <button class="dropbtn" style="width: 70px; height: 35px; font-size: 11px; padding: 0.0em 1.5em;">도시▼</button>
                 <div class="dropdown-content">
                   <a href="#">서울</a>
                   <a href="#">제주</a>
                   <a href="#">부산</a>
                   <a href="#">강릉</a>
                   <a href="#">속초</a>
                   <a href="#">여수</a>
                   <a href="#">순천</a>
                   <a href="#">전주</a>
                 </div>
            </div>
            <div class="dropdown">
                 <button class="dropbtn" style="width: 70px; height: 35px; font-size: 11px; padding: 0.0em 1.5em;">기간▼</button>
                 <div class="dropdown-content">
                   <a href="#">당일치기</a>
                   <a href="#">1박 2일</a>
                   <a href="#">2박 3일</a>
                   <a href="#">3박 4일</a>
                   <a href="#">4박 5일</a>
                   <a href="#">5박 6일</a>
                   <a href="#">6박 7일</a>
                   <a href="#">7박 8일</a>
                   <a href="#">8박 9일</a>
                   <a href="#">9박 10일</a>
                 </div>
            </div>
            <div class="dropdown">
                 <button class="dropbtn" style="width: 70px; height: 35px; font-size: 11px; padding: 0.0em 1.5em;">인원▼</button>
                 <div class="dropdown-content">
                   <a href="#">1명</a>
                   <a href="#">2명</a>
                   <a href="#">3명</a>
                   <a href="#">4명</a>
                   <a href="#">5명</a>
                   <a href="#">6명</a>
                 </div>
            </div>
            <div class="dropdown">
                 <button class="dropbtn" style="width: 70px; height: 35px; font-size: 11px; padding: 0.0em 1.5em;">예산▼</button>
                 <div class="dropdown-content">
                   <a href="#">0원 ~ 100,000원</a>
                   <a href="#">100,000원 ~ 200,000원</a>
                   <a href="#">200,000원 ~ 300,000원</a>
                   <a href="#">300,000원 ~ 400,000원</a>
                   <a href="#">400,000원 ~ 500,000원</a>
                   <a href="#">500,000원 ~ 600,000원</a>
                   <a href="#">600,000원 ~ 700,000원</a>
                   <a href="#">700,000원 ~ 800,000원</a>
                   <a href="#">800,000원 ~ 900,000원</a>
                   <a href="#">900,000원 ~ 1,000,000원</a>
                   <a href="#">1,000,000원 이상</a>
                 </div>
            </div> -->
			
			
			<!-- 전체 글 수 -->
			<table>
				<tr>
					<td>전체 글 5,290</td>
				</tr>
			</table>
		</div>
	</div>
	
	<!-- 여행기 리스트 -->
	<div id="features-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-4 col-12-medium">

					<!-- Box -->
						<!-- <section class="box feature">
							<a href="comtrip.action" class="image featured"><img src="images/jeju.jpg"></a>
							<div class="inner">
								<header>
									<h2 onclick="comtrip.action;"><br>맑은 바다 어딘지 궁금하면 클릭</h2>
									<p>스크랩 1,212 조회수 10,433</p>
									<p><img src="images\user.PNG">Romi</p>
								</header>
							</div>
						</section> -->
						
						<c:forEach var="trip" items="${list }">
						<section class="box feature">
							<!-- 썸네일 -->
							<a href="comtrip.action" class="image featured"><img src="${trip.tr_thum_url }"></a>
							<div class="inner">
								<header>
									<!-- 제목 -->
									<h2 onclick="comtrip.action;"><br>${trip.tr_tt }</h2>
									<!-- 조회수 -->
									<p>조회수 ${trip.tr_hits }</p>
									<!-- 프로필 사진, 닉네임 -->
									<p><img src="images\user.PNG">${trip.mem_nnm }</p>
								</header>
							</div>
						</section>
						</c:forEach>

				</div>
				<!-- 
				<div class="col-4 col-12-medium">

					Box
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
				 -->
				 
				<!-- 
				<div class="col-4 col-12-medium">

					Box
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
				-->
			</div>
		</div>
	</div>
	
	<div id="features-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-4 col-12-medium">

					<!-- Box -->
						<!-- 
						<section class="box feature">
							<a href="#" class="image featured"><img src="images/jj.png" alt="" /></a>
							<div class="inner">
								<header>
									<h2><br>맑은 바다 어딘지 궁금하면 클릭</h2>
									<p>스크랩 1,212 조회수 10,433</p>
									<p><img src="images\user.PNG">Romi</p>
								</header>
							</div>
						</section>
 						-->
				</div>
				<div class="col-4 col-12-medium">

					<!-- Box -->
						<!-- 
						<section class="box feature">
							<a href="#" class="image featured"><img src="images/jeju33.jpg" alt="" /></a>
							<div class="inner">
								<header>
									<h2><br>도깨비 주인공 나야나</h2>
									<p>스크랩 350 조회수 7,073</p>
									<p><img src="images\user.PNG">deapsea</p>
								</header>
							</div>
						</section>
 						-->
				</div>
				<div class="col-4 col-12-medium">

					<!-- Box -->
						<!-- 
						<section class="box feature">
							<a href="#" class="image featured"><img src="images/kj3.jpg" alt="" /></a>
							<div class="inner">
								<header>
									<h2><br>장관이네요 절경이고요</h2>
									<p>스크랩 460 조회수 5,290</p>
									<p><img src="images\user.PNG">mong2unni</p>
								</header>
							</div>
						</section>
 						-->
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
			<footer>
				<c:import url="Footer.jsp"></c:import>
			</footer>

</body>
</html>