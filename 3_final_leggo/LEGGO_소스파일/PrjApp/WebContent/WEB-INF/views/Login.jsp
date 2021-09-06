<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!doctype html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/jsh/style.css">

<!-- toastr css 라이브러리 -->
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />

<style type="text/css">
#iconchange {
	border-radius: 15px !important;
}
</style>

<!-- 구글 로그인 API -->
<!-- 
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="447693494839-5d859g9t2hvpdupbar05mii8a0c4ag1j.apps.googleusercontent.com">
 -->
 
<!-- 카카오 로그인 API -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 메일 전송 -->
<!-- 
<script type="text/javascript">
	function send_mail()
	{
		window.open("./test_mail.jsp", "",
						"width=370, height=360, resizable=no, scrollbars=no, status=no");
	}
</script>
 -->
<!-- 
<script>
	function onSignIn(googleUser)
	{
		// Useful data for your client-side scripts:
		var profile = googleUser.getBasicProfile();
		console.log("ID: " + profile.getId()); // Don't send this directly to your server!
		console.log('Full Name: ' + profile.getName());
		console.log("Image URL: " + profile.getImageUrl());
		console.log("Email: " + profile.getEmail());

		// The ID token you need to pass to your backend:
		var id_token = googleUser.getAuthResponse().id_token;
		console.log("ID Token: " + id_token);
		
		var xhr = new XMLHttpRequest();
		xhr.open('POST', '/login.action');
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send('idtoken=' + id_token);
	};
</script>
 -->
</head>
<input type="hidden" value="${param.alert_message }" id="alert_message">
<input type="hidden" value="${param.error_message }" id="error_message">
<input type="hidden" value="${param.success_message }" id="success_message">
<body class="img js-fullheight"
	style="background-image: url(images/jeju.png);">
	
	<a href="mainhome.action" style="display: inline-block; margin-left: 5px;">홈페이지로 이동</a>
	<p class="userimg" style="display: inline-block; float: right; margin-right: 10px;">Romi 님의 사진입니다.</p>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">로그인</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div aria-live="polite" aria-atomic="true"
					class="d-flex justify-content-center align-items-center w-100">
					<div class="col-md-6 col-lg-4">
						<div class="login-wrap p-0" id="LoginDiv">
							<h3 class="mb-4"
								style="text-align: right; font-size: 15px; font-family: 'Noto Sans KR', sans-serif;"
								onclick="location.href='signinpage.action';">계정이 없으신가요?
								회원가입</h3>
							<form role="form" action="login.action" class="login-form"
								method="POST">
								<div class="form-group">
									<input id="mem_id" name="mem_id" type="text"
										class="form-control" placeholder="이메일" required>
								</div>
								<div class="form-group">
									<input id="mem_pw" name="mem_pw" type="password"
										class="form-control" placeholder="비밀번호" required> <span
										toggle="#password-field"
										class="fa fa-fw fa-eye field-icon toggle-password"></span>
								</div>
								<div class="form-group">
									<button type="submit"
										class="form-control btn btn-primary submit px-3"
										style="font-family: 'Noto Sans KR', sans-serif;">로그인</button>
								</div>
								<div class="form-group d-md-flex">
									<div class="w-50">
										<label class="checkbox-wrap checkbox-primary"
											style="font-family: 'Noto Sans KR', sans-serif;">자동
											로그인<input type="checkbox" id="login_cck" name="login_cck"> <span
											class="checkmark"></span>
										</label>
									</div>
									<div class="w-50 text-md-right">
										<a href="/PrjApp/FindPw.jsp"
											style="color: #fff; font-family: 'Noto Sans KR', sans-serif;">비밀번호
											찾기</a>
									</div>
								</div>
							</form>
							<br>
							<p class="w-100 text-center"
								style="font-family: 'Noto Sans KR', sans-serif; font-size: 15px;">&mdash;
								SNS 계정으로 편하게 로그인하기 &mdash;</p>
							<div class="social d-flex text-center">
								<!-- 구글 로그인 -->
								<!--
								<div class="googlelogin g-signin2 iconchange" data-width="150"
								data-height="50" data-onsuccess="onSignIn"></div>
								-->
								<!-- 카카오 로그인 -->
								<a href="javascript:kakaoLogin();"><img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jsh/jquery.min.js"></script>
	<script src="js/jsh/popper.js"></script>
	<script src="js/jsh/bootstrap.min.js"></script>
	<script src="js/jsh/main.js"></script>
	<!-- toastr js 라이브러리 -->
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

	<script type="text/javascript">
	
		// url에서 파라미터 삭제
		history.replaceState({}, null, location.pathname);
	
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
			
			if ($("#error_message").val() != "")
			{
				toastr.options.closeButton = true;
				toastr.options.progressBar = true;
				toastr.error($("#error_message").val(),
				{
					timeOut : 3000
				});
			}
			
			if ($("#success_message").val() != "")
			{
				toastr.options.closeButton = true;
				toastr.options.progressBar = true;
				toastr.success($("#success_message").val(),
				{
					timeOut : 3000
				});
			}

		});
	</script>

<script type='text/javascript'>
 
	window.Kakao.init("a76949096713e82c75fa45bdb32ebb4c");
	var kakao_id = "";
 
	// 카카오 로그인 버튼 생성
	function kakaoLogin()
	{
		window.Kakao.Auth.login({
			scope: 'profile_nickname, profile_image, account_email',
			success: function(authObj){
				window.Kakao.API.request({
					url: '/v2/user/me',
					success: res => {
						var kakao_account = res.kakao_account;
						var access_token = Kakao.Auth.getAccessToken();
						$("#kakao_id").attr("value",kakao_account.email);
						$("#kakao_access_token").attr("value",access_token);
						$("#kakao_form").submit();
					}
				});
			}
		});
	}

</script>
<form action="loginkakao.action" id="kakao_form" method="GET">
	<input type="hidden" id="kakao_id" name="kakao_id" value="">
	<input type="hidden" id="kakao_access_token" name="kakao_access_token" value="">
</form>

<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</body>
</html>