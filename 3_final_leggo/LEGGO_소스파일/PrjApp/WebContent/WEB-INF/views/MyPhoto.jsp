<%@page import="java.util.ArrayList"%>
<%@page import="com.leggo.myphoto.MyPhotoDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	ArrayList<MyPhotoDTO> myphotolist = (ArrayList)request.getAttribute("myphotolist");
%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>MyPhoto.jsp</title>
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
<script type="text/javascript">
	$(document).ready(
			function()
			{
				$(".filter-dropdown, .text-button").click(function()
				{
					$(".edit-filter-modal").toggleClass("hidden");

				});
				$(".apply-button").click(
						function()
						{
							$(".edit-filter-modal").toggleClass("hidden");
							$(".filter, .filter-remove, .fa-plus, .fa-filter")
									.toggleClass("filter-hidden");
							$(".filter-dropdown-text").text("Add filter");

						});

				$(".filter-remove").click(
						function()
						{
							$(".filter, .filter-remove, .fa-plus, .fa-filter")
									.toggleClass("filter-hidden");
							$(".filter-dropdown-text").text("Filter dataset");
						});
			});
</script>

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

			<!-- 상단 메뉴 -->
			<nav aria-label="breadcrumb" class="main-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="profilepageauto.action">마이
							페이지</a></li>
					<li class="breadcrumb-item"><a href="myplanpage.action">내
							일정</a></li>
					<li class="breadcrumb-item"><a href="mytrippage.action">내
							여행기</a></li>
					<li class="breadcrumb-item">내
							사진</li>
					<li class="breadcrumb-item"><a href="mycommentpage.action">내
							댓글</a></li>
					<li class="breadcrumb-item"><a href="myscrappage.action">스크랩북</a></li>
					<li class="breadcrumb-item"><a href="qnapage.action">일대일
							문의</a></li>
				</ol>
			</nav>

			<!-- 사진 -->
			<div class="card mb-3">
				<div class="card-body">
					<h4 style="font-weight: bold; display: inline-block; padding: 5px;">내
						사진</h4>

					<select class="form-control"
						style="display: inline-block; float: right; width: 120px;">
						<option>정렬</option>
						<option>최신순</option>
						<option>스크랩순</option>
						<option>조회순</option>
					</select> <br>

					<div class="album py-5 bg-light">
						<div class="container">
							<div class="row">
							<c:set var="myphotolist" value="<%=myphotolist %>" />
							<c:choose>
								<c:when test="${myphotolist != null }">
								<c:forEach var="myphoto" items="<%=myphotolist %>">
									<div style="width: 30%; padding: 10px; margin-left:8px;">
											<div class="card mb-4 box-shadow">
												<img class="card-img-top"
													src="${myphoto.pht_url}"
													alt="Thumbnail [100%x225]"
													style="height: 100%; width: 100%; display: block;"
													data-holder-rendered="true">
												<div class="card-body">
													<p class="card-text" style="margin-left: 10px;"></p>
													<div
														class="d-flex justify-content-between align-items-center">
														<div class="btn-group">
															<button type="button"
																class="btn btn-sm btn-outline-secondary">View</button>
															<button type="button"
																class="btn btn-sm btn-outline-secondary">Edit</button>
														</div>
														<small class="text-muted">${myphoto.pp_dt}</small>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<p style="margin-left: 20px;">작성한 게시글이 없습니다.</p>
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

html, body {
	margin: 0;
	padding: 0;
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
</style>
</body>
</html>