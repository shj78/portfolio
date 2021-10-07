<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String keyword = request.getParameter("keyword");
%>

<!DOCTYPE html>
<html>

<head>
<title>일정 작성 하기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	
<link rel="stylesheet" href="assets/css/shj/main.css" />
<link rel="stylesheet" href="assets/css/shj/style.css" />
<link rel="stylesheet" href="assets/css/shj/slideleft.css" />
<link rel="stylesheet" href="assets/css/shj/bootstrap.css" />
<link rel="stylesheet" href="assets/css/shj/bootstrap.css.map" />
<link rel="stylesheet" href="assets/css/shj/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/shj/fontawesome-all.min.css" />
<link rel="stylesheet" href="assets/css/shj/bootstrap-theme.css" />
<link rel="stylesheet" href="assets/css/shj/bootstrap-theme.css.map" />

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
    integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
    crossorigin="anonymous" />


<!-- 달력 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- jQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>

<body class="is-preload">

	<div id="header">
	
		<header>

			<div class = "nav_container b_text">
			<a href="main.action">
				<img src="images/logo_zago.png" style="height:70px !important" alt="Za, GO." />
			</a>
				<div class="hor_category l_text">
					<div class="main_category">
						<ul class="navbar">
<!-- 							<li class="nav-item">
								<a href="">자고 소개</a>
							</li> -->
							<li class="nav-item">
								<!-- <a href="">자고 이용 안내</a> -->
							</li>
							<li class="nav-item">
								<!-- <a href="">FAQ</a> -->
							</li>
						</ul>
					</div>		
					
					<div class="account_category">
						<ul class="navbar">
							<li class="nav-item">
								<a href="">로그인</a>
							</li>
							<li class="nav-item">
								<a href="">회원가입</a>
							</li>

						</ul>
					</div>
				</div>
				<div class="ver_category l_text">
					<div class="ham_container">
							<img src="images/ham_btn.png" alt="메뉴" />				
					</div>
					<div class="x_container">
							<img src="" alt="메뉴" />				
					</div>
					<div class="ver_category_box">
						<ul class="navbar">
							<li class="nav-item">
								<a href="">자고 소개</a>
							</li>
							<li class="nav-item">
								<a href="">자고 이용 안내</a>
							</li>
							<li class="nav-item">
								<a href="">FAQ</a>
							</li>
						</ul>
	
						<ul class="navbar">
							<li class="nav-item">
								<a href="">로그인</a>
							</li>
							<li class="nav-item">
								<a href="">회원가입</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</header>
	</div>


	<!-- 페이지를 좌우 분할할 section -->
	<section class="banner style1">
	
		<!-- start left -->
		<form action="insertplan.action" method="GET" > 
		
			<div class="content" style="overflow: scroll;">
	
				<!-- 일정설명이 이뤄질 div 시작 -->
				<div class="panel">
	
					<div class="panelTop">
	
						<!-- 일정설명에서 날짜 시작-->
						<div id="top">
							<input type="text" class="planTop_left" name="PL_STRT_DT"
								id="sDate" style="width: 10vw" value="시작일 입력"> <input
								type="text" class="planTop_right" name="PL_END_DT" id="eDate"
								style="width: 10vw" value="종료일 입력">
						</div>
	
					</div>
					<!-- 일정설명에서 날짜 종료-->
	
					<!-- 일정설명에서 제목 시작 -->
					<div class="panelBtm">
	
						<div id="planTitle">
							<input type="text" name="PL_TT" id="planTitleB"
								value="일정의 제목을 입력해주세요!"> <input type="text"
								name="PL_STT" id="planTitleS"
								value="일정의 소제목을 입력해주세요!">
						</div>
						<!-- 일정설명에서 제목 종료 -->
	
						<!-- 일정설명에서 프로필 시작 -->
						
						<div id="planImg">
							<!-- <a href="#" onclick="javascript:windoow.open('www.naver.com','new','left=50, top=50, width=800, height=600')"> -->
							<a href="#" onClick="window.open('uploadimage.action','네이버','width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
							<img src="img1.png" ></img>
							</a>
						</div>
						
						<!-- 일정설명에서 프로필 종료 -->
	
						<br> <br> <br> <br> <br> <br>
	
						<!-- 일정 예산 인원 시작 -->
						<div class="quantity planBtm_right btm">
							<input type="number" name="PL_PPL" min="1" max="20" step="1"
								value="1">
						</div>
						<!-- 일정 예산 인원 종료 -->
	
					</div>
	
				</div>
				<!-- 일정설명이 이뤄질 div 종료 -->
	
				<div class="slide">
	
					<div class="pull-me"></div>
					 
					<div id="btnPlusD">
						<button type="button" onclick="add()" id="btn-cancel" class="btn btns"
							style="float: right !important;"> <i class="fas fa-plus"></i></button>
					</div>
					
	
				</div>
	
				<!-- 날짜 추가 되는 영역 시작 -->
	
				<div id="sortable" class="sortable"></div>
				<!--  날짜 추가 되는 영역 종료 -->
	
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">추가할 날짜 선택</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div id="modal_date">
									<!-- 현재 일정에 추가되어있는 날짜 루프문 -->
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary" onclick="selDate()">장소
									저장</button>
								<!-- 장소명이 들어갈 히든 태그 -->
								<input type="hidden" id="hdnName" value="">
								<!-- 							<input type="hidden" id="hdnLOC_NM" value="">
									<input type="hidden" id="hdnCITY_CD" value=""> -->
								<input type="hidden" id="hdnLatLng" value="">
							</div>
						</div>
					</div>
				</div>
	

				<!-- save 버튼 클릭시 활성화될 모달창 -->
				<div class="modal fade" id="example2Modal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">공개 여부 선택</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<!-- 일정 공개여부 시작 -->
								<div id="modal_bOpen">
									공개 <input type="radio" name="OPEN_CD" value="1"
										style="width: 20px; height: 20px; border: 1px;"> &nbsp;
									비공개<input type="radio" name="OPEN_CD" value="0"
										style="width: 20px; height: 20px; border: 1px;">
								</div>
								<!-- 일정 공개여부 시작 -->
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal" style="outline: none !important;">취소</button>
								<button type="button" class="btn btn-primary"
									onclick="savePlan()" style="outline: none !important;">저장</button>
							</div>
						</div>
					</div>
				</div>
	
	
			</div>
							<div id="save">
					<button type="button" class="btn btns" data-toggle="modal"
						data-target="#example2Modal" style="outline: none !important;">Save</button>
				</div>
		</form>
		<!-- end left -->

		<!-- start right -->
		<div class="image">
			<div class="map_wrap">

				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;">
				</div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								키워드 : <input type="text" value="<%=keyword%>" id="keyword"
									size="15">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<!-- 장소리스트 목록 -->
					<ul id="placesList"></ul>
					<!-- 장소리스트 목록 밑 페이징 처리 -->
					<div id="pagination"></div>
				</div>
			</div>
		</div>
		<!-- end right -->

	</section>

	




	<!-- Footer -->
	<footer class="wrapper style1 align-center">
		<div class="inner">

			<p>
				&copy; ZAGO noodle9407@gmail.com 서울 마포구 동교동 113-32<br>
				Copyright 2021. zago, Co., Ltd. All rights reserved <a
					href="https://github.com/shj78">ZAGO</a>.
			</p>
		</div>
	</footer>

	


	<!-- 	<div id="dialog" title="장소추가">
	  	<button onclick="">추가하실?</button>
	</div> -->
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=89f516b15bc73fd13f9d3d558582f8a3&libraries=services"></script>

