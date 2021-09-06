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
	ArrayList<FollowDTO> followerList = (ArrayList) request.getAttribute("followerList");
%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>Follower.jsp</title>
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
					<div class="profile" style="position: fixed; width: 350px;">
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

				<!-- 팔로워 -->
				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body">
							<h4>팔로워</h4>
							<div class="album py-5 bg-light">
								<table class="table table-hover">
									<c:set var="followerList" value="<%=followerList%>" />
									<c:choose>
										<c:when test="${followerList != null }">
											<c:forEach var="follower" items="<%=followerList%>">
												<tr>
													<td style="border-top: none;">
														<div style="padding: 1% 3% 1% 3%;">
														
															<form action="follow.action" role="form" id="follow-form" method="POST">
															<img style="display: inline-block; object-fit: cover;"
																src="${follower.follow_mem_img }" alt="Admin"
																class="rounded-circle" width="35px" height="35px">
															<h4 class="follower_name">${follower.follow_mem_nnm }</h4>
																<input type="hidden" id="follow_mem_id" name="follow_mem_id"
																	value="${follower.follow_mem_id }">
																<c:choose>
																<c:when test="${follower.count == 1 }">
																	<button type="button" id="followBtn" class="btn btn-secondary">팔로잉</button>
																	<input type="hidden" id="follow" value="0">
																</c:when>
																<c:otherwise>
																	<button type="button" id="followBtn" class="btn btn-primary">팔로잉</button>
																	<input type="hidden" id="follow" value="1">
																</c:otherwise>
																</c:choose>
															</form>
														</div>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<p style="margin-left: 20px;">팔로우 중인 유저가 없습니다.</p>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">

	$("Button").click(function()
	{
		if($(this).attr("class") == "btn btn-primary")
		{
			$(this).attr("class","btn btn-secondary");
			$("form").submit();
		}
		else
		{
			$(this).attr("class","btn btn-primary");
			$("form").submit();
		}
	});

</script>

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

.follower_name {
	display: inline-block;
	font-size: 18px;
}

.btn {
	display: inline-block;
	margin-top: 3px;
	float: right;
}

.pt-5, .py-5 {
	padding-bottom: 1rem !important;
}
</style>
</body>
</html>