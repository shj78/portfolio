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

<style type="text/css">
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
	
	<!-- 일정구경 리스트 -->
	<div id="features-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-4 col-12-medium">

					<!-- Box -->
						<section class="box feature">
							<a href="#" class="image featured"><img src="images/jeju.jpg"></a>
							<div class="inner">
								<header>
									<p>2021-05-03~05-05(2박 3일)</p>
									<h2>시간이 떠나기 전에 우리가 먼저 떠나버려야 돼</h2>
									<p>힐링 | 강릉</p>
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
									<p>2021-03-13~03-17(4박 5일)</p>
									<h2>우정여행</h2>
									<p>맛집 | 제주도</p>
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
									<p>2020-07-02~07-05(3박 4일)</p>
									<h2>제주 예쁜재주</h2>
									<p>힐링 | 제주도</p>
									<p>스크랩 460 조회수 5,290</p>
									<p><img src="images\user.PNG">mong2unni</p>
								</header>
							</div>
						</section>

				</div>
			</div>
		</div>
	</div>
	
	<div id="features-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-4 col-12-medium">

					<!-- Box -->
						<section class="box feature">
							<a href="#" class="image featured"><img src="images/jeju.jpg" onclick="location.href='/Home/ComTrip.jsp';"></a>
							<div class="inner">
								<header>
									<p>2021-02-28~03-01(1박 2일)</p>
									<h2>힐링조와</h2>
									<p>힐링 | 남해</p>
									<p>스크랩 212 조회수 3,390</p>
									<p><img src="images\user.PNG">deepsea</p>
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
									<p>2021-06-01~06-04(3박 4일)</p>
									<h2>답답한 일상에서 벗어나</h2>
									<p>액티비티 | 단양</p>
									<p>스크랩 201 조회수 2,037</p>
									<p><img src="images\user.PNG">Eun J</p>
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
									<p>2020-08-10~08-16(6박 7일)</p>
									<h2>가족들과 체험하기</h2>
									<p>체험 | 이천</p>
									<p>스크랩 190 조회수 1,290</p>
									<p><img src="images\user.PNG">molla</p>
								</header>
							</div>
						</section>

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