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
	
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/style.css" />

<link rel="stylesheet" href="assets/css/bootstrap.css" />
<link rel="stylesheet" href="assets/css/bootstrap.css.map" />
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-theme.css" />
<link rel="stylesheet" href="assets/css/bootstrap-theme.css.map" />

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 달력 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- jQuery -->
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>

<body class="is-preload">

	<div id="header">
		<header>
			<img src="images/logo_leggo.png" style="height: 100%" />
		</header>
	</div>

	<!-- 페이지를 좌우 분할할 section -->
	<section class="banner style1">
		<!-- 좌측 페이지 div -->
		<div class="content" style="overflow: scroll;">

			<!-- 일정설명이 이뤄질 div 시작 -->
			<div class="panel">
			
				<div class="panelTop">

				<!-- 일정설명에서 날짜 -->
					<div id="top">
						<input type="text" class="planTop_left" id="sDate" style="width: 10vw" value="시작일 입력"> 
						<input type="text" class="planTop_right" id="eDate" style="width: 10vw" value="종료일 입력">
					</div>
					
				</div>
				
				<!-- 일정설명에서 날짜 외 -->
				<div class="panelBtm">
				
					<div id="planTitle">
						<input type="text" id="planTitleB" value="떠나요 넷이서 모든걸 훌훌 버리고">
						<input type="text" id="planTitleS"
							value="제주도 푸른 밤 두 별 아래~ 이제는 더 이상 얽매이지 않을 거에요~ ">
					</div>

<!-- 					<div id="planImg">
						<img></img>
					</div> -->


<!-- 					<div id="btnPlus">
							<button id="addPhoto" class = "fa fa-window-close"></button>
					</div> -->
					
				</div>

			</div>
			<!-- 일정설명이 이뤄질 div 종료-->

			<div class="slide">
				<div class="pull-me">

					<!-- <p><img src="images/top_arrow.png" style="height:60%"/></p> -->
				</div>

				<div id="btnPlusD" >
					<button onclick="add()" id="btn-cancel" class="btn btns">add date</button>
				</div>

			</div>


		

			<!-- 날짜 추가 되는 영역 시작 -->
			
			<div id="sortable" class="sortable">
			
			
			
			
			
			
			
			
			
			</div>
			<!--  날짜 추가 되는 영역 종료  -->



<!-- 			<button type="button" data-toggle="modal" data-target="#myModal">Launch
				modal</button>
 -->
		
			<!-- 일정에 추가 버튼 클릭시 활성화될 모달창 --> 
<!-- 			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModal">Launch demo modal</button> -->

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
							<div id="modal_date"></div>
							<!-- 현재 일정에 추가되어있는 날짜 루프문 -->
						
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" onclick="selDate()">Save changes</button>
							<!-- 장소명이 들어갈 히든 태그 -->
							<input type="hidden" id="hdnName" value="">
							<input type="hidden" id="hdnLatLng" value="">
						</div>
					</div>
				</div>
			</div>
			<div id="save" >
				<button onclick="" id="btn-cancel" class="btn btns">save</button>
			</div>


		</div>

		<!-- 우측 페이지 div -->
		<div class="image">
			<div class="map_wrap">
			
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;">
				</div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								키워드 : <input type="text" value="<%=keyword %>" id="keyword" size="15">
								<!-- 키워드 : <input type="text" value="제이쿼리로넘겨줌" id="keyword" size="15"> -->
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
		
		<!-- <div class="map_wrap">
		    <div id="mapCate" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		    <ul id="category">
		        <li id="BK9" data-order="0"> 
		            <span class="category_bg bank"></span>
		            은행
		        </li>       
		        <li id="MT1" data-order="1"> 
		            <span class="category_bg mart"></span>
		            마트
		        </li>  
		        <li id="PM9" data-order="2"> 
		            <span class="category_bg pharmacy"></span>
		            약국
		        </li>  
		        <li id="OL7" data-order="3"> 
		            <span class="category_bg oil"></span>
		            주유소
		        </li>  
		        <li id="CE7" data-order="4"> 
		            <span class="category_bg cafe"></span>
		            카페
		        </li>  
		        <li id="CS2" data-order="5"> 
		            <span class="category_bg store"></span>
		            편의점
		        </li>      
		    </ul>
		</div> -->
	</section>

	




	<!-- Footer -->
	<footer class="wrapper style1 align-center">
		<div class="inner">

			<p>
				&copy; LEGGO adminLeggo@gmail.com 서울 마포구 월드컵북로 21 (서교동) 풍성빌딩 4층 F강의실<br>
				Copyright 2021. leggo, Co., Ltd. All rights reserved <a
					href="http://www.sist.co.kr/employment/gangbuk/index.jsp">SIST</a>.
			</p>
		</div>
	</footer>

	


	<!-- 	<div id="dialog" title="장소추가">
	  	<button onclick="">추가하실?</button>
	</div> -->
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=89f516b15bc73fd13f9d3d558582f8a3&libraries=services"></script>

