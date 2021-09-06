<%@page import="java.util.ArrayList"%>
<%@page import="com.leggo.qna.QnaDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	ArrayList<QnaDTO> qnalist = (ArrayList)request.getAttribute("qnalist");
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
	$(function()
	{
		$('.contents tr').hide();
		$('.contents').find('.title').parent().show();
		$('.contents .title').parent().click(function()
		{
			$('.contents tr').hide();
			$('.contents').find('.title').parent().show();

			var tr = $('.contents tr');
			var rindex = $(this).parent().children().index(this);

			$(this).children().css('color', '#2E9AFE');

			for (var i = rindex; i < rindex + 2; i++)
			{
				$(tr[i]).show();
				$(tr[rindex + 1]).css('background-color', '#fff');
			}

			$(tr[rindex]).click(function()
			{
				$(this).children().css('color', '#000');
				$(tr[rindex + 1]).hide();
			});
		});

	});
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
					<!-- <li class="breadcrumb-item"><a href="myscrappage.action">스크랩북</a></li> -->
					<li class="breadcrumb-item">일대일
							문의</li>
				</ol>
			</nav>

			<!-- 일대일 문의 -->
			<div class="card mb-3" id="qnaDiv">
				<div class="card-body">
					<h4 style="display: inline-block; font-weight: bold; padding: 5px;">일대일
						문의 목록</h4>
					<div class="album py-5 bg-light">
						<div class="row justify-content-center">
							<button type="submit" class="btn btn-primary submit "
								style="width: 20%; font-family: 'Noto Sans KR', sans-serif;"
								onClick="location.href='sendqnapage.action'">문의하기</button>
						</div>
						<br> <br>
						<div class="container row justify-content-center"
							style="margin: auto; width: 90%;">
							<table class="table table-hover contents"
								style="table-layout: fixed;">
								<tr style="background-color: white;">
									<th class="title" style="width: 50px;">번호</th>
									<th style="width: 150px;">문의 유형</th>
									<th style="width: 350px;">제목</th>
									<th style="width: 80px;">문의 일시</th>
									<th style="width: 80px;">처리 상태</th>
								</tr>
								<c:forEach var="list" items="<%=qnalist%>" varStatus="status">
								<tr>
									<td class="title">${status.count}</td>
									<td>${list.qna_type}</td>
									<td class="title_select">${list.qna_title}</td>
									<td>${list.qna_date}</td>
									<td><c:choose>
											<c:when test="${list.qna_count == 0}">
												<span class="badge badge-secondary" style="font-size: 12px;">미완료</span></td>
											</c:when>
											<c:otherwise>
												<span class="badge badge-success" style="font-size: 12px;">답변완료</span></td>
											</c:otherwise>
										</c:choose>
								</tr>
								<tr style="display: none;">
									<td class="conts"></td>
									<td colspan="3" style="text-align: left;"><b>문의 내용</b><br>
										${list.qna_content }<br>
									<td></td>
								</tr>
								</c:forEach>
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

table {
	text-align: center;
}

table th {
	text-align: center;
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