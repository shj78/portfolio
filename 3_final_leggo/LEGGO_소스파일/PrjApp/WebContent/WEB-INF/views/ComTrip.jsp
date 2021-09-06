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
                <!-- <!-- Post content-->
                <!-- <article>
                    Post header
                    <header class="mb-4">
                        Post title
                        <h2><img src="images\jeju.jpg" width="800px;"></h2>
                        <h1 class="fw-bolder mb-1"><b>맑은 바다 어딘지 궁금하면 클릭</b></h1>
                        Post meta content
                        <div class="text-muted fst-italic mb-2">2021-05-03</div>
                        <p><img src="images\user.PNG">Romi</p>
                    </header>
             
                    <section class="mb-5">
                        <p class="fs-5 mb-4">5월 가정의 달을 맞이하여 가족들과 제주도 여행을 다녀왔다 :) 봄의 제주도, 여름의 제주도, 가을의 제주도, 겨울의 제주도는 늘 나에게 새로운 모습을 보여준다. 항상 제주도를 갈 때마다 하루나 이틀정도는 비가 오곤 했는데, 이번 여행은 날씨가 계속 좋아서  매우 성공적이었다!
						원래 여행을 갈 때 관광을 테마로 다녔는데, 이번에는 맛집 테마로 정해서 일정을 짜보았다.</p>
                        <p class="fs-5 mb-4"><b>DAY 1</b> <br>원래 우도는 여행 일정 중간에 가는게 대부분의 경우이지만, 이번 여행의 경우 언제 날씨가 나빠질지 모를 경우를 대비해서 첫 날에 우도를 방문하였다. 사진은 정말정말 먹고 싶었던 우도 땅콩 아이스크림! 맛은 그냥 생각하는 그 맛이지만, 바다를 풍경으로 먹으면 맛이 배가 된다. 우도에 도착하면 입구부터 전기차 대여해주는 곳이 정말 많다. 전기차 대여하고 땅콩 아이스크림 하나 먹으며 우도 구경하면 기분이 정말 최고다. 추천 b</p>
                        
                        <p>스크랩 수 1,212 조회수 10,433 <img src="images\singo.jpg" width="30px;" height="30px;">신고하기</p>
                    </section>
                </article>
                Comments section
                <section class="mb-5">
                <section class="mb-5">
                    <div class="card bg-light">
                        <div class="card-body">
                            Comment form
                            <form class="mb-4"><textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea></form>
                            Comment with nested comments
                            <div class="d-flex mb-4">
                                Parent comment
                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                	<div class="ms-3">
                                    	<div class="fw-bold"><img src="images\user.PNG">&nbsp;Eun J</div>
                                    	믿고보는 제주도..
                                	</div>
                                <br>
                            </div>
                        </div>
                    </div>
                </section> -->
                
                <!-- Post content-->
                <c:forEach var="trip" items="${list }">
                <article>
                    <!-- Post header-->
                    <header class="mb-4">
                        <!-- Post title-->
                        <h2><img src="${trip.tr_thum_url }" width="800px;"></h2>
                        <h1 class="fw-bolder mb-1"><b>${trip.tr_tt }</b></h1>
                        <!-- Post meta content-->
                        <div class="text-muted fst-italic mb-2">${trip.tr_dt }</div>
                        <p><img src="images\user.PNG">${trip.mem_nnm }</p>
                    </header>
             
                    <section class="mb-5">
                        <p class="fs-5 mb-4">${trip.tr_cont }</p>
                        <p>조회수 ${trip.tr_hits } <img src="images\singo.jpg" width="30px;" height="30px;">신고하기</p>
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
                                    	믿고보는 제주도..
                                	</div>
                                <br>
                            </div>
                        </div>
                    </div>
                </section>
                </c:forEach>
                
                
            </div>
            <!-- Side widgets-->
            <div class="col-lg-4">
                
                <!-- Side widget-->
                <div class="card mb-4">
                    <div class="card-body">
                    	<br>
                    	<div>
                    		<a class="badge bg-secondary text-decoration-none link-light" href="#!" style="padding: 0.8em 1.5em; font-size: 15px;">스크랩</a>
                        	<a class="badge bg-secondary text-decoration-none link-light" href="#!" style="padding: 0.8em 1.5em; font-size: 15px;">팔로우</a>
                        </div>
                        <br>
                        <!-- <div>
                        	<p><img src="images\user.PNG">Romi</p>
                        </div> -->
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
    <script src="js/scripts.js"></script>

</body>
</html>