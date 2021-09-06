<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>LEGGO</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/css-lsr/bootstrap-theme.css">
<link rel="stylesheet" href="assets/css/css-lsr/main.css" />

<style type="text/css">
	.dropbtn {
  background-color: Silver;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: black;}
</style>

</head>
<body>

<!-- 헤더 -->
<header>	
		<div style="background-color: white;">
			<c:import url="ComHeader.jsp"></c:import>
	</div>
</header>
	
	<div class="container">
		<div class="main-body">
			<!-- 상단 메뉴 -->
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="mainhome.action">커뮤니티 홈</a></li>
					<li class="breadcrumb-item"><a href="comtripfeed.action">여행기</a></li>
					<li class="breadcrumb-item"><a href="complanfeed.action">일정 구경</a></li>
					<li class="breadcrumb-item"><a href="comphotofeed.action">사진</a></li>
				</ol>
			</nav>
			
			
			<!-- 필터링 -->
			<div class="dropdown">
                 <button class="dropbtn" style="width: 70px; height: 35px; font-size: 11px; padding: 0.0em 1.5em;">정렬▼</button>
                 <div class="dropdown-content">
                   <a href="#">인기순</a>
                   <a href="#">최신순</a>
                 </div>
            </div>
            
            
			<table>
				<tr>
					<td>전체 글 5,290</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div id="features-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-4 col-12-medium">

					<!-- Box -->
						<section class="box feature">
							<p><img src="images\user.PNG">Romi</p>
							<a href="#" class="image featured"><img src="images/photo1.jpg" onclick="location.href='/PrjApp/ComPhoto.jsp';"></a>
							<div class="inner">
								<header>
									<!-- <h2><br>맑은 바다 어딘지 궁금하면 클릭</h2> -->
									<p><br>스크랩 1,212 조회수 10,433</p>
								</header>
							</div>
						</section>

				</div>
				<div class="col-4 col-12-medium">

					<!-- Box -->
						<section class="box feature">
							<p><img src="images\user.PNG">deapsea</p>
							<a href="#" class="image featured"><img src="images/photo2.jpg" alt="" /></a>
							<div class="inner">
								<header>
									<!-- <h2><br>도깨비 주인공 나야나</h2> -->
									<p><br>스크랩 350 조회수 7,073</p>
								</header>
							</div>
						</section>

				</div>
				<div class="col-4 col-12-medium">

					<!-- Box -->
						<section class="box feature">
							<p><img src="images\user.PNG">mong2unni</p>
							<a href="#" class="image featured"><img src="images/photo1.jpg" alt="" /></a>
							<div class="inner">
								<header>
									<!-- <h2><br>장관이네요 절경이고요</h2> -->
									<p><br>스크랩 460 조회수 5,290</p>
								</header>
							</div>
						</section>

				</div>
			</div>
		</div>
	</div>
	
	<div id="features-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-4 col-12-medium">

					<!-- Box -->
						<section class="box feature">
							<p><img src="images\user.PNG">Romi</p>
							<a href="#" class="image featured"><img src="images/photo2.jpg" alt="" /></a>
							<div class="inner">
								<header>
									<!-- <h2><br>맑은 바다 어딘지 궁금하면 클릭</h2> -->
									<p><br>스크랩 1,212 조회수 10,433</p>
								</header>
							</div>
						</section>

				</div>
				<div class="col-4 col-12-medium">

					<!-- Box -->
						<section class="box feature">
							<p><img src="images\user.PNG">deapsea</p>
							<a href="#" class="image featured"><img src="images/photo1.jpg" alt="" /></a>
							<div class="inner">
								<header>
									<!-- <h2><br>도깨비 주인공 나야나</h2> -->
									<p><br>스크랩 350 조회수 7,073</p>
								</header>
							</div>
						</section>

				</div>
				<div class="col-4 col-12-medium">

					<!-- Box -->
						<section class="box feature">
							<p><img src="images\user.PNG">mong2unni</p>
							<a href="#" class="image featured"><img src="images/photo2.jpg" alt="" /></a>
							<div class="inner">
								<header>
									<!-- <h2><br>장관이네요 절경이고요</h2> -->
									<p><br>스크랩 460 조회수 5,290</p>
								</header>
							</div>
						</section>

				</div>
			</div>
		</div>
	</div> --%>
	
	
	<!--------------- 새롬이 뷰페이지에 복붙 시작---------------->

	<!-- 카드 리스트 -->
	
	<!-- 
	======= card Section =======
	<section id="card-list" class="card-list">
	    <div class="container">
	        <div class="row card-list-container thumbnails"></div>
	
	    </div>
	</section>
	
	로딩 중 이미지
	======= card Section 끝 =======	
	
	<div class="back-drop">
   		 로딩 중 이미지
    	<img src="http://www.kipi.or.kr/ipis/images/enkisoft/loading.gif"/> 
	</div>
	
	-->

	
	<!--------------- 새롬이 뷰페이지에 복붙 종료---------------->
	
	
	
	
	<!-- Footer -->
	<footer>
		<c:import url="Footer.jsp"></c:import>
	</footer>

</body>

<script>

	
	/* $(document).ready(function(){ 
		console.log("inscroll"+currentPage);
		GetList(currentPage);
	});


	//페이지가 처음 로딩될 때 1page를 보여주기 때문에 초기값을 1로 지정한다.
	var currentPage=1;
	//현재 페이지가 로딩중인지 여부를 저장할 변수이다.
	var isLoading=false;
	
	//웹브라우저의 창을 스크롤 할 때 마다 호출되는 함수 등록
	$(window).on("scroll",function()
	{
	    //위로 스크롤된 길이
	    var scrollTop=$(window).scrollTop();
	    //웹브라우저의 창의 높이
	    var windowHeight=$(window).height();
	    //문서 전체의 높이
	    var documentHeight=$(document).height();
	    //바닥까지 스크롤 되었는 지 여부를 알아낸다.
	    var isBottom=scrollTop+windowHeight + 10 >= documentHeight;
	
	    if(isBottom)
	    {
	        //만일 현재 마지막 페이지라면
	        if(currentPage == ${totalPageCount} || isLoading)
	        {
	            return; //함수를 여기서 끝낸다.
	        }
	        //현재 로딩 중이라고 표시한다.
	        isLoading=true;
	        //로딩바를 띄우고
	        $(".back-drop").show();
	        //요청할 페이지 번호를 1 증가시킨다.
	        currentPage++;
	        //추가로 받아올 페이지를 서버에 ajax 요청을 하고
	        console.log("inscroll"+currentPage);
	        GetList(currentPage);
	
	    }; 
	};
	
	/*==========ajax==========================================*/
	/* const GetList = function(currentPage){
	    console.log("inGetList : "+currentPage);
	
	
	    // 무한 스크롤
	    $.ajax({
	        url:"ajax_page.action",
	        method:"GET",
	        //검색기능이 있는 경우 condition과 keyword를 함께 넘겨줘야한다. 안그러면 검색결과만 나와야하는데 다른것들이 덧붙여져 나온다.
	        data:"pageNum="+currentPage,
	        //ajax_page.jsp의 내용이 data로 들어온다.
	        success:function(data){
	            console.log(data);
	            //응답된 문자열은 html 형식이다.(picture/ajax_page.jsp에 응답내용이 있다.)
	            //해당 문자열을 .card-list-container  div에 html로 해석하라고 추가한다.
	            $(".card-list-container").append(data);
	            //로딩바를 숨긴다.
	            $(".back-drop").hide();
	            //로딩중이 아니라고 표시한다.
	            isLoading=false;
	            console.log("ajax");
	        });

	    };  */

</script>
</html>