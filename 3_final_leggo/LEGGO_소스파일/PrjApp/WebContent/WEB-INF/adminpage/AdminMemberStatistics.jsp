<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>MemberStatistics - Leggo Admin</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jes/styles.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>
<script type="text/javascript">
	
		$(function()
		{
			var leggoSu = $("#leggo").val();
			var naverSu = $("#naver").val();
			var kakaoSu = $("#kakao").val();
			var googleSu = $("#google").val();
			
			var mychart = $("#joinBar-chart");
			var myBarChart = new Chart(mychart, {
			    type: 'bar',
			    data: {
			        labels: ['leggo', 'naver', 'kakao', 'google'],
			        datasets: [{
			            label: '# of Join Mtd',
			            data: [leggoSu, naverSu, kakaoSu, googleSu],
			            backgroundColor: [
			            	'rgba(54, 162, 235, 0.2)',	//-- 파랑
			            	'rgba(75, 192, 192, 0.2)',	//-- 초록
			                'rgba(255, 206, 86, 0.2)',	//-- 노랑
			                'rgba(255, 99, 132, 0.2)'	//-- 레드
			            ],
			            borderColor: [

			                'rgba(54, 162, 235, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(255, 99, 132, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			     options: {
			    	 legend: {
				         	display: false
				         },
			        scales: {
			        	yAxes: [{
							ticks: {
								beginAtZero: true
							}
						}]
			        }
			    } 
			});
			
			var joinDaySu1 = $("#joinDayList1").val();	//-- 6일전
			var joinDaySu2 = $("#joinDayList2").val();	//-- 5일전
			var joinDaySu3 = $("#joinDayList3").val();	//-- 4일전
			var joinDaySu4 = $("#joinDayList4").val();	//-- 3일전
			var joinDaySu5 = $("#joinDayList5").val();	//-- 2일전
			var joinDaySu6 = $("#joinDayList6").val();	//-- 1일전
			var joinDaySu7 = $("#joinDayList7").val();	//-- 오늘
			
			var mychart2 = $("#joinLine-chart");
			var myLineChart = new Chart(mychart2, {
			    type: 'line',
			    data: {
			        labels: ['6일 전', '5일 전', '4일 전', '3일 전', '2일 전', '1일 전', '오늘'],
			        datasets: [{
			            label: '# of Join su',
			            data: [
			            	joinDaySu1, joinDaySu2, joinDaySu3, joinDaySu4, joinDaySu5, joinDaySu6, joinDaySu7
			            ],
			            borderColor: "rgba(255, 201, 14, 1)",
			            backgroundColor: "rgba(255, 201, 14, 0.4)",
			            fill: true,
			            lineTension: 0
			        }]
			    },
			    options: {
			    	 legend: {
				         	display: false
				         },
			        scales: {
			        	yAxes: [{
							ticks: {
								beginAtZero: true
							}
						}]
			        }
			    }
			});
			
			var rsnSu1 = $("#rsn1").val();
			var rsnSu2 = $("#rsn2").val();
			var rsnSu3 = $("#rsn3").val();
			var rsnSu4 = $("#rsn4").val();
			var rsnSu5 = $("#rsn5").val();
			
			var mychart3 = $("#rsnDou-chart");
			var myQ1Chart = new Chart(mychart3, {
			    type: 'doughnut',
			    data: {
			        labels: ['이용빈도 낮음', '재가입', '콘텐츠 부족', '개인정보보호', '기타'],
			        datasets: [{
			            label: '# of Quit_Reason',
			            data: [rsnSu1, rsnSu2, rsnSu3, rsnSu4, rsnSu5],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			    	legend: {
						position: 'bottom'
			    	}
					
			    }
			});
			
			var qrdDaySu1 = $("#qrdDayList1").val();	//-- 6일전
			var qrdDaySu2 = $("#qrdDayList2").val();	//-- 5일전
			var qrdDaySu3 = $("#qrdDayList3").val();	//-- 4일전
			var qrdDaySu4 = $("#qrdDayList4").val();	//-- 3일전
			var qrdDaySu5 = $("#qrdDayList5").val();	//-- 2일전
			var qrdDaySu6 = $("#qrdDayList6").val();	//-- 1일전
			var qrdDaySu7 = $("#qrdDayList7").val();	//-- 오늘
			
			var mychart4 = $("#qrdLine-chart");
			var myLineChart = new Chart(mychart4, {
			    type: 'line',
			    data: {
			        labels: ['6일 전', '5일 전', '4일 전', '3일 전', '2일 전', '1일 전', '오늘'],
			        datasets: [{
			            label: '# of Quit su',
			            data: [
			            	qrdDaySu1, qrdDaySu2, qrdDaySu3, qrdDaySu4, qrdDaySu5, qrdDaySu6, qrdDaySu7
			            ],
			            borderColor: "rgba(255, 201, 14, 1)",
			            backgroundColor: "rgba(255, 201, 14, 0.4)",
			            fill: true,
			            lineTension: 0
			        }]
			    },
			    options: {
			    	 legend: {
				         	display: false
				         },
			        scales: {
			        	yAxes: [{
							ticks: {
								beginAtZero: true
							}
						}]
			        }
			    }
			});
			
			
			$('#datatables').dataTable( {
		        lengthMenu : [5, 10, 15, 20, 25],
				pageLength : 10,
				language: {
						lengthMenu : "_MENU_ entries per page",
		                searchPlaceholder: "Search...",
		                search: "_INPUT_"
		        },
		        order: [ [ 0, "desc" ] ]
			
		    } );
		});
	
</script>
</head>
<body class="sb-nav-fixed">
       <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="admin.action"><img src="images/leggo.png" width="130px;"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="AdminChange.jsp" onClick="window.open(this.href, '', 'width=400, height=310'); return false;">정보변경</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        	<a class="nav-link" href="" style="font-size: 8pt;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                사용자 페이지 열기 >>
                            </a>
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="admin.action">
                                <div class="sb-nav-link-icon"><img src="images/board.png" height="21px;"></div>대시보드
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><img src="images/member.png" height="23px;"></div>
                                회원 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="memberlist.action">회원 목록</a>
                                    <a class="nav-link" href="inquiry.action">일대일문의</a>
                                    <a class="nav-link" href="survey.action">설문조사 관리</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="plan.action">
                            	<div class="sb-nav-link-icon"><img src="images/calender.png" height="21px;"></div>일정 관리
                            </a>
                            <a class="nav-link" href="trip.action">
                            	<div class="sb-nav-link-icon"><img src="images/paper.png" height="23px;"></div>여행기 관리
                            </a>
                            <a class="nav-link" href="photo.action">
                            	<div class="sb-nav-link-icon"><img src="images/photo.png" height="23px;"></div>사진 관리
                            </a>
                            <a class="nav-link" href="comment.action">
                            	<div class="sb-nav-link-icon"><img src="images/comment.png" height="23px;"></div>댓글 관리
                            </a>
                            <a class="nav-link" href="report.action">
                            	<div class="sb-nav-link-icon"><img src="images/report.png" height="23px;"></div>신고관리
                            </a>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><img src="images/chart.png" height="23px;"></div>
                                통계 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse show" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="connectStats.action">접속자 통계</a>
                                    <a class="nav-link" href="memberStats.action" style="background-color: #2E9AFE; color: black;">회원 통계</a>
                                    <a class="nav-link" href="postStats.action">게시물 통계</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        관리자 페이지
                    </div>
                </nav>
            </div>
            
            <!-- 메인페이지 -->
            <div id="layoutSidenav_content">
                <main>
                     <div class="container-fluid px-4">
                     	<h1 class="mt-4">회원 통계</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Member Statistics</li>
                        </ol>
                     </div>
                 
                     <br>
                   	 <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                         가입방식 통계
                                         <input type="hidden" value="${joinMtd.leggo }" id="leggo">
                                         <input type="hidden" value="${joinMtd.naver }" id="naver">
                                         <input type="hidden" value="${joinMtd.kakao }" id="kakao">
                                         <input type="hidden" value="${joinMtd.google }" id="google">
                                    </div>
                                    <div class="card-body"><canvas id="joinBar-chart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        신규 회원 통계
                                        <c:set var="i" value="1"></c:set>
                                        <c:forEach var="joinSu" items="${joinDayList }">
                                        <input type="hidden" value="${joinSu.count }" id="joinDayList${i }">
                                        <c:set var="i" value="${i+1 }"></c:set>
                                        </c:forEach>
                                    </div>
                                    <div class="card-body"><canvas id="joinLine-chart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                     </div>
                     <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                신규 회원 데이터
                            </div>
                            <div class="card-body">
                            	<table id="datatablesSimple" style="text-align: center;">
                                    <thead>
                                    	<tr>
                                    		<th rowspan="2" style="text-align: center; vertical-align: middle;">번호</th>
                                            <th rowspan="2" style="text-align: center; vertical-align: middle;">회원가입 수</th>
                                            <th rowspan="2" style="text-align: center; vertical-align: middle;">가입일</th>
                                            <th colspan="4" style="text-align: center; vertical-align: middle;">가입방식</th>
                                    	</tr>
                                    	<tr>
                                    		<th style="text-align: center;">LEGGO</th>
                                    		<th style="text-align: center;">NAVER</th>
                                    		<th style="text-align: center;">KAKAO</th>
                                    		<th style="text-align: center;">GOOGLE</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    	<c:set var="count" value="${joinCount }"></c:set>
                                    	<c:forEach var="join" items="${joinList }">
                                    		<tr>
                                    		<td>${count }</td>
                                    		<c:set var="count" value="${count-1 }"></c:set>
                                            <td>${join.leggo+join.naver+join.kakao+join.google }</td>
                                            <td>${join.join_dt }</td>
                                            <td>${join.leggo }</td>
                                            <td>${join.naver }</td>
                                            <td>${join.kakao }</td>
                                            <td>${join.google }</td>
                                    		</tr>
                                    	</c:forEach>
                                    </tbody>
                                 </table>
                            </div>
                     </div>
                     
                     <br>
                     <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                         탈퇴 사유 통계
                                         <input type="hidden" value="${qrdRsn.rsn1 }" id="rsn1">
                                         <input type="hidden" value="${qrdRsn.rsn2 }" id="rsn2">
                                         <input type="hidden" value="${qrdRsn.rsn3 }" id="rsn3">
                                         <input type="hidden" value="${qrdRsn.rsn4 }" id="rsn4">
                                         <input type="hidden" value="${qrdRsn.rsn5 }" id="rsn5">
                                    </div>
                                    <div class="card-body"><canvas id="rsnDou-chart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        탈퇴 회원 통계
                                        <c:set var="i" value="1"></c:set>
                                        <c:forEach var="qrdSu" items="${qrdDayList }">
                                        <input type="hidden" value="${qrdSu.count }" id="qrdDayList${i }">
                                        <c:set var="i" value="${i+1 }"></c:set>
                                        </c:forEach>
                                    </div>
                                    <div class="card-body"><canvas id="qrdLine-chart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                     </div>
                     <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                탈퇴회원 데이터
                            </div>
                            <div class="card-body">
                            	<table id="datatables" style="border: 0.5px solid #EAEAEA; text-align: center;">
                                    <thead>
                                    	<tr>
                                    		<th rowspan="2" style="border: 1px solid #EAEAEA; font-size: 14px;">번호</th>
                                            <th rowspan="2" style="border: 1px solid #EAEAEA; font-size: 14px;">탈퇴회원 수</th>
                                            <th rowspan="2" style="border: 1px solid #EAEAEA; font-size: 14px;">탈퇴일</th>
                                            <th colspan="5" style="border: 1px solid #EAEAEA; font-size: 14px;">탈퇴사유</th>
                                    	</tr>
                                    	<tr>
                                    		<th style="border: 1px solid #EAEAEA; font-size: 14px;">이용빈도 낮음</th>
                                    		<th style="border: 1px solid #EAEAEA; font-size: 14px;">재가입</th>
                                    		<th style="border: 1px solid #EAEAEA; font-size: 14px;">콘텐츠 부족</th>
                                    		<th style="border: 1px solid #EAEAEA; font-size: 14px;">개인정보 보호</th>
                                    		<th style="border: 1px solid #EAEAEA; font-size: 14px;">기타</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    	<c:set var="count" value="${qrdCount }"></c:set>
                                    	<c:forEach var="qrd" items="${qrdList }">
                                    		<tr>
	                                    		<td style="border: 1px solid #EAEAEA; font-size: 14px;">${count }</td>
	                                    		<c:set var="count" value="${count-1 }"></c:set>
	                                            <td style="border: 1px solid #EAEAEA; font-size: 14px;">${qrd.rsn1+qrd.rsn2+qrd.rsn3+qrd.rsn4+qrd.rsn5 }</td>
	                                            <td style="border: 1px solid #EAEAEA; font-size: 14px;">${qrd.qrd_dt }</td>
	                                            <td style="border: 1px solid #EAEAEA; font-size: 14px;">${qrd.rsn1 }</td>
	                                            <td style="border: 1px solid #EAEAEA; font-size: 14px;">${qrd.rsn2 }</td>
	                                            <td style="border: 1px solid #EAEAEA; font-size: 14px;">${qrd.rsn3 }</td>
	                                            <td style="border: 1px solid #EAEAEA; font-size: 14px;">${qrd.rsn4 }</td>
	                                            <td style="border: 1px solid #EAEAEA; font-size: 14px;">${qrd.rsn5 }</td>
                                    		</tr>
                                    	</c:forEach>
                                    </tbody>
                                 </table>
                            </div>
                     </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%=cp%>/js/jes/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="<%=cp%>/js/jes/datatables-simple-demo.js"></script>
</body>
</html>