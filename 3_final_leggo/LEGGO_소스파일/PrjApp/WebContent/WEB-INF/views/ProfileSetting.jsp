<%@page import="com.leggo.profile.ProfileDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

ProfileDTO profile = (ProfileDTO) request.getAttribute("profile");
String mem_img = profile.getMem_img();
String mem_nnm = profile.getMem_nnm();
String mem_intro = profile.getMem_intro();
%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
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

<!-- toastr css 라이브러리 -->
<link rel="stylesheet" type="text/css"
	href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />

</head>
<script type="text/javascript">

	$(function()
	{
		$('#mem_nnm').keyup(function(){
			NnmbytesHandler(this);
		});
		
		$('#mem_intro').keyup(function(){
			IntrobytesHandler(this);
		});
	});
	
	// 글자수 세기
	function getTextLength(str)
	{
		var len = 0;
	
		for (var i = 0; i < str.length; i++)
		{
			if (escape(str.charAt(i)).length == 6)
			{
				// 오라클 DB에서 한글 한 글자를 3byte로 인식하기 때문에 +=2로 설정
				len+=2;
			}
			len++;
		}
		
		return len;
	}
	
	// 별명 입력시 글자 세기
	function NnmbytesHandler(obj)
	{
		var text = $(obj).val();
		$('p.nnmbytes').text(getTextLength(text));
	}

	// 자기소개 입력시 글자 세기
	function IntrobytesHandler(obj)
	{
		var text = $(obj).val();
		$('p.introbytes').text(getTextLength(text));
	}

</script>

<body>
	<input type="hidden" value="${param.alert_message }" id="alert_message">

	<!-- 헤더 -->
	<header>
		<div style="background-color: white;">
			<c:import url="Header.jsp"></c:import>
		</div>
	</header>

	<div class="container">
		<div class="main-body" id="profilemenuDiv">

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

			<!-- 프로필 설정 -->
			<div class="card mb-3" id="profilesettingDiv">
				<div class="card-body">
					<h4 style="display: inline-block; font-weight: bold; padding: 5px;">프로필
						설정</h4>
					<a
						style="display: inline-block; float: right; color: #a6a6a6; text-decoration: underline; padding: 5px;"
						href="quitpage.action">탈퇴하기</a>
					<div class="album py-5 bg-light">
						<div class="container">
							<form action="profilesettingimg.action" method="POST"
								enctype="multipart/form-data" id="form_img">
								<table>
									<tr>
										<th>프로필 사진</th>
										<td class="mem_thumb_img"><img id="img__wrap"
											name="mem_thumb_img" class="rounded-circle" width="170"
											height="170" style="object-fit: cover;" src="<%=mem_img%>" />
											<br> <br> <input type="file" id="mem_img"
											name="mem_img" value="<%=mem_img%>" /></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<th>별명</th>
										<td><input type="text" class="form-control" id="mem_nnm"
											name="mem_nnm" value="<%=mem_nnm%>" maxlength="20"></td>
									</tr>
									<tr style="text-align: right;">
										<td></td>
										<td class="textlimit" style="display: inline-block"><p
												class="nnmbytes" style="display: inline-block">
												<%=mem_nnm.getBytes().length%></p>/20</td>
									</tr>
									<tr>
										<th>자기소개</th>
										<td><input type="text" class="form-control content"
												style="width: 300px; height: 100px;" id="mem_intro"
												name="mem_intro" maxlength="100"><%=mem_intro%></textarea></td>
									</tr>
									<tr style="text-align: right;">
										<td></td>
										<td class="textlimit" style="display: inline-block"><p
												class="introbytes" style="display: inline-block">
												<%=mem_intro.getBytes().length%></p>/100</td>
									</tr>
								</table>
								<br> <br>
							</form>
								<div class="row justify-content-center">
									<button type="button" class="btn btn-primary center submit" onclick="dataSubmit()"
										style="width: 45%; font-family: 'Noto Sans KR', sans-serif;">수정</button>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- toastr js 라이브러리 -->
	<script type="text/javascript"
		src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

	<script type="text/javascript">
	
		// url에서 파라미터 삭제
		history.replaceState({}, null, location.pathname);
		
		function dataSubmit()
		{
			//alert("테스트");
			$("#form_img").submit();
		}
		
		$(document).ready(function()
		{
			if ($("#alert_message").val() != "")
			{
				toastr.options.closeButton = true;
				toastr.options.progressBar = true;
				toastr.warning($("#alert_message").val(),
				{
					timeOut : 3000
				});
			}
		});
		
		// 변경할 프로필 사진 미리보기
		$("#mem_img").change(function(){
			
			// input 태그에 파일이 있는 경우
			if (this.files && this.files[0]){
				
				// FileReader 인스턴스 생성
				var reader = new FileReader;
				
				// 이미지 로드가 된 경우
				reader.onload = e => {
					$(".mem_thumb_img img").attr("src",e.target.result);
					//alert("변경한 이미지: "+e.target.result);
				}
				reader.readAsDataURL(this.files[0]);
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

.textlimit {
	width: 65px;
	vertical-align: bottom;
	text-align: right;
	color: #a6a6a6;
	font-size: 15px;
	display: inline-block;
}

.bytes {
	display: inline-block;
}

th {
	width: 120px;
	text-align: center;
}
</style>
</body>
</html>