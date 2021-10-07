<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String keyword = request.getParameter("keyword");
%>


<!DOCTYPE html>
<html>

<head>
<title>자, 가보자고</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	
<link rel="stylesheet" href="assets/css/shj/main.css" />
<link rel="stylesheet" href="assets/css/shj/style.css" />
<link rel="stylesheet" href="assets/css/shj/slideleft.css" />
<link rel="stylesheet" href="assets/css/shj/bootstrap.css" />
<link rel="stylesheet" href="assets/css/shj/bootstrap.css.map" />
<link rel="stylesheet" href="assets/css/shj/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/shj/fontawesome-all.min.css" />
<link rel="stylesheet" href="assets/css/shj/bootstrap-theme.css" />
<link rel="stylesheet" href="assets/css/shj/bootstrap-theme.css.map" />

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
    integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
    crossorigin="anonymous" />


<!-- 달력 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
header{
border-bottom: solid #f7f7f7 4px;
}
.main_container {
    padding: 50px;
    display: flex;
    flex-direction: column;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    min-height: calc(100vh - 57px);
    /* min-width: 650px; */
}
.question_container {
    width: 100%;
}
.question_container ol {
    width: 100%;
    padding: 20px 0;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

.question_container li {
    width: 50%;
    padding: 0 5px;
    margin-bottom: 5px;
}

ol, ul {
    list-style: none;
}

.question_box {
    width: 100%;
    height: 400px;
    background: white;
    border: 0.5px solid rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    padding: 40px;
    margin: 3px;
    display:flex-wrap;
}
.main_planImg{
	width:200px; 
	display:inline;
}

.main_profileImg{
	width:10px; 
	display:inline;
	padding: 0 0 3px 0;
}

</style>
</head>

<body class="is-preload">

	<div id="header">
	
		<header>

			<div class = "nav_container b_text">
			<a href="main.action">
				<img src="images/logo_zago.png" style="height:70px !important" alt="Za, GO." />
			</a>
				<div class="hor_category l_text">
					<div class="main_category">
						<ul class="navbar">
<!-- 							<li class="nav-item">
								<a href="">자고 소개</a>
							</li> -->
							<li class="nav-item">
								<!-- <a href="">자고 이용 안내</a> -->
							</li>
							<li class="nav-item">
								<!-- <a href="">FAQ</a> -->
							</li>
						</ul>
					</div>
					

					
					<div class="account_category">
						<ul class="navbar">
							<li class="nav-item">
								<a href="">로그인</a>
							</li>
							<li class="nav-item">
								<a href="">회원가입</a>
							</li>
							
							<li class="nav-item">
								<a href="startplan.action">일정 작성 하기</a>
							</li>

						</ul>
					</div>
				</div>
				
			</div>
		</header>
	</div>


	<!-- 페이지를 좌우 분할할 section -->
	<section class="banner style1">
	
			<div class="main_container"> 


				<div >등록된 일정 보기</div> 
					<div class="question_container">
			
						<ol>
							<!-- main.action url을 통해 mainpage 메소드가 실행되어서 planList 모델 도착 -->
					        <!-- PlanDTO 객체가 담긴 List 컬렉션 -->
					        <c:forEach var="plan" items="${planList}" >
					        	<li>
					        		<div class="question_box" >
									
										<a href="/plan/detail.action?pl_cd=${plan.PL_CD}">
											
												<img alt="" class="main_planImg" src="images/icecream.jpg" >
													&nbsp;
													&nbsp;
												<span class="plan_title_B" style="font-size: medium; font-weight: bold !important;">		 
													${plan.PL_TT}
												</span>
											
										</a>
										<br>
										<span class="plan_title_S" style="font-size:10px !important;">${plan.PL_STT}</span>
	
										<div class="q_sub_info" style="font-size:10px !important;">
											<div>${plan.PL_STRT_DT} - ${plan.PL_END_DT}</div>
											<div><img class="main_profileImg" src="images/profile_1.png">  TBD </div>
										</div>
									</div>
								</li>
					        </c:forEach>
						</ol>

				</div>		
			</div>

	</section>

	




	<!-- Footer -->
	<footer class="wrapper style1 align-center">
		<div class="inner">

			<p>
				&copy; ZAGO noodle9407@gmail.com 서울 마포구 동교동 113-32<br>
				Copyright 2021. zago, Co., Ltd. All rights reserved <a
					href="https://github.com/shj78">ZAGO</a>.
			</p>
		</div>
	</footer>


</body>

</html>