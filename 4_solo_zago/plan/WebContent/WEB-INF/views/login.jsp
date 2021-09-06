<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String keyword = "sss";	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자, 가보자고</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="assets/css/shj/style.css" />
<script>

</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
*
{
		font-family: 'Noto Sans KR', sans-serif;
		
}

form {
  width: 100%;
  max-width: 500px;
  /* background:#fafafa; */
  /* -webkit-box-shadow: 0px 0px 96px 0px rgba(0,0,0,0.75); */
  /* -moz-box-shadow: 0px 0px 96px 0px rgba(0,0,0,0.75); */
  /* box-shadow: 0px 0px 96px 0px rgba(0,0,0,0.75); */
  min-height: 250px;
}

form input {
    width: 100%;
    height: 28px;
    margin-bottom: 15px;
    padding: 5px;
    font-size: 17px!important;
    letter-spacing: 2px;
}

//----------------------------------------------------

#menu_wrap {position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    width: 40%;
    height: 50% !important;
    margin: 50px auto;
    padding: 5px;
    background: rgba(255, 255, 255, 0.7);
    z-index: 1;
    font-size: 12px;
    border-radius: 10px;
    top: 45% !important;
    left:30% !important;
    right:50% !important;
}
.bg_white {background:#fff;}
#menu_wrap hr {
    display: block;
    height: 1px;
    border: 0;
    border-top: 2.5px solid #d9dade;
    margin: 3px 0;
}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {

    margin: 0px 0px 10px 0px;
    font-size: xx-large;
    font-weight: bold;
    letter-spacing: 3px;

}  
#menu_wrap .option button {margin-left:5px;}

//------------------------
h5 {
    display: block;
    font-size: 0.83em !important;
    margin-block-start: 1em !important;
    margin-block-end: 1em !important;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
//------------------------
.button {
  width: 140px !important;
  height: 45px!important;
  font-family: 'Roboto', sans-serif !important;
  font-size: 11px !important;
  text-transform: uppercase!important;
  letter-spacing: 2.5px!important;
  font-weight: 500!important;
  color: #000!important;
  border: none!important;
  border-radius: 45px!important;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1)!important;
  transition: all 0.3s ease 0s!important;
  cursor: pointer!important;
  outline: none!important;
  }


/* 로그인 시작*/
.sign_box {
    width: 500px;
    background: white;
    border-radius: 30px;
    border: 1px solid rgba(0, 0, 0, 0.1);
    text-align: center;
    padding: 60px;
    /* padding-bottom: 30px; */
    box-shadow: 1px 1px 50px 0 #dcdddd;
    box-sizing: border-box;
}  
.xxl_title {
    font-size: 40px;
    font-weight: 800;
}
.h_color {
    color: black;
   
}
.sign_box .input_box {
    padding: 20px;
}

.input_box .margin_box {
    margin: 10px 0 20px 0;
}
.id_pwd_box input, .sign_info_box input, .input_box input {
    border: none;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    width: 100%;
    padding: 10px 0;
}
.main_container {
    padding: 0px 50px 50px 50px !important;
    display: flex !important;
    flex-direction: column!important;
    align-items: center!important;
    max-width: 1200px!important;
    margin: 0 auto!important;
    min-height: calc(100vh - 57px)!important;
    /* min-width: 650px; */
}

.center_box {
    padding: 60px 0;
}

section {
    background-color: aqua;
}

.sign_btn {
    width: 100%;
    height: 40px;
    border-radius: 15px;
    background-color: #7fdeaa;;
    border: none;
    font-size: 20px;
    box-shadow: 0 1px 0 rgb(27 31 35 / 4%), inset 0 1px 0 hsl(0deg 0% 100% / 25%);
    
    }
    
.nav-item {;
font-weight: normal !important;
}

header {

    padding: 115px 20px 0px 30px;

}

/* 로그인 종료*/

//--------------------------------------

</style>
</head>


<body>
	

<!-- 	<form>
		<h2>일정 시작지 검색</h2>
		<input type="text" placeholder="Test input"> <input
			type="text" placeholder="Test input 2">
	</form> -->
		<header>

			<div class = "b_text">
			<a href="/WebContent/main.action">
				<img src="images/logo_zago.png" style="height:90px !important; text-align: center;" alt="Za, GO." />
			</a>
			</div>
		</header>	
		
	<div>

	
	    <div class="bg_white main_container">
	        <div class="center_box">
	            <div class="sign_box">
		            <div class="xxl_title h_color">로그인</div>
		                <form  method="post">
		                	<div class="input_box">
								<input type="text" class="margin_box" name="username" maxlength="150" required id = "id_username" placeholder="아이디">
								<input type="password" class="margin_box" name="password" maxlength="128" required id = "id_password" placeholder="비밀번호">
							</div>
		                    <button type="submit" class="sign_btn" style="letter-spacing: 1px; color:black; cursor: pointer!important;">로그인</button> 
		                    <!-- <button type="submit" class="button" onclick="location.href='writeplan.action?';" style=" width: 140px !important; height: 45px!important;   background-color: #fff; border: none!important; border-radius: 45px!important; box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1)!important; cursor: pointer;">일정작성 하기</button>  -->
		                     
	
		                	<div style="letter-spacing: 1px;  font-size: 14px!important; text-align: center !important; color: gray;     padding: 10px;">아직 회원이 아니신가요? <a href="" style="color: black!important; text-decoration: none;">회원가입하기</a></div>
	                </form>
	            </div>
	        </div>
	       
	        

	    </div>
	</div>
</body>


</html>