<script>
	var overlay;
	
	var markers = [];
	var markerSel = [];
	var linePath = [];
	var numOvelay = [];

	//마커를 통합하는데 도움을 줄 마커 클러스터
/* 	var clusterer = new kakao.maps.MarkerClusterer({
	    map: map,
	    markers: markers,
	    gridSize: 35,
	    averageCenter: true,
	    minLevel: 6,
	    disableClickZoom: true,
	    styles: [{
	        width : '53px', height : '52px',
	        background: 'url(cluster.png) no-repeat',
	        color: '#fff',
	        textAlign: 'center',
	        lineHeight: '54px'
	    }]
	});	 */
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
								for(var i=0; i<markerSel.length; i++)
								{
									markerSel[i].setMap(null);
									numOvelay[i].setMap(null);
								}

								var arr = d.split("/");
								var year = arr[0];
								var month = arr[1];
								var day = arr[2];

								//sortable클래스의 모든 div를 삭제--1
								if ($('.day').length > 0)
									$(".day").remove();

								$("#sDate").attr('value', d);
								//alert("시작일 value값: "+$("#sDate").val());

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
														
														$("#eDate").attr('value', d);
														//alert("종료일 value값: "+$("#eDate").val());

														
														var flag = 1;

														//place라는 클래스를 가진 태그의 data-date 값을 배열로 불러오기 	
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

	// 날짜 데이터 비교 메소드
	// 제이쿼리 오름차순 메소드 sort(function(a,b)(.....return  a-b));
/* 	function listSort()
	{
		//
		$('.sortable div').sort(function(a, b)
		{
			console.log(a)
			console.log(b)
			var a = new Date(a.dataset.date)
			var b = new Date(b.dataset.date)

			return a - b

		}).appendTo('.sortable')

	} */

	// 일정 추가 ------- 수정 필요
	//<!-- 고장없이 잘 돌아가고 있는 천방지축 얼렁뚱땅 일정 추가 시작 -->

