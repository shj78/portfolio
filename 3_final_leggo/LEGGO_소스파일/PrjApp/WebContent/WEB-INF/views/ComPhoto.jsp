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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=89f516b15bc73fd13f9d3d558582f8a3&libraries=services"></script>
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
		</div>
	</div>
	
	<!-- Page content-->
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-8">
                <!-- Post content-->
                <article>
                    <!-- Post header-->
                    <header class="mb-4">
                        <!-- Post title-->
                        <div class="text-muted fst-italic mb-2">2021-05-03</div>
                        <h2><img src="images\photo1.jpg" width="800px;"></h2>
                        <!-- <h1 class="fw-bolder mb-1"><b>맑은 바다 어딘지 궁금하면 클릭</b></h1> -->
                        <!-- Post meta content-->
                        <p style="background-color: #DCDCDC;">맛집 | 제주도 | 2박3일 | 4인 | 1,800,000원</p>
                        
                        <!-- <p><img src="images\user.PNG">Romi</p>
                        Post categories
                        <a class="badge bg-secondary text-decoration-none link-light" href="#!">스크랩</a>
                        <a class="badge bg-secondary text-decoration-none link-light" href="#!">팔로우</a> -->
                        
                    </header>
                    <!-- Preview image figure-->
                    <!-- <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure> -->
                    <!-- <h2><img src="images\jeju.jpg" width="800px;"></h2> -->
                    <!-- Post content-->
                    <section class="mb-5">
                        <p class="fs-5 mb-4">주말이라 그런지 사람이 사람이...! 너무 많았다 😂
						반려동물 입장 가능한지 알았으면 우리 가을이 데려올걸...!
						건물이 한옥이라 너무 멋지고, 건물도 여러개 있어서 사람이 많았어도 빈자리가 많았다😍</p>
                        <!-- <p class="fs-5 mb-4"><b>DAY 1</b> <br>원래 우도는 여행 일정 중간에 가는게 대부분의 경우이지만, 이번 여행의 경우 언제 날씨가 나빠질지 모를 경우를 대비해서 첫 날에 우도를 방문하였다. 사진은 정말정말 먹고 싶었던 우도 땅콩 아이스크림! 맛은 그냥 생각하는 그 맛이지만, 바다를 풍경으로 먹으면 맛이 배가 된다. 우도에 도착하면 입구부터 전기차 대여해주는 곳이 정말 많다. 전기차 대여하고 땅콩 아이스크림 하나 먹으며 우도 구경하면 기분이 정말 최고다. 추천 b</p> -->
                        <!-- <p class="fs-5 mb-4">If you get asteroids about a kilometer in size, those are large enough and carry enough energy into our system to disrupt transportation, communication, the food chains, and that can be a really bad day on Earth.</p>
                        <h2 class="fw-bolder mb-4 mt-5">I have odd cosmic thoughts every day</h2>
                        <p class="fs-5 mb-4">For me, the most fascinating interface is Twitter. I have odd cosmic thoughts every day and I realized I could hold them to myself or share them with people who might be interested.</p>
                        <p class="fs-5 mb-4">Venus has a runaway greenhouse effect. I kind of want to know what happened there because we're twirling knobs here on Earth without knowing the consequences of it. Mars once had running water. It's bone dry today. Something bad happened there as well.</p> -->
                        
                        <p><br>스크랩 수 1,212 조회수 10,433 <img src="images\singo.jpg" width="30px;" height="30px;">신고하기</p>
                    </section>
                </article>
                <!-- Comments section-->
                <!-- <section class="mb-5"> -->
                <section class="mb-5">
                    <div class="card bg-light">
                        <div class="card-body">
                            <!-- Comment form-->
                            <form class="mb-4"><textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea></form>
                            <!-- Comment with nested comments-->
                            <div class="d-flex mb-4">
                                <!-- Parent comment-->
                                <div class="flex-shrink-0"><!-- <img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /> --></div>
                                	<div class="ms-3">
                                    	<div class="fw-bold"><img src="images\user.PNG">&nbsp;Eun J</div>
                                    	헉 반려동물 입장 가능하군요..! 저도 가야겠어요 ㅎㅎ
                                	</div>
                                <br>
                            	<!-- <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                	<div class="ms-3">
                                    	<div class="fw-bold"><img src="images\user.PNG">&nbsp;deepsea</div>
                                    	사진만 봐도 힐링되네요~
                                	</div> -->
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <!-- Side widgets-->
            <div class="col-lg-4">
                <!-- Search widget-->
                <div class="card mb-4">
                    <!-- <div class="card-header">Search</div> -->
                    <div class="card-body">
                        <div class="input-group">
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!" style="padding: 0.8em 1.5em; font-size: 15px;">스크랩</a>
                       		<a class="badge bg-secondary text-decoration-none link-light" href="#!" style="padding: 0.8em 1.5em; font-size: 15px;">팔로우</a>
                        </div>
                        <br>
                        <div>
                        	<p><img src="images\user.PNG">Romi</p>
                        </div>
                    </div>
                </div>
                
                <!-- Side widget-->
                <div class="card mb-4">
                    <div id="map" class="card-body" style="width:375px;height:400px;">
                    
                    지도 들어가는 자리
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
	<footer>
		<c:import url="Footer.jsp"></c:import>
	</footer>
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/js-lsr/scripts.js"></script>
    
    <script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450408, 126.304306),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
    

</body>
</html>