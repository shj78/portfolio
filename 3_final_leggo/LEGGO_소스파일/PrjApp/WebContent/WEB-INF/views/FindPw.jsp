<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!doctype html>
<html lang="en">
<head>
<title>FindPw</title>
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

<script type="text/javascript">

	<!-- 메일 전송 -->
	function send_mail(){
	    window.open("./test_mail.jsp", "", "width=370, height=360, resizable=no, scrollbars=no, status=no");
	}

	window.onload = function()
	{
		function onClick()
		{
		    document.querySelector('.modal_wrap').style.display ='block';
		    document.querySelector('.black_bg').style.display ='block';
		}   
		
		function offClick()
		{
		    document.querySelector('.modal_wrap').style.display ='none';
		    document.querySelector('.black_bg').style.display ='none';
		}

		document.getElementById('modal_btn').addEventListener('click', onClick);
		document.querySelector('.modal_close').addEventListener('click', offClick);

	};

</script>

<!-- 팝업 -->
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}

html, body {
	margin: 0;
	padding: 0;
}

.modal_wrap {
	display: none;
	width: 500px;
	height: 280px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background: #eee;
	z-index: 2;
}

.black_bg {
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 1;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}
</style>

</head>
<body class="img js-fullheight"
	style="background-image: url(images/gangneung.jpg);">
	<p class="userimg">mong2unnie 님의 사진입니다.&nbsp;&nbsp;&nbsp;</p>
	<section class="ftco1-section">
		<div class="container" style="padding: 50px;">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<br>
					<br>
					<br>
					<br>
					<h2 class="heading-section"
						style="font-family: 'Noto Sans KR', sans-serif;">비밀번호 찾기</h2>
				</div>
			</div>
			<br>
			<br>
			<div class="row justify-content-center">
				<!-- 
				<div class="col-md-6 text-center mb-5">
					<div class="text-center" style="width: 450px; background-color: rgba( 255, 255, 255, 0.7 ); color: #000000; border-radius: 10px;">
						<br>가입하신 이메일을 입력해주세요.<br>임시 비밀번호를 보내드립니다.<br><br>
					</div>
				</div>
				 -->
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0" id="findPwDiv">
						<form action="#" class="signin-form">
							<div class="form-group">
								<h6 class="text-center" style="color: white">가입하신 이메일을
									입력해주세요.</h6>
								<input type="text" class="form-control"
									style="background-color: rgba(255, 255, 255, 0.2);"
									placeholder="이메일" required>
							</div>
							<br>
							<br>
							<div class="form-group">
								<!-- onclick="send_mail()" -->
								<button type="button"
									class="form-control btn3 btn3-primary submit px-3"
									id="modal_btn" onclick="send_mail()">메일 전송</button>
								<div class="black_bg"></div>
								<div class="modal_wrap" style="border-radius: 10px;">
									<div class="modal_close">
										<a href="#">close</a>
									</div>
									<div class="text-center"
										style="padding: 100px; color: black; font-size: 20px;">
										임시 비밀번호가 발송되었습니다.<br>메일함을 확인해주세요.
									</div>
									<div></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jsh/jquery.min.js"></script>
	<script src="js/jsh/popper.js"></script>
	<script src="js/jsh/bootstrap.min.js"></script>
	<script src="js/jsh/main.js"></script>

</body>
</html>