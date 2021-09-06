<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>ProfileSetting.jsp</title>
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
					<li class="breadcrumb-item"><a href="myphotopage.action">내
							사진</a></li>
					<li class="breadcrumb-item"><a href="mycommentpage.action">내
							댓글</a></li>
					<li class="breadcrumb-item"><a href="myscrappage.action">스크랩북</a></li>
					<li class="breadcrumb-item"><a href="qnapage.action">일대일
							문의</a></li>
				</ol>
			</nav>

			<!-- 비밀번호 변경 -->
			<div class="card mb-3">
				<div class="card-body" id="pwdSettingDiv">
					<h4 style="display: inline-block; font-weight: bold; padding: 5px;">비밀번호
						변경</h4>
					<div class="album py-5 bg-light">
						<div class="container row justify-content-center">
							<table>
								<tr>
									<th>새 비밀번호</th>
									<td><input type="password" class="form-control"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th>비밀번호 확인&nbsp;&nbsp;</th>
									<td><input type="password" class="form-control"></td>
								</tr>
								<tr>
									<td><br></td>
								</tr>
								<tr>
									<td colspan="2">
										<p class="text-secondary mb-1 text-center">
											비밀번호는 영어 대문자와 소문자, 숫자를 포함하여<br>8자 이상 15자 미만으로 입력해주세요.
										</p>
										<br>
									<br>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="row justify-content-center">
											<button type="submit" class="btn btn-primary submit "
												style="width: 60%; font-family: 'Noto Sans KR', sans-serif;">수정</button>
										</div>
									</td>
								</tr>
							</table>
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