/* 	function addPlace()
	{

		$('#dialog').dialog()
		//$("div[data-date='" + date.getFullYear()+"-"+leadZero((date.getMonth() + 1), 2)+"-"+date.getDate() + "']")

		//.append(html); 선택된 요소의 마지막에 새로운 요소나 콘텐츠에 추가한다. appendTo()와 동작이 같다.
		//즉 아래는 아이디가 sortable인 요소의 마지막에 html요소나 콘텐츠를 추가하는 것! 

	} */

	//<!-- 고장없이 잘 돌아가고 있는 천방지축 얼렁뚱땅 일정 추가 종료 -->
	//혜진 일정 추가 시작

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
			day += insertSpaces(mon)+" "+insertSpaces(date)
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
				day += insertSpaces(mon)+"　"+insertSpaces(date)
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

	    //var content = '<div style="padding:5px;z-index:1;">' + title + address1 + address2 + tel + '</div>';

		// 커스텀 오버레이에 표시할 컨텐츠 입니다
		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		// 별도의 이벤트 메소드를 제공하지 않습니다 
		
		
		//createElment(); 를 돔처리... 하는게 맞다 content 변수가 아니라 
		
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
		
		var city = address1.substring(0,2);
		
		//클릭한 장소의 장소명 히든 태그에 전달 
 		$("#hdnName").attr('value', city+"<br>"+title);
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
		
		//$('#modal_date').html('이거날짜변수')
		/*
		alert($('#sDate').attr('value'));
		alert($('#eDate').attr('value'));

		var startDate = $('#sDate').attr('value');
		var endDate = $('#eDate').attr('value');
		
		var sArr = startDate.split("/");
		var eArr = endDate.split("/");
		
		var dateS = new Date(sArr[0],sArr[1]-1,sArr[2]);
		var dateE = new Date(eArr[0],eArr[1]-1,eArr[2]);
		
		//alert(dateS);
		//alert(dateE);
		
		//날짜 차이 알아내기
		var diff = dateE-dateS;
		var currDay = 24 * 60 * 60 * 1000; //시*분*초*밀리세컨
		
		//alert( "* 날짜 두개 : "+dateS+","+dateE+"<br>"+
		//		"* 일수차이 : "+parseInt(diff/currDay) );
		
		var days = parseInt(diff/currDay); 
		//시작일에서 days 만큼 추가된 날짜가 나올 것...
		*/
		
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
		//var nDiv = $("textarea[id=memo]").length;
		markIdx = markIdx+1;
		alert(markIdx);
		
		alert("현재장소의 개수: "+markIdx);
		
		var selDate = $('label > input:radio[name=datesRadio]:checked').val(); //선택된 날짜에 해당하는 input 태그 value값을 가져온다
		//alert(selDate);
		
		
		//if(markIdx==1)
		//{
			//alert("장소개수가 0 일때");
			$('#sortable div[data-date="'+selDate+'"]').append('<div data-index-number="'+markIdx+'" class="container-fluid"'+' value="'+$("#hdnLatLng").attr('value')+'"><div class="row"'+' value="'+$("#hdnName").attr('value')+'"'+'><div class="addPlace col-xs-4 col-sm-4 col-md-4" style="letter-spacing: 1px;">'+$("#hdnName").attr('value')+"<br><input type='time' min='' max=''>"+'</div><div class="col-xs-7 col-sm-7 col-md-7"><textarea id="memo" name="memo" rows="4" cols="90" value=""></textarea></div ><div name="'+$("#hdnLatLng").attr('value')+'" class="fa fa-window-close col-xs-1 col-sm-1 col-md-1" aria-hidden="true" style="display:inline-block; border:none;" onclick="removePlace('+markIdx+')"></div></div></div>');
		//}
		//else 
		//{
			//var min = $('"#'+markerSel.length-1+'"').val();
			//var min = $('"#'+markerSel.length-1+'"').html();
			
			//var min = $('#sortable div[data-date="'+selDate+'"]').find('input:eq('+markIdx-2+')').val();
			//var min = $('#sortable div[data-date="'+selDate+'"]').find('input').value;
/* 			var min = $('#sortable div[data-date="'+selDate+'"]').find('input').last().value;
			alert("장소개수가 0이 아닐 때"+min); */

			//$('#sortable div[data-date="'+selDate+'"]').append('<div class="container-fluid"'+' value="'+$("#hdnLatLng").attr('value')+'"><div class="row"'+' value="'+$("#hdnName").attr('value')+'"'+'><div class="addPlace col-xs-4 col-sm-4 col-md-4" style="letter-spacing: 1px;">'+$("#hdnName").attr('value')+"<br><input type='time' min='"+min+"' max=''>"+'</div><div class="col-xs-7 col-sm-7 col-md-7"><textarea id="memo" name="memo" rows="4" cols="90" value=""></textarea></div ><div name="'+$("#hdnLatLng").attr('value')+'" class="fa fa-window-close col-xs-1 col-sm-1 col-md-1" aria-hidden="true" style="display:inline-block; border:none;" onclick="removePlace('+markerSel.length+')"></div></div></div>');
		
			//document.getElementById('"'+markerSel.length-1+'"').innerHTML = 
		//}	
		//console.log("div의 인덱스: "+$(".container-fluid").attr('data-index-number'));
		//일정 추가에 따른 맵에 장소 마커이미지 추가하기 - 생성
		
		
		
		//해당 장소의 경도 위도 받아오기 
		var hdnLatLng = $("#hdnLatLng").attr('value');
		
		var arrLL = hdnLatLng.split("/");
		
		//var nDiv = $("div[class=container-fluid]").length;

		//alert(nDiv);
		//linePath [nDiv] =  new kakao.maps.LatLng(arrLL[0], arrLL[1]);

		
		var imageSrc = 'images/marker.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(44, 49), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(17, 49)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(arrLL[0], arrLL[1]); // 마커가 표시될 위치입니다
		
		    
		//console.log("선택된 마커 배열의 길이: "+markIdx);
		    //console.log("선택된 마커 배열의 길이: "+markIdx);
		// 마커 인덱스 1 추가를 위한 for문 
/* 		for (var i = 0; i = i+1; i++) {
 		   //console.log(arr[i]); */
 		   
 		   
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
		//polyline.setMap(map); 
		
	
	
	}

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
		
 	}
	
	//----3차 지도 끝 --------------------------------------------------------------------
	


	
	
</script>
</html>