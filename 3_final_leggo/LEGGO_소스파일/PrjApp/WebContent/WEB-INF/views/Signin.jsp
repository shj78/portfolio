<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!doctype html>
<html lang="en">
<head>
<title>Signin.jsp</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">

body
{
	font-family: 'Noto Sans KR', sans-serif;" 
}

a {
  color: #ffffff;
  text-decoration: underline;
  background-color: transparent; }
  a:hover {
    color: #0088ff; }

</style>

<script type="text/javascript">

   function Login()
   {
             //아이디 입력 문자수를 4~12자로 제한하는 조건문
             if (document.getElementById("mem_id").value.length < 4 || document.getElementById("mem_id").value.length > 12)
             {
             	  	$("#message").attr("value","아이디는 4~12자 이내로 입력해야 합니다.");

             	  	document.getElementById("mem_id").select();
              		return;
             }

            //입력된 문자의 길이만큼 루프를 돌면서 검사 

            for (i=0; i<document.getElementById("mem_id").length; i++)
            {
                   var ch = document.getElementById("mem_id").charAt(i);//문자를 반환(정수형), 범위 검사 가능

                   //입력된 문자를 검사

                   if ( ( ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9" ) )
                   {
                	   	$("#message").attr("value","아이디는 영문 소문자로만 입력 가능 합니다!");
                	   	document.getElementById("mem_id").select();
                    	return;
                   }
            }

            //입력된 첫번째 문자가 숫자인지 검사하는 조건문

            if (!isNaN(document.getElementById("mem_id").value.substr(0,1)))

            {
            	 $("#message").attr("value","아이디는 숫자로 시작할 수 없습니다.");
            	 document.getElementById("mem_id").select();
                 return;
            }

            if (document.getElementById("mem_pw").length < 4 || document.getElementById("mem_pw").length > 12)
            {
            	$("#message").attr("value","비밀번호는 4~12자 이내로 입력해야 합니다.");
            	document.getElementById("mem_pw").select();
                return;
            }

//   $("#signin-form").submit();
   }
   
	function check()
	{
		var mem_id = document.getElementById("mem_id").value;
		var mem_nnm = document.getElementById("mem_nnm").value;
		var mem_pw = document.getElementById("mem_pw").value;
		var mem_pw_ck = document.getElementById("mem_pw_ck").value;
		var agreecheck = document.getElementById("agreecheck").value;
		
		
		$.ajax({
			url : 'Login.jsp',
			type : 'get',
			success : function(data) {
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					}
				}, error : function() {
						console.log("실패");
				}
			});
		
		ajax.send("");
	}
	
	function toast(message)
	{
		toastr.options.closeButton = true;
		toastr.options.progressBar = true;
		toastr.alert(message,
		{
			timeOut : 3000
		});
	}

</script>

</head>
<input type="hidden" value="" id="message">
<body class="img js-fullheight" style="background-image: url(images/gyeongju.jpg);">
<a href="mainhome.action" style="display: inline-block; margin-left: 5px; color: #aea3b8 !important; text-decoration: none;">홈페이지로 이동</a>
<p class="userimg" style="display: inline-block; float: right; margin-right: 10px;">Eun J 님의 사진입니다.</p>

<section class="ftco2-section">
<br>
		<div class="container" style="padding: 50px;">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section" style="font-family: 'Noto Sans KR', sans-serif;">회원가입</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0" id="signinDiv">
						<form action="signin.action" role="form" class="signin-form" id="signin-form">
							<div class="form-group">
								<input id="mem_id" name="mem_id" type="text" class="form-control" placeholder="이메일"
									required>
								<span id="result"></span>
							</div>
							<div class="form-group">
								<input id="mem_nnm" name="mem_nnm" type="text" class="form-control" placeholder="별명"
									required>
							</div>
							<div class="form-group">
								<input id="mem_pw" name="mem_pw" type="password" class="form-control"
									placeholder="비밀번호" required> <span
									toggle="#password-field"
									class="fa fa-fw fa-eye field-icon toggle-password"></span>
							</div>
							<div class="form-group">
								<input id="mem_pw_ck" name="mem_pw_ck" type="password" class="form-control"
									placeholder="비밀번호 확인" required> <span
									toggle="#password-field"
									class="fa fa-fw fa-eye field-icon toggle-password"></span>
							</div>
							<div class="text-center">
								 <label style="font-size: 14px;">
								 <input type="checkbox" id="agreecheck" style="width: 13px; height: 13px;" value="agreed">&nbsp;&nbsp;LEGGO의
								 <a href="https://www.notion.so/plmaq11/183c288a585046de87feb3c606aaa1b4">이용약관</a>과&nbsp;
								 <a href="https://www.notion.so/plmaq11/942040484c324c34a3c838623213c271">개인정보 취급방침</a>을 확인하고 이에 동의합니다.</label>
							</div>
							<div class="form-group">
								<br>
								<button type="button" onclick="check()"
									class="form-control btn2 btn2-primary px-3">회원가입</button>
							</div>
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
	<script type="text/javascript" src="js/jsh/ajax.js"></script>
	<!-- toastr js 라이브러리 -->
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	
	<script>
		$(document).ready(function()
		{
			if ($("#message").val() != "")
			{
				toastr.options.closeButton = true;
				toastr.options.progressBar = true;
				toastr.alert($("#message").val(),
				{
					timeOut : 3000
				});
			}
		});
	</script>
	 
	<script type="text/javascript">

		// url에서 파라미터 삭제
		history.replaceState({}, null, location.pathname);

	</script>

<style type="text/css">

body {
	font-family: 'Noto Sans KR', sans-serif;
}

</style>
</body>
</html>