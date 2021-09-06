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
<title>ConnectStatistics - Leggo Admin</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jes/styles.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
	
		$(function()
		{
			var daySu1 = $("#dayList1").val();	//-- 5일전
			var daySu2 = $("#dayList2").val();	//-- 4일전
			var daySu3 = $("#dayList3").val();	//-- 3일전
			var daySu4 = $("#dayList4").val();	//-- 2일전
			var daySu5 = $("#dayList5").val();	//-- 1일전
			var daySu6 = $("#dayList6").val();	//-- 오늘
			
			var mychart = $("#bar-chart");
			var myBarChart = new Chart(mychart, {
			    type: 'bar',
			    data: {
			        labels: ['5일 전', '4일 전', '3일 전', '2일 전', '1일 전', '오늘'],
			        datasets: [{
			            label: '# of Visit',
			            data: [daySu1, daySu2, daySu3, daySu4, daySu5, daySu6],
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
			
			var time1 = ($("#timeList1").val()).substring(11);	//-- 6시간전 시간
			var time2 = ($("#timeList2").val()).substring(11);	//-- 5시간전 시간
			var time3 = ($("#timeList3").val()).substring(11);	//-- 4시간전 시간
			var time4 = ($("#timeList4").val()).substring(11);  //-- 3시간전 시간
			var time5 = ($("#timeList5").val()).substring(11);  //-- 2시간전 시간
			var time6 = ($("#timeList6").val()).substring(11);  //-- 1시간전 시간
			var time7 = ($("#timeList7").val()).substring(11);  //-- 현재 시간
			
			
			var timeSu1 = $("#suList1").val(); //-- 6시간전 접속 수
			var timeSu2 = $("#suList2").val();
			var timeSu3 = $("#suList3").val();
			var timeSu4 = $("#suList4").val();
			var timeSu5 = $("#suList5").val();
			var timeSu6 = $("#suList6").val();
			var timeSu7 = $("#suList7").val(); //-- 현재 시간 접속 수
			
			var mychart2 = $("#line-chart");
			var myLineChart = new Chart(mychart2, {
			    type: 'line',
			    data: {
			        labels: [time1, time2, time3, time4, time5, time6, time7],
			        datasets: [{
			            label: '# of Visit',
			            data: [
			            	timeSu1, timeSu2, timeSu3, timeSu4, timeSu5, timeSu6, timeSu7
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
		});
	
</script>
</head>
<body class="sb-nav-fixed">
       <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="admin.action"><img src="images/leggo.png" width="130px;"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
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
                                    <a class="nav-link" href="connectStats.action" style="background-color: #2E9AFE; color: black;">접속자 통계</a>
                                    <a class="nav-link" href="memberStats.action">회원 통계</a>
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
                     	<h1 class="mt-4">접속자 통계</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Connect Statistics</li>
                        </ol>
                     </div>
                 
                     <br>
                   	 <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                         요일별 접속자 통계
                                         <c:set var="i" value="0"></c:set>
                                         <c:forEach var="day" items="${dayList }">
                                         	<input type="hidden" value="${day.count }" id="dayList${i+1 }">
                                         	<c:set var="i" value="${i+1 }"></c:set>
                                         </c:forEach>
                                    </div>
                                    <div class="card-body"><canvas id="bar-chart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        시간별 접속자 통계
                                        <c:set var="i" value="0"></c:set>
                                        <c:forEach var="time" items="${timeList }">
                                        	<input type="hidden" value="${time.count }" id="suList${i+1 }">
                                        	<input type="hidden" value="${time.vi_dt }" id="timeList${i+1 }">
                                        	<c:set var="i" value="${i+1 }"></c:set>
                                        </c:forEach>
                                    </div>
                                    <div class="card-body"><canvas id="line-chart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                     </div>
                     <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                접속 수 데이터
                            </div>
                            <div class="card-body">
                            	<table id="datatablesSimple" style="text-align: center;">
                                    <thead>
                                    	<tr>
                                    		<th style="text-align: center;">번호</th>
                                            <th style="text-align: center;">접속자 IP</th>
                                            <th style="text-align: center;">접속일</th>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    	<!-- <tr>
                                    		<td>2</td>
                                            <td>0.0.0.0</td>
                                            <td>2021-07-05</td>
                                    	</tr>
                                    	<tr>
                                    		<td>1</td>
                                            <td>127.0.0.1</td>
                                            <td>2021-07-05</td>
                                    	</tr> -->
                                    	<c:set var="num" value="${totCount }"></c:set>
                                    	<c:forEach var="visi" items="${list }">
                                    		<tr>
	                                    		<td>${num }</td>
	                                    		<c:set var="num" value="${num-1 }"></c:set>
	                                            <td>${visi.vi_ip }</td>
	                                            <td>${visi.vi_dt }</td>
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