<script>

	//-----------------------------------마커간 선그리기
	
	var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
	var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
	var positions = [];
    var linePath;
    var lineLine;
    var distance;
    
	//-----------------------------------ajax 데이터 넘기기 배열

	//var LocNmArr = []; //장소명 
	//var cCityArr = []; //도시코드 - 도시명으로 입력되고, 도시코드로 변환되어 insert됨
	//var LatArr = []; //경도
	//var LngArr = []; // 위도
	//var LocDesArr = []; //장소 설명
	//var tStartArr = []; //장소 시작 시간

	
	//-----------------------------------일정, 지도 자바스크립트 시작
	var locLng; 
	var overlay;
	
	var markers = [];
	var markerSel = [];
	var linePath = [];
	var numOvelay = [];


	var markIdx = 0;
	
	// 지도에 표시할 선을 생성합니다
	var polyline = new kakao.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: '#FFAE00', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption =
	{
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow(
	{
		zIndex : 1
	});

	//장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// 일정 시작 날짜 선택 페이지 만들면 경도 위도 바꿀 것 ★★★★★★★★★★★★★★
	// 지도에 마커를 표시합니다 
	var marker = new kakao.maps.Marker({
	    map: map, 
	    position: new kakao.maps.LatLng(33.450701, 126.570667)
	});

	
	$(function()
	{
		
		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		    overlay.setMap(map);
		});
		
		// 날짜 데이터 비교 메소드 - ★★★★★★★페이지가 로드되자 마자 Sort한다.★★★★★★★
		//listSort();
		// 키워드로 장소를 검색합니다
		searchPlaces();

		/*
		$('#sortable').sortable(
		{
			update : function()
			{
				//listSort()
			}
		});*/

		//생략된 속성
		//id가 date인 요소(button이나 input)를 클릭할 때 달력을 표시한다.
		$("#sDate")
				.datepicker(
						{
							minDate : 0,
							//해당 달력의 날짜 포맷
							dateFormat : "yy/mm/dd",
							//해당 달력의 요일 이름
							dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
							//해당 달력의 월 이름
							monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
									"7월", "8월", "9월", "10월", "11월", "12월" ],
							//날짜가 선택되면 날짜를 매개변수로 넘긴 후 함수{}을 읽는다
							onSelect : function(d)
							{
/* 								for(var i=0; i<markerSel.length; i++)
								{
									markerSel[i].setMap(null);
									numOvelay[i].setMap(null);
								}
 */
								var arr = d.split("/");
								var year = arr[0];
								var month = arr[1];
								var day = arr[2];

								//sortable클래스의 모든 div를 삭제--1
								if ($('.day').length > 0)
									$(".day").remove();
								console.log('ed:'+$("#eDate").value);
								console.log('sd'+$("#sDate").value);								
								if($("#eDate").value!=null)
								{
									if(d>$("#eDate").value)
										$("#eDate").value=d;
									console.log('ed:'+$("#eDate").value);
									console.log($('sd'+"#sDate").value);
								}

								$("#sDate").attr('value', d);

								//페이지가 처음 로드 되었을 때 시작일 변경에 따라 추가--2
								if ($('.day').length == 0)
								{
									addDiv(year + "/" + month + "/" + day);
								}

								$("#eDate")
										.datepicker(
												{
													dateFormat : 'yy/mm/dd',
													minDate : new Date(year
															+ '-' + month + '-'
															+ day),
													onSelect : function(d)
													{
														if(d<$("#sDate").value)
															return [false];
														
														$("#eDate").attr('value', d);

														
														var flag = 1;

														//day라는 클래스를 가진 태그의 data-date 값을 배열로 불러오기 	
														var dateArr = $.makeArray($('.day').map(
																					function()
																					{
																						return $(this).attr('data-date'); 
																					}			));

														//place라는 클래스를 가진 요소중 data-date가 현재 설정된 종료일보다 큰 경우 

														for (var i = 0; i < dateArr.length; i++)
														{

															var date = new Date(dateArr[i]);
															var dateD = new Date(d);

															if (new Date( date.getFullYear()+ "/" + (date.getMonth())+ "/"+ date.getDate()) > new Date(dateD.getFullYear()+ "/"+ dateD.getMonth()+ "/"+ dateD.getDate()))
															{
																//alert("date-"+i+": "+date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate())
																//alert("dateD-"+i+": "+dateD.getFullYear()+"-"+dateD.getMonth()+"-"+dateD.getDate())

																const s = $(
																		"div[data-date='"
																				+ date.getFullYear()
																				+ "/"
																				+ leadZero((date.getMonth() + 1),2)
																				+ "/"
																				+ date.getDate()
																						+ "']").remove();

															}
														}

													}
												});

							}
						});
	});

	//날짜 Div추가
	function addDiv(dateMax)
	{

		var flag = 0;
		
		var arr = dateMax.split("/");
		
		var mon = arr[1];
		var date = arr[2];

		//종료일을 지정하지 않았을 때 무한으로 div 추가됨
		if ($("#eDate").val() == "종료일 입력")
		{
			var day = ''
			day += '<div class="day col-xs-12 col-sm-12 col-md-12" data-date="'+dateMax+'" >'
			day += mon+"."+date;
			day += '</div>'
			/*
			//기존 스크립트 
			var day = ''
			day += '<div class="day" data-date="'+dateMax+'">'
			day += dateMax+'<span class="pla"></span>'
			day += '</div>'
			//-----------------------------------
			span 태그 대체 
			:
			<div class="container-fluid">
				<div class="row">
					<div class="col-3">
						1 of 4
					</div >
					<div class="col-9">
						3 of 4
					</div >
				</div>
			</div>
			 */

			$('#sortable').append(day)
		} else
		//종료일이 지정되어 있을 때 - 종료일 이하까지만 div가 추가됨
		{

			//문자열만으로 크기 비교가 안되어서 Date 객체로 형변환해 비교
			if (new Date(dateMax).getMonth() == new Date($("#eDate").val()).getMonth()
					&& new Date(dateMax).getDate() == new Date($("#eDate").val()).getDate() + 1)
			{
				flag = 1;
			}

			if (flag == 0)
			{
				var day = ''
				day += '<div class="day col-xs-12 col-sm-12 col-md-12" data-date="'+dateMax+'">'
				day += mon+"."+date
				day += '</div>'
				$('#sortable').append(day)
			}

		}
	}

	//가장 마지막의 날짜 가져오기
	function getLast()
	{
		//place라는 클래스를 가진 태그의 data-date 값을 배열로 불러오기 	
		var dateArr = $.makeArray($('.day').map(function()
		{
			return $(this).attr('data-date'); //원래 data-date인데 date라는 속성으로 인식한다고 했던 것 같음.
		}));

		for (i = 0; i < dateArr.length; i++)
		{

			var date1 = new Date(dateArr[i]);
			var date2 = new Date(dateArr[i + 1]);
			var dmax;

			if (date1.valueOf() < date2.valueOf())
				dmax = date2;
			else
				dmax = date1;
		}

		//사용자가 날짜추가를 누를 시, 날짜의 가장 마지막 날에서 하루 추가한 날로 추가한다.
		var dateMax = dmax.getFullYear() + "/"
				+ leadZero((dmax.getMonth() + 1), 2) + "/"
				+ leadZero((dmax.getDate() + 1), 2);

		return dateMax;
	}

	// 버튼 누를 시 일정의 마지막날짜를 계산하여 날짜 추가
	function add()
	{
		//alert(dateMax);
		addDiv(getLast())

		//listSort()
	}

	//일정 프로필 슬라이드 토글	
	$(document).ready(function()
	{
		$('.pull-me').click(function()
		{
			$('.panel').slideToggle('slow');
		});
	});

	$(document).ready(function()
	{
		$('#btn').click(function()
		{
			$('#slideTogglebox').slideToggle();
		});
	});

	//날짜 앞에 0붙여주는 메소드 ex) 1월~9월
	function leadZero(num, n)
	{

		var leadZero = "";

		num = num.toString();

		if (num.length < n)
		{
			for (var i = 0; i < n - num.length; i++)
				leadZero += "0";
		}

		return leadZero + num;

	}
	
	function insertSpaces(aString) {
		  return aString.split("").join(" ");
	}

	//카카오맵 API 시작 ===============================================================================

	// 3차 지도 시작 ==============================================================================	

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces()
	{
		//페이지에서 장소 검색시 검색 값 가져오기
		var keyword = document.getElementById('keyword').value;

		//검색 값이 null 일경우
		if (!keyword.replace(/^\s+|\s+$/g, ''))
		{
			alert('키워드를 입력해주세요!');
			return false;
		}

		removeMarker();
		// removePlace();
		
		//검색 값이 null 이 아닐 경우 return false 영향 받지 않고,
		// 장소검색 객체(ps)를 통해 키워드로 장소검색을 요청합니다
		// ps 객체가 소유하고 있는 메소드 keywordSearch(검색 값, 함수명) 
		ps.keywordSearch(keyword, placesSearchCB);
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination)
	{
		if (status === kakao.maps.services.Status.OK)
		{

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces(data);

			// 페이지 번호를 표출합니다
			displayPagination(pagination);

		} else if (status === kakao.maps.services.Status.ZERO_RESULT)
		{

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === kakao.maps.services.Status.ERROR)
		{

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places)
	{

		var listEl = document.getElementById('placesList'), menuEl = document
				.getElementById('menu_wrap'), fragment = document
				.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		for (var i = 0; i < places.length; i++)
		{

			// 마커를 생성하고 지도에 표시합니다
			
				//위도 경도를 매개변수로 넘겨서 지도에 표시 			
				var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x)
				//위도 경도를 가지고 있는  placeposition을 매개변수로 갖고 검색 시 지도 내 마커 번호가 i인 마커를 생성 
				var marker = addMarker(placePosition, i)
				var itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);
			
			// 인포윈도우 시작---------------------------------------------
			

				
				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title, address1, address2, tel, lat, lng) {
					
				    kakao.maps.event.addListener(marker, 'click', function() {
				    	
				        displayInfowindow(marker, title, address1, address2, tel, lat, lng);
				    });
				    
				
				    /*
				    kakao.maps.event.addListener(marker, 'mouseout', function() {
				        infowindow.close();
				    });
				    */
				
				    
				})(marker, places[i].place_name, places[i].road_address_name, places[i].address_name, places[i].phone, places[i].y, places[i].x);
				
				fragment.appendChild(itemEl);
				
			// 인포윈도우 종료---------------------------------------------
		}

		// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places)
	{

		var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
				+ (index + 1)
				+ '"></span>'
				+ '<div class="info">'
				+ '   <h5>'
				+ places.place_name + '</h5>';
 
		if (places.road_address_name)
		{
			itemStr += '    <span>' + places.road_address_name + '</span>'
					+ '   <span class="jibun gray">' + places.address_name
					+ '</span>';
		} else
		{
			itemStr += '    <span>' + places.address_name + '</span>';
		}

		itemStr += '  <span class="tel">' + places.phone + '</span>' + '</div>';

		el.innerHTML = itemStr;
		el.className = 'item';

		return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title)
	{
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions =
		{
			spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new kakao.maps.Point(13, 37)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new kakao.maps.Marker(
		{
			position : position, // 마커의 위치
			image : markerImage
		});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker()
	{
		for (var i = 0; i < markers.length; i++)
		{
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination)
	{
		var paginationEl = document.getElementById('pagination'), fragment = document
				.createDocumentFragment(), i;

		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes())
		{
			paginationEl.removeChild(paginationEl.lastChild);
		}

		for (i = 1; i <= pagination.last; i++)
		{
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i === pagination.current)
			{
				el.className = 'on';
			} else
			{
				el.onclick = (function(i)
				{
					return function()
					{
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title, address1, address2, tel, lat, lng)
	{		
		//장소명 확인 가능 
		
		var content = '<div class="wrap">' + 
		            '    <div class="info">' + 
		            '        <div class="title">' + 
		            '            '+ title + 
		            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		            '        </div>' + 
		            '        <div class="body">' + 
		            '            <div class="desc">' + 
		            '                <div class="ellipsis">'+address1+'</div>' + 
		            '                <div class="jibun ellipsis">'+address2+'</div>' + 
		            '                <div class="phone">'+tel+'</div>' + 
		            '            </div>' + 
		            '        </div>' + 
		            '        <div class="insertDiv">' + 
		            '            <button type="button" class="markBtn" data-toggle="modal" data-target="#exampleModal" onclick="modal_date()">일정에 추가</button>'+
		            '        </div>' + 
		            '    </div>' +    
		            '</div>';	   
		
		var city = address2.substring(0,2);
		
		//클릭한 장소의 장소명 히든 태그에 전달 
 		$("#hdnName").attr('value', city+"<br>"+title);
 		$("#hdnLOC_NM").attr('value', title);
 		$("#hdnCITY_CD").attr('value', city);
 		$("#hdnLatLng").attr('value', lat+"/"+lng);

	    
		// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		overlay = new kakao.maps.CustomOverlay({
		    content: content,
		    map: map,
		    position: new kakao.maps.LatLng(lat, lng)     
		});
		
	    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다         
        overlay.setMap(map);
	    
	}
	
	//모달에 현재 일정의 날짜를 추가해준다
	function modal_date() {
		
		
		//모달창에 있던 요소 초기화
		$('#modal_date').empty();
	
		//place라는 클래스를 가진 태그의 data-date 값을 배열로 불러오기 	
		var dateArr = $.makeArray($('.day').map(function()
		{
			return $(this).attr('data-date'); //원래 data-date인데 date라는 속성으로 인식한다고 했던 것 같음.
		}));
		
		//모달창에 새로운 요소 추가
		for(var i=0; i<dateArr.length; i++)
		{
			$('#modal_date').append('<div><label><input type="radio" name="datesRadio" value="'+dateArr[i]+'">'+dateArr[i]+'</label></div>')
		}

	}
	
	function selDate()
	{
		//var nDiv = $("textarea[id=LOC_DESC]").length;
		markIdx = markIdx+1;
/* 		alert(markIdx);
		
		alert("현재장소의 개수: "+markIdx); */
		
		var selDate = $('label > input:radio[name=datesRadio]:checked').val(); //선택된 날짜에 해당하는 input 태그 value값을 가져온다
		var arrDt = selDate.split("/");
		//alert("arrDt[0]: "+arrDt[0]);
		//alert("arrDt[1]: "+arrDt[1]);
		//alert("arrDt[2]: "+arrDt[2]);
		
		var ymd = arrDt[0]+"-"+arrDt[1]+"-"+arrDt[2];
		
		var hdnName = $("#hdnName").attr('value');
		//장소의 도시명과 장소 이름
		var arrCN = hdnName.split("<br>");
		//alert("도시명: "+arrCN[0]);
		//alert("장소이름: "+arrCN[1]);
		
		//해당 장소의 경도 위도 받아오기 
		var hdnLatLng = $("#hdnLatLng").attr('value');
		
		var arrLL = hdnLatLng.split("/");
		//alert("경도명: "+arrLL[0]);
		//alert("위도명: "+arrLL[1]);
		
		

		$('#sortable div[data-date="'+selDate+'"]').append('<div data-index-number="'+markIdx+'" class="container-fluid" ><div class="row"'+' value="'+hdnName+'"'+'><div class="addPlace col-xs-3 col-sm-3 col-md-3" style="letter-spacing: 1px;">'+hdnName+"<br><input name = 'LOC_STRT_TIME' type='time' min='' max='' data-ymd='" + ymd + "' class='"+ymd+"'>"+'</div><div class="col-xs-8 col-sm-8 col-md-8"><textarea name="LOC_DESC" rows="4" style="width: 100%" value=""></textarea></div ><div class="fa fa-window-close col-xs-1 col-sm-1 col-md-1" aria-hidden="true" style="display:inline-block; border:none;" onclick="removePlace('+markIdx+')"></div></div></div>');
		$('#sortable div[data-date="'+selDate+'"]').append('<div name="LOC_LAT" value="'+arrLL[0]+'"><div name="LOC_LONG" value="'+arrLL[1]+'"></div></div>');
		$('#sortable div[data-date="'+selDate+'"]').append('<div name="CITY_CD" value="'+arrCN[0]+'"><div name="LOC_NM" value="'+arrCN[1]+'"></div></div>');

		//추가된 장소의 개수 
		locLng = $('div[class=row]').length;
		
		//
		positions[markIdx-1] = {
				title : arrCN[1],
				latlng :  new daum.maps.LatLng(arrLL[0],arrLL[1])
		};
		
		//------------------------------------------------------------------------------
		var linePathForAdding = [];
		for (var i = 0; i < positions.length; i++) {
			linePathForAdding.push(positions[i].latlng);
	 
	        // distance = Math.round(lineLine.getLength());
	        displayCircleDot(positions[i].latlng, 0);
	    }
		
		if (!lineLine) {
        	lineLine = new daum.maps.Polyline({
	            map : map, // 선을 표시할 지도입니다 
	            path : linePathForAdding,
	            strokeWeight : 3, // 선의 두께입니다 
	            strokeColor : '#db4040', // 선의 색깔입니다
	            strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle : 'solid' // 선의 스타일입니다
	        });
        } else {
        	lineLine.setPath(linePathForAdding);
        }
			
		//DB 작업용 추가된 장소 name화 시작------------------------------------------------------------------------------
		
		//장소가 추가되었다면 - 이거 사실 안해줘도 되지 않나?
		if (locLng > 0) {
			//명예 변수 시퀀스 추가된 장소코드 총 8개
		
			//전역으로 설정하면 중복값이 계속해서 들어가므로 지역설정해서 계속 리프레쉬되도록 해야함
			var LocNmArr = []; //두번 선언되어 있었음
		    $("div[name='LOC_NM']").each(function(i) {
		    	//LocNmArr.push($(this).val());
		    	//해당 div의 value 속성 값을 LocNmArr에 추가
		    	LocNmArr.push($(this).attr('value'));
		    });
		    
		    console.log("장소명시작");
		    for (var i in LocNmArr)
		    {
		      console.log(i+" 번째 장소명: "+LocNmArr[i]);
		      console.log("장소명끝");
		    }
		    
		    //console.log(LocNmArr);
					
		    //마이바티스 측에서 도시명으로 INSERT되고 SQL쪽에서는 도시명을 도시코드로 바꿔야함
			var cCityArr = [];
		    $("div[name='CITY_CD']").each(function(i, item) {
		    	//cCityArr.push($(this).val());
		    	//cCityArr.push($(item).val());
		    	cCityArr.push($(this).attr('value'));
		    });
		    
		    console.log("도시명시작");
		    for (var i in cCityArr)
		    {
		      console.log(i+" 번째 도시명: "+cCityArr[i]);
		      console.log("도시명끝");
		    }		    
		    
		    //console.log(cCityArr);
		    
			var LatArr = [];
			
		    $("div[name='LOC_LAT']").each(function(i) {
		    	//LatArr.push($(this).val());
		    	LatArr.push($(this).attr('value'));
		    });
		    
		    console.log("경도시작");
		    for (var i in LatArr)
		    {
		      console.log(i+" 번째 경도: "+LatArr[i]);
		      console.log("경도끝");
		    }		    
		    
		    
			var LngArr = [];
			
		    $("div[name='LOC_LONG']").each(function(i) {
		    	//LngArr.push($(this).val());
		    	LngArr.push($(this).attr('value'));
		    });
		    
		    console.log("위도시작");
		    for (var i in LngArr)
		    {
		      console.log(i+" 번째 위도: "+LngArr[i]);
		      console.log("위도끝");
		    }
		    
			var LocDesArr = [];
			
		    $("textarea[name='LOC_DESC']").each(function(i, item) {
		    	//LocDes.push($(this).val());
		    	//LocDesArr.push($(this).value);
		    	//LocDesArr.push($(this).text());
		    	LocDesArr.push($(item).val());
		    });
		    
		    console.log("장소설명시작");
		    for (var i in LocDesArr)
		    {
		      console.log(i+" 번째 장소설명: "+LocDesArr[i]);
		      console.log("장소설명끝");
		    }
		    
		    //console.log(LocDesArr);
		    
		    //뺄게요
			//var tLocStrt = [];
	
			var tStartArr = [];
		    $("input[name='LOC_STRT_TIME']").each(function(i, item) {
		    	//tStartArr.push($(this).val());
		    	//tStartArr.push($(this).value);
		    	//tStartArr.push($(this).html());
		    	tStartArr.push($(item).val());
		    	
		    	
		    });	
		    console.log("도착시간시작");
		    for (var i in tStartArr)
		    {
		      console.log(i+" 번째 도착시간: "+tStartArr[i]);
		      console.log("도착시간끝");
		    }
		    
			/*
		    console.log("공개여부 확인 시작");
		    var bOpenArr = $("input[name='OPEN_CD']:checked").val();
		    console.log("공개여부 확인 종료"+bOpenArr);*/
		    
		    console.log("인원 확인 시작");
			var nHumArr = $("input[name='PL_PPL']").val();
			console.log("인원 확인 종료"+nHumArr);

		    
		    console.log("여행인원 확인 시작");
		    for (var i in nHumArr)
		    {
		      console.log(i+" 번째 여행인원: "+nHumArr[i]);
		      console.log("여행인원 확인 종료");
		    }
		    
		    var sdate = $("input[name='PL_STRT_DT']").val();
		    console.log("여행시작일: "+sdate);
		    
		    var edate = $("input[name='PL_END_DT']").val();
		    console.log("여행종료일: "+edate);
		    
		    var pTT = $("input[name='PL_TT']").val();
		    console.log("여행대제목: "+pTT);
		    
		    var pSTT = $("input[name='PL_STT']").val();
		    console.log("여행소제목: "+pSTT);
			
		}
		
		//DB 작업용 추가된 장소 name화 종료------------------------------------------------------------------------------
			
	    function displayCircleDot(position, distance) {
	        if (distance > 0) {
	            // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
	            var distanceOverlay = new daum.maps.CustomOverlay(
	                    {
	                        content : '<div class="dotOverlay">거리 <span class="number">'
	                                + distance + '</span>m</div>',
	                        position : position,
	                        yAnchor : 1,
	                        zIndex : 2
	                    });
	 
	            // 지도에 표시합니다
	            distanceOverlay.setMap(map);
	        }
	    }			

		
		var imageSrc = 'images/marker.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(44, 49), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(17, 49)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(arrLL[0], arrLL[1]); // 마커가 표시될 위치입니다
 		   
 		   
 		var markName = $("#hdnName").attr('value').split("<br>");
 		 
 		   
		var content = '<div class ="label"><span class="left"></span><span class="center">'+markName[1]+'</span><span class="right"></span></div>';
		
		// 커스텀 오버레이가 표시될 위치입니다 
		var position = new kakao.maps.LatLng(arrLL[0], arrLL[1]);  
		
		// 커스텀 오버레이를 생성합니다
		numOvelay[markIdx] = new kakao.maps.CustomOverlay({
		    position: position,
		    content: content   
		});
		
		numOvelay[markIdx].setMap(map);
		

	  	markerSel[markIdx]= new kakao.maps.Marker({
		    position: markerPosition, 
		    image: markerImage // 마커이미지 설정 
		});
		   
		// 마커가 지도 위에 표시되도록 설정합니다
		markerSel[markIdx].setMap(map); 
		
		//지도에 선을 표시합니다
		//position.setMap(map); 
	}
	
	
	function savePlan(){
	
		//DB 작업용 추가된 장소 name화 시작------------------------------------------------------------------------------
		alert("savePlan입성");
		//장소가 추가되었다면 - 이거 사실 안해줘도 되지 않나?
		
		var locationList = [];
		if (locLng > 0) {
			/*
			 * input 태그가 아닐때 태그에 값을 넣어줄땐 data attribute를 사용한다.
			 * jquery에서 아래와 같이 조회 가능하다.
			 * '<div data-loc-nm="vale"></div>';
			 * $().data('locNm')
			 */
			var $locNmArr = $("div[name='LOC_NM']");
			var $cityCdArr = $("div[name='CITY_CD']");
			var $locLatArr = $("div[name='LOC_LAT']");
			var $locLongArr = $("div[name='LOC_LONG']");
			var $locDescArr = $("textarea[name='LOC_DESC']");
			var $locStrtTimeArr = $("input[name='LOC_STRT_TIME']");
			
			for (var idx = 0; idx < locLng; idx++) {			
				var LOC_NM = $($locNmArr[idx]).attr('value');
				var CITY_CD = $($cityCdArr[idx]).attr('value');
				var LOC_LAT = $($locLatArr[idx]).attr('value');
				var LOC_LONG = $($locLongArr[idx]).attr('value');
				var LOC_DESC = $($locDescArr[idx]).val();
				
				var $locStrtTime = $($locStrtTimeArr[idx]);
				var ymd = $locStrtTime.data('ymd');
				var LOC_STRT_TIME = ymd + ' ' + $locStrtTime.val();
				
				locationList.push({
					// LOC_NM: LOC_NM - 생략가능
					loc_NM: LOC_NM,
					city_CD: CITY_CD,
					loc_LAT: LOC_LAT,
					loc_LONG: LOC_LONG,
					loc_DESC: LOC_DESC,
					loc_STRT_TIME: LOC_STRT_TIME
			    });
			}
			
		}
	    
	    
	    //일정 테이블 변수 시작----------------------------------------
	    var PL_CD=$("input[name='PL_CD']").val();
	    var PL_TT=$("input[name='PL_TT']").val();
	    var PL_STT=$("input[name='PL_STT']").val();
	    var PL_STRT_DT=$("input[name='PL_STRT_DT']").val();
	    var PL_END_DT=$("input[name='PL_END_DT']").val();
	    var PL_PPL=$("input[name='PL_PPL']").val();
	    var OPEN_CD=$("input[name='OPEN_CD']").val();
	    //일정 테이블 변수 끝----------------------------------------
	    
	    var plan = {
    		pl_CD: PL_CD,
    		pl_TT: PL_TT,
    		pl_STT: PL_STT,
  			pl_STRT_DT: PL_STRT_DT,
  			pl_END_DT: PL_END_DT,
  			pl_PPL: PL_PPL,
  			open_CD: OPEN_CD
	    };
	    
	    
	    console.log("공개여부 확인 시작");
	    var bOpen = $("input[name='OPEN_CD']:checked").val();
	    console.log("공개여부 확인 종료"+bOpen);
	    
	    console.log("인원 확인 시작");
		var nHum = $("input[name='PL_PPL']").val();
		console.log("인원 확인 종료"+nHum);
	    
	    var sdate = $("input[name='PL_STRT_DT']").val();
	    console.log("여행시작일: "+sdate);
	    
	    var edate = $("input[name='PL_END_DT']").val();
	    console.log("여행종료일: "+edate);
	    
	    var pTT = $("input[name='PL_TT']").val();
	    console.log("여행대제목: "+pTT);
	    
	    var pSTT = $("input[name='PL_STT']").val();
	    console.log("여행소제목: "+pSTT);	
	    
		//-----------------------------------컨트롤러로 배열 값 넘기기 시작
		
		//data에는 하나만 넣을 수 있는 건가?
		//일단 해본다.
		
		alert("ajax 입성 ");

		/*
		consolg.log(LocNmArr);
		consolg.log(cCityArr);
		consolg.log(LatArr);
		consolg.log(LngArr);
		consolg.log(LocDesArr);
		consolg.log(tStartArr);
		*/
		/*
		$.ajax({
			url				: 'insertplan.action',
			method			: 'POST',
			//async:false,
			tranditional	: true,
			//dataType : 'json',
			//contentType : "application/x-www-form-urlencoded; charset=UTF-8;",
			data			: allData,
			success			: function(data){
				alert("성공");
			},
			error			: function(request, status, error){
				
				alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
				alert("실패");
			}
			
		});
	
		*/
		
		/*
		
		javascript object n?
		'{ "key": "value", "arr": [""] }'
				
		*/
		
		
		$.ajax({
		    method      : 'POST',
		    url         : 'insertplan.action',
		    contentType: 'application/json;charset=utf-8',
		    dataType : "json",
		    data        : JSON.stringify({
		    	plan: plan,
		    	locationList: locationList
		    }),
		    success     : function(data) {
		        alert("성공! "+data);
		        
		        // 이미지 업로드
		        //https://makitweb.com/how-to-upload-image-file-using-ajax-and-jquery/
		        /*
		        $.ajax({
				    method      : 'POST',
				    url         : 'uploadimage.action',
				    dataType : "json",
				    data        : {
				    	
				    },
				    success     : function(data) {
				        alert("성공! "+data);
				        document.location.href = "";
				    },
				    error       : function(request, status, error) {
				        alert(error);
				    }
				 
				});
		        */
		    },
		    error       : function(request, status, error) {
		        alert(error);
		    }
		 
		});
		


		//-----------------------------------컨트롤러로 배열 값 넘기기 종료
		
	}
		
		//DB 작업용 추가된 장소 name화 종료------------------------------------------------------------------------------
	

    // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다
    function closeOverlay() {
        overlay.setMap(null);     
    }
    
	
	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el)
	{
		while (el.hasChildNodes())
		{
			el.removeChild(el.lastChild);
		}
	}
	
	function removePlace(markIdx)
 	{
		var idx = markIdx;
		
		
		markerSel[idx].setMap(null);
		
		numOvelay[idx].setMap(null);
		
		$('div[data-index-number="'+idx+'" ]').remove();
		
		positions = positions.filter(function(e, idx) {
			return idx != markIdx - 1;
		});
		var linePath = [];
		if (positions.length >= 2) {
			for (var idx = 0; idx < positions.length; idx++) {
				linePath.push(positions[idx].latlng);
			}
		}
		lineLine.setPath(linePath);
		
 	}
	
	//----3차 지도 끝 --------------------------------------------------------------------
	


	//----------------인원
    jQuery('<div class="quantity-nav"><div class="quantity-button quantity-up">+</div><div class="quantity-button quantity-down">-</div></div>').insertAfter('.quantity input');
    jQuery('.quantity').each(function() {
      var spinner = jQuery(this),
        input = spinner.find('input[type="number"]'),
        btnUp = spinner.find('.quantity-up'),
        btnDown = spinner.find('.quantity-down'),
        min = input.attr('min'),
        max = input.attr('max');

      btnUp.click(function() {
        var oldValue = parseFloat(input.val());
        if (oldValue >= max) {
          var newVal = oldValue;
        } else {
          var newVal = oldValue + 1;
        }
        spinner.find("input").val(newVal);
        spinner.find("input").trigger("change");
      });

      btnDown.click(function() {
        var oldValue = parseFloat(input.val());
        if (oldValue <= min) {
          var newVal = oldValue;
        } else {
          var newVal = oldValue - 1;
        }
        spinner.find("input").val(newVal);
        spinner.find("input").trigger("change");
      });

    });
	
</script>
</html>