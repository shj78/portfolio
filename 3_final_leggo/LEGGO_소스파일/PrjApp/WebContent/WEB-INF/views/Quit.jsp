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
<title>Quit.jsp</title>
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
</head>

<!-- 보유한 로그인 세션이 없을 경우 로그인 페이지로 이동 -->
<% if (session.getAttribute("mem_id") == null) { %>
      <script>location.href = "loginpage.action"; </script>
<% }%>

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

			<!-- 회원 탈퇴 -->
			<div class="card mb-3">
				<div class="card-body" id="quitDiv">
					<h4 style="display: inline-block; font-weight: bold; padding: 5px;">회원
						탈퇴</h4>
					<div class="album py-5 bg-light">
						<div class="container row justify-content-center">
							<div class="quit_box">
								<h4 style="clear: right; font-weight: bold;">탈퇴 전 안내 사항</h4>
							</div>
							<span class="border border-secondary"
								style="padding: 20px; width: 650px; background-color: white; border-radius: 10px;">
								<h5 style="font-weight: bold;">회원 탈퇴 시 처리 내용</h5>
								<ul>
									<li>소비자보호에 관한 법률 제6조에 의거,계약 또는 청약철회 등에 관한 기록은 5년, 소비자의 불만
										또는 분쟁처리에 관한 기록은 3년 동안 보관됩니다. 동 개인정보는 법률에 의한 보유 목적 외에 다른 목적으로는
										이용되지 않습니다.</li>
								</ul>
								<h5 style="font-weight: bold;">회원 탈퇴 시 게시물 관리</h5>
								<ul>
									<li>회원 탈퇴 후 LEGGO 서비스에 입력한 게시물 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해
										작성자 본인을 확인할 수 없으므로 게시물 편집 및 삭제 처리가 원천적으로 불가능 합니다.</li>
									<li>게시물 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제 하신 후 탈퇴를 신청하시기 바랍니다.</li>
								</ul>
								<h5 style="font-weight: bold;">회원 탈퇴 후 재가입 규정</h5>
								<ul>
									<li>회원 탈퇴 시 개인정보보호법에 의거하여 6개월 간 회원 정보를 보관한 후 삭제합니다. 따라서
										6개월 이내에는 이전 이메일로 재가입이 불가능한 점 유의 바랍니다.</li>
								</ul>
							</span>
						</div>
						<div class="text-center">
							<label style="font-size: 17px;"> <input type="checkbox"
								id="agreecheck" style="width: 15px; height: 13px;"
								value="agreed">&nbsp;&nbsp; 상기 내용을 확인하였으며 이에 동의합니다. <span
								style="color: red;">(필수)</span></label>
						</div>
						<br>
						<br>
						<br>
						<div class="container row justify-content-center">
							<div class="quit_box">
								<h4 style="clear: right; font-weight: bold;">
									탈퇴 사유 선택 <span style="font-size: 17px;">(복수선택 가능)</span>
								</h4>
							</div>
							<span class="border border-secondary"
								style="padding: 20px; width: 650px; background-color: white; border-radius: 10px;">
								<label style="font-size: 17px;"> <input type="checkbox"
									id="agreecheck" style="width: 15px; height: 15px;"
									value="agreed">&nbsp;&nbsp; 이용빈도 낮음
							</label><br> <label style="font-size: 17px;"> <input
									type="checkbox" id="agreecheck"
									style="width: 15px; height: 15px;" value="agreed">&nbsp;&nbsp;
									재가입
							</label><br> <label style="font-size: 17px;"> <input
									type="checkbox" id="agreecheck"
									style="width: 15px; height: 15px;" value="agreed">&nbsp;&nbsp;
									콘텐츠 부족
							</label><br> <label style="font-size: 17px;"> <input
									type="checkbox" id="agreecheck"
									style="width: 15px; height: 15px;" value="agreed">&nbsp;&nbsp;
									개인정보보호
							</label><br>
							</span>
						</div>
						<br>
						<br>
						<br>
						<div class="row justify-content-center">
							<button type="submit" class="btn btn-primary"
								style="width: 20%; font-family: 'Noto Sans KR', sans-serif;">취소하기</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-secondary center submit"
								style="width: 20%; font-family: 'Noto Sans KR', sans-serif;">탈퇴하기</button>
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

.quit_box {
	width: 650px;
}

.border {
	color: #4a4a4a;
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