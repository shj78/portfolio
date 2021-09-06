<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>QnA.jsp</title>
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
	function dataSubmit()
	{
		$("form").submit();
	}
</script>
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

			<!-- 일대일 문의 -->
			<div class="card mb-3">
				<div class="card-body">
					<h4 style="display: inline-block; font-weight: bold; padding: 5px;">일대일
						문의</h4>
					<div class="album py-5 bg-light" id="sendqnaDiv">
						<div class="container row justify-content-center" >
							<form action="sendqna.action">
								<table>
									<tr>
										<th>문의 유형</th>
										<td><select class="form-control" id="qna_type"
											name="qna_type" style="width: 170px;">
												<option>선택</option>
												<option>회원정보 문의</option>
												<option>일정 문의</option>
												<option>여행기 문의</option>
												<option>사진 문의</option>
												<option>서비스 개선 제안</option>
												<option>시스템 오류 제보</option>
												<option>불편 신고</option>
												<option>기타 문의</option>
										</select></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<th>제목</th>
										<td><input type="text" id="qna_title" name="qna_title"
											class="form-control"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<th style="vertical-align: top;">문의 내용&nbsp;&nbsp;</th>
										<td><textarea class="form-control" id="qna_content"
												name="qna_content" style="width: 500px; height: 300px;"></textarea></td>
									</tr>
								</table>
							</form>
						</div>
						<br><br>
						<div class="container row justify-content-center"
							style="display: inline-block; text-align: center;">
							<button type="button" class="btn btn-primary"
								onclick="javascript:dataSubmit()"
								style="width: 20%; font-family: 'Noto Sans KR', sans-serif;">제출하기</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-secondary center submit"
								style="width: 20%; font-family: 'Noto Sans KR', sans-serif;"
								onclick="location.href='qnapage.action'">취소하기</button>
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

th {
	width: 80px;
}
</style>
</body>
</html>