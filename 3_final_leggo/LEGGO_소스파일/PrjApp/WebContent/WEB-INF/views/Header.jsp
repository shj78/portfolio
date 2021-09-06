<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	session = request.getSession();
	String mem_img = (String)session.getAttribute("mem_img");
%>
<!DOCTYPE HTML>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/jsh/bootstrap.min.css">
<link rel="stylesheet" href="css/jsh/style_header.css">
<link rel="stylesheet" href="css/jsh/bootstrap-theme.css">

<script src="js/jsh/jquery-3.3.1.min.js"></script>
<script src="js/jsh/popper.min.js"></script>
<script src="js/jsh/bootstrap.min.js"></script>
<script src="js/jsh/jquery.sticky.js"></script>
<script src="js/jsh/main.js"></script>

<title>Header.jsp</title>
</head>
<body>

	<header class="site-navbar js-sticky-header site-navbar-target"
		role="banner" style="font-size: 16px;">

		<div class="container">
			<div class="row align-items-center position-relative">


				<div class="site-logo">
					<a href="mainhome.action" class="text-black"><span
						class="text-primary"><img src="images/leggo_logo.png"
							style="width: 150px; margin-left: 50px;"></span></a>
				</div>

				<div class="col-12">
					<nav class="site-navigation text-right ml-auto " role="navigation">

						<ul
							class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
							<li><a href="mainhome.action" class="nav-link">홈</a></li>
							<li><a href="startplan.action" class="nav-link">일정짜기</a></li>


							<li class="has-children"><a href="#about-section"
								class="nav-link">커뮤니티</a>
								<ul class="dropdown arrow-top">
									<li><a href="mainhome.action" class="nav-link">커뮤니티 홈</a></li>
									<li><a href="comtripfeed.action" class="nav-link">여행기</a></li>
									<li><a href="complanfeed.action" class="nav-link">일정 구경</a></li>
									<li><a href="comphotofeed.action">사진</a></li>
								</ul></li>

							<li style="vertical-align: middle;"><div
									class="input-group mb-3">
									<input type="text" class="form-control" placeholder="통합검색"
										aria-label="searchTotal" aria-describedby="button-addon2"
										style="width: 150px; margin-top: 5px;">
									<button class="btn btn-secondary"
										type="button" id="button-addon2"
										style="margin-top: 4px; float: right;">검색</button>
								</div></li>
								
							<c:set var="mem_img" value="<%=mem_img %>" />
							<c:choose>
								<%--로그인된 경우에만 프로필 사진, 토글 활성화 --%>
								<c:when test="${mem_img != null }">
									<li class="has-children">
										<a href="profilepageauto.action"> <img
											src="<%=mem_img %>" style="object-fit: cover;"
											alt="Admin" class="rounded-circle" width="38px" height="38px"></a>
										<ul class="dropdown">
											<li><a href="profilepageauto.action">마이페이지</a></li>
											<li><a href="javascript:kakaoLogout()">로그아웃</a></li>
										</ul>
									</li>
								</c:when>
								<%-- 로그인되지 않은 경우 로그인 버튼 활성화 --%>
								<c:otherwise>
									<li class="has-children">
										<button class="btn btn-primary"
										type="button" id="button-addon2"
										style="margin-top: 10px; float: right;"
										onclick="location.href='loginpage.action'">로그인</button>
									</li>
								</c:otherwise>
							</c:choose>
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

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    function kakaoLogout() {
    	
    	Kakao.init("a76949096713e82c75fa45bdb32ebb4c");
    	
        if (!Kakao.Auth.getAccessToken())
        {
        	location.href = "logout.action";
        }
        else
        {
	        Kakao.Auth.logout(function() {
	        	//alert('logout ok, access token -> ' + Kakao.Auth.getAccessToken())
	        });
	        
	        location.href = "logout.action";
        }
    }
</script>
</body>
</html>