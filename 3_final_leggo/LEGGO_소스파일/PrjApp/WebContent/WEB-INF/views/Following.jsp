<%@page import="com.leggo.follow.FollowPostDTO"%>
<%@page import="com.leggo.follow.FollowDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.leggo.profile.ProfileDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	ProfileDTO profile = (ProfileDTO) request.getAttribute("profile");
	String mem_img = profile.getMem_img();
	String mem_nnm = profile.getMem_nnm();
	String mem_intro = profile.getMem_intro();
	String fol_ing_cnt = profile.getFol_ing_cnt();
	String fol_ed_cnt = profile.getFol_ed_cnt();
%>
<%
	ArrayList<FollowDTO> followingList = (ArrayList)request.getAttribute("followingList");
	ArrayList<FollowPostDTO> followingpostList = (ArrayList)request.getAttribute("followingpostList");
%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Following.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/jsh/bootstrap-theme.css">

<!-- 보유한 로그인 세션이 없을 경우 로그인 페이지로 이동 -->
<% if (session.getAttribute("mem_id") == null) { %>
      <script>location.href = "loginpage.action"; </script>
<% }%>

</head>
<body>

	<!-- 헤더 -->
	<header>
		<div style="background-color: white;">
			<c:import url="Header.jsp"></c:import>
		</div>
	</header>

	<div class="container">
		<div class="main-body">
			<nav aria-label="breadcrumb" class="main-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="profilepageauto.action">마이
							페이지</a></li>
					<li class="breadcrumb-item"><a href="myplanpage.action">내
							일정</a></li>
					<li class="breadcrumb-item"><a href="mytrippage.action">내
							여행기</a></li>
					<li class="breadcrumb-item"><a href="myphotopage.action">내
							사진</a></li>
					<li class="breadcrumb-item"><a href="mycommentpage.action">내
							댓글</a></li>
					<li class="breadcrumb-item"><a href="myscrappage.action">스크랩북</a></li>
					<li class="breadcrumb-item"><a href="qnapage.action">일대일
							문의</a></li>
				</ol>
			</nav>
			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">

					<!-- 프로필 -->
					<div class="profile" style="position: fixed; width: 350px;" div="profileDiv">
						<div class="card w-90">
							<div class="card-body" id="memberProfileDiv">
								<br>
								<div class="d-flex flex-column align-items-center text-center">
									<img src="<%=mem_img%>" style="object-fit: cover;" alt="Admin"
										class="rounded-circle" width="150" height="150">
									<div class="mt-3">
										<h3><%=mem_nnm%></h3>
										<a href="followingpage.action" class="text-secondary"
											style="font-size: 13px;">팔로잉 <%=fol_ing_cnt%></a> | <a
											href="followerpage.action" class="text-secondary"
											style="font-size: 13px;">팔로워 <%=fol_ed_cnt%></a> <br> <br>
										<p class="text-secondary mb-1" style="font-size: 15px;"><%=mem_intro%></p>
										<br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 팔로잉 -->
				<div class="col-md-8" id="followingDiv">
					<div class="card mb-3">
						<div class="card-body">
							<h4>팔로잉</h4>
							<div class="album py-5 bg-light">
							<c:set var="followingList" value="<%=followingList %>" />
							<c:set var="followingpostList" value="<%=followingpostList %>" />
							<c:choose>
								<c:when test="${followingList != null }">
								<c:forEach var="following" items="<%=followingList %>">
									<div class="container">
									<div class="row" style="margin: 1%;">
										<img style="display: inline-block; object-fit: cover;"
											src="${following.follow_mem_img }"
											alt="Admin" class="rounded-circle" width="45px" height="45px">
													<h4 style="font-size: 22px;">${following.follow_mem_nnm }</h4>
												</div>
												</div>
										<c:choose>
								<c:when test="${followingpostList.get(0) != null }">
								<c:forEach var="post" items="<%=followingpostList %>">
								
									<div class="container">
								<div class="col-md-2 wrapper">
										<div class="card box-shadow frame">
											<div class="img-wrapper">
												<img class="card-img-top"
													alt="Thumbnail [100%x225]"
													style="height: 100%; width: 100%; display: block;"
													src="${post.post_img }"
													data-holder-rendered="true">
												<div class="darkness">
													<div class="btn-summary">
														<span draggable="false">${post.post_tt }
														</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
								<p style="margin-left: 70px;">작성된 게시글이 없습니다.</p>
								</c:otherwise>
							</c:choose>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<p style="margin-left: 20px;">팔로우 중인 유저가 없습니다.</p>
									</c:otherwise>
								</c:choose>
							
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<style type="text/css">
body {
	margin-top: 20px;
	color: #1a202c;
	text-align: left;
	background-color: #e2e8f0;
	font-family: 'Noto Sans KR', sans-serif;
}

.main-body {
	padding: 15px;
}

.card {
	box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0
		rgba(0, 0, 0, .06);
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

.card-body {
	flex: 1 1 auto;
	min-height: 1px;
	padding: 1rem;
}

.gutters-sm {
	margin-right: -8px;
	margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
	padding-right: 8px;
	padding-left: 8px;
}

.mb-3, .my-3 {
	margin-bottom: 1rem !important;
}

.bg-gray-300 {
	background-color: #e2e8f0;
}

.h-100 {
	height: 100% !important;
}

.shadow-none {
	box-shadow: none !important;
}

.w-90 {
	width: 90% !important;
}

html, body {
	margin: 0;
	padding: 0;
}

h3, h4 {
	font-weight: bold;
	margin-left: 1%;
}

#wrapper {
	width: 500px;
	height: 500px;
	background: #aed6e4;
}

#frame {
	width: 400px;
	height: 400px;
	background: #ffffff;
	position: relative;
	top: 50px;
	left: 50px;
}

.img-wrapper {
	width: 195px;
	height: 195px;
	cursor: pointer;
}

.img-wrapper img {
	width: inherit;
	height: inherit;
}

.darkness {
	position: absolute;
	top: 0;
	left: 0;
	width: inherit;
	height: inherit;
	transition: all .6s linear;
}

.btn-summary {
	position: absolute;
	text-align: left;
	margin: 10px;
	color: #ffffff;
	visibility: hidden;
}

.btn-summary span {
	color: #ffffff;
	user-select: none;
}

.img-wrapper:hover .darkness {
	background-color: rgba(0, 0, 0, 0.4);
}

.img-wrapper:hover .btn-summary {
	opacity: 1;
	transform: scale(1);
	visibility: visible;
}
</style>
</body>
